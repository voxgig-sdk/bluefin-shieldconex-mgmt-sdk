-- Generated model-driven entity + direct tests.
{-# LANGUAGE ScopedTypeVariables #-}

module SdkGenTests (genTests) where

import Control.Exception (SomeException, try)
import Data.IORef

import VoxgigStruct (Value (..), emptyMap, keysof, ismap, islist, isNoval, clone)
import SdkTypes
import SdkHelpers
import qualified SdkFeatures as F
import qualified SdkClient as C
import qualified TReadmeExamples
import Testutil
import TestJson (jsonRead)

-- Load an entity fixture (../.sdk/test/entity/<name>/<Name>TestData.json).
loadFixture :: String -> IO Value
loadFixture entName = do
  let lname = map toLowerCh entName
  raw <- readFile ("../.sdk/test/entity/" ++ lname ++ "/" ++ entName ++ "TestData.json")
  jsonRead raw
  where toLowerCh ch = if ch >= 'A' && ch <= 'Z' then toEnum (fromEnum ch + 32) else ch

-- The first new-ref data map for an entity (fixture.new.<entity>.<ref0>).
newRefData :: Value -> String -> IO Value
newRefData fixture entName = do
  newEnts <- getpathS fixture ("new." ++ entName)
  refs <- keysof newEnts
  case refs of
    [] -> emptyMap
    (r0 : _) -> do d <- getp newEnts r0; clone d

genTests :: Counters -> IO ()
genTests c = do
  TReadmeExamples.tests c
  clientInstanceTest c
  clientBasicTest c
  clientDirectTest c
  clientStreamTest c
  cloneInstanceTest c
  cloneBasicTest c
  cloneDirectTest c
  partnerInstanceTest c
  partnerBasicTest c
  partnerDirectTest c
  partnerStreamTest c
  templateInstanceTest c
  templateBasicTest c
  templateDirectTest c
  templateStreamTest c
  transactionInstanceTest c
  transactionBasicTest c
  transactionDirectTest c
  transactionStreamTest c
  update_resultInstanceTest c
  update_resultBasicTest c
  update_resultDirectTest c
  update_resultStreamTest c
  userInstanceTest c
  userBasicTest c
  userDirectTest c

clientInstanceTest :: Counters -> IO ()
clientInstanceTest c = runTest c "client.instance" $ do
  sdk <- C.testSdk0
  ent <- C.client sdk VNoval
  pure (eName ent == "client")

clientBasicTest :: Counters -> IO ()
clientBasicTest c = do
  fixture <- loadFixture "Client"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "client.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "client.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    entmap <- getp existing "client"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "client.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    d <- newRefData fixture "client"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "client.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    d <- newRefData fixture "client"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

clientDirectTest :: Counters -> IO ()
clientDirectTest c = runTest c "client.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/client/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

clientStreamTest :: Counters -> IO ()
clientStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("client", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "client.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "client.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "client.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.client sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "client.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.client sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

cloneInstanceTest :: Counters -> IO ()
cloneInstanceTest c = runTest c "clone.instance" $ do
  sdk <- C.testSdk0
  ent <- C.clone sdk VNoval
  pure (eName ent == "clone")

cloneBasicTest :: Counters -> IO ()
cloneBasicTest c = do
  fixture <- loadFixture "Clone"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "clone.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.clone sdk VNoval
    d <- newRefData fixture "clone"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

cloneDirectTest :: Counters -> IO ()
cloneDirectTest c = runTest c "clone.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/clone/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

partnerInstanceTest :: Counters -> IO ()
partnerInstanceTest c = runTest c "partner.instance" $ do
  sdk <- C.testSdk0
  ent <- C.partner sdk VNoval
  pure (eName ent == "partner")

partnerBasicTest :: Counters -> IO ()
partnerBasicTest c = do
  fixture <- loadFixture "Partner"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "partner.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "partner.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    entmap <- getp existing "partner"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "partner.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    d <- newRefData fixture "partner"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

partnerDirectTest :: Counters -> IO ()
partnerDirectTest c = runTest c "partner.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/partner/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

partnerStreamTest :: Counters -> IO ()
partnerStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("partner", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "partner.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "partner.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "partner.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.partner sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "partner.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.partner sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

templateInstanceTest :: Counters -> IO ()
templateInstanceTest c = runTest c "template.instance" $ do
  sdk <- C.testSdk0
  ent <- C.template sdk VNoval
  pure (eName ent == "template")

templateBasicTest :: Counters -> IO ()
templateBasicTest c = do
  fixture <- loadFixture "Template"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "template.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.template sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "template.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.template sdk VNoval
    entmap <- getp existing "template"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "template.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.template sdk VNoval
    d <- newRefData fixture "template"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "template.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.template sdk VNoval
    d <- newRefData fixture "template"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

templateDirectTest :: Counters -> IO ()
templateDirectTest c = runTest c "template.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/template/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

templateStreamTest :: Counters -> IO ()
templateStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("template", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "template.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.template sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "template.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.template sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "template.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.template sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "template.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.template sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

transactionInstanceTest :: Counters -> IO ()
transactionInstanceTest c = runTest c "transaction.instance" $ do
  sdk <- C.testSdk0
  ent <- C.transaction sdk VNoval
  pure (eName ent == "transaction")

transactionBasicTest :: Counters -> IO ()
transactionBasicTest c = do
  fixture <- loadFixture "Transaction"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "transaction.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "transaction.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    entmap <- getp existing "transaction"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

transactionDirectTest :: Counters -> IO ()
transactionDirectTest c = runTest c "transaction.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/transaction/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

transactionStreamTest :: Counters -> IO ()
transactionStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("transaction", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "transaction.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "transaction.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "transaction.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.transaction sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "transaction.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.transaction sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

update_resultInstanceTest :: Counters -> IO ()
update_resultInstanceTest c = runTest c "update_result.instance" $ do
  sdk <- C.testSdk0
  ent <- C.update_result sdk VNoval
  pure (eName ent == "update_result")

update_resultBasicTest :: Counters -> IO ()
update_resultBasicTest c = do
  fixture <- loadFixture "UpdateResult"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "update_result.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "update_result.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    d <- newRefData fixture "update_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "update_result.update" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    d <- newRefData fixture "update_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    upd <- jo [("id", cid), ("0", VStr "UpdatedMark")]
    ctrl2 <- emptyMap
    updated <- eUpdate ent upd ctrl2
    uv <- getp updated "0"
    pure (ismap updated && vstring uv == "UpdatedMark")

update_resultDirectTest :: Counters -> IO ()
update_resultDirectTest c = runTest c "update_result.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/update_result/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

update_resultStreamTest :: Counters -> IO ()
update_resultStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("update_result", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "update_result.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "update_result.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "update_result.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.update_result sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "update_result.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.update_result sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

userInstanceTest :: Counters -> IO ()
userInstanceTest c = runTest c "user.instance" $ do
  sdk <- C.testSdk0
  ent <- C.user sdk VNoval
  pure (eName ent == "user")

userBasicTest :: Counters -> IO ()
userBasicTest c = do
  fixture <- loadFixture "User"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "user.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.user sdk VNoval
    entmap <- getp existing "user"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

userDirectTest :: Counters -> IO ()
userDirectTest c = runTest c "user.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/user/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)
