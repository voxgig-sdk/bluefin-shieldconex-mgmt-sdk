<?php
declare(strict_types=1);

// BluefinShieldconexMgmt SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

BluefinShieldconexMgmtUtility::setRegistrar(function (BluefinShieldconexMgmtUtility $u): void {
    $u->clean = [BluefinShieldconexMgmtClean::class, 'call'];
    $u->done = [BluefinShieldconexMgmtDone::class, 'call'];
    $u->make_error = [BluefinShieldconexMgmtMakeError::class, 'call'];
    $u->feature_add = [BluefinShieldconexMgmtFeatureAdd::class, 'call'];
    $u->feature_hook = [BluefinShieldconexMgmtFeatureHook::class, 'call'];
    $u->feature_init = [BluefinShieldconexMgmtFeatureInit::class, 'call'];
    $u->fetcher = [BluefinShieldconexMgmtFetcher::class, 'call'];
    $u->make_fetch_def = [BluefinShieldconexMgmtMakeFetchDef::class, 'call'];
    $u->make_context = [BluefinShieldconexMgmtMakeContext::class, 'call'];
    $u->make_options = [BluefinShieldconexMgmtMakeOptions::class, 'call'];
    $u->make_request = [BluefinShieldconexMgmtMakeRequest::class, 'call'];
    $u->make_response = [BluefinShieldconexMgmtMakeResponse::class, 'call'];
    $u->make_result = [BluefinShieldconexMgmtMakeResult::class, 'call'];
    $u->make_point = [BluefinShieldconexMgmtMakePoint::class, 'call'];
    $u->make_spec = [BluefinShieldconexMgmtMakeSpec::class, 'call'];
    $u->make_url = [BluefinShieldconexMgmtMakeUrl::class, 'call'];
    $u->param = [BluefinShieldconexMgmtParam::class, 'call'];
    $u->prepare_auth = [BluefinShieldconexMgmtPrepareAuth::class, 'call'];
    $u->prepare_body = [BluefinShieldconexMgmtPrepareBody::class, 'call'];
    $u->prepare_headers = [BluefinShieldconexMgmtPrepareHeaders::class, 'call'];
    $u->prepare_method = [BluefinShieldconexMgmtPrepareMethod::class, 'call'];
    $u->prepare_params = [BluefinShieldconexMgmtPrepareParams::class, 'call'];
    $u->prepare_path = [BluefinShieldconexMgmtPreparePath::class, 'call'];
    $u->prepare_query = [BluefinShieldconexMgmtPrepareQuery::class, 'call'];
    $u->result_basic = [BluefinShieldconexMgmtResultBasic::class, 'call'];
    $u->result_body = [BluefinShieldconexMgmtResultBody::class, 'call'];
    $u->result_headers = [BluefinShieldconexMgmtResultHeaders::class, 'call'];
    $u->transform_request = [BluefinShieldconexMgmtTransformRequest::class, 'call'];
    $u->transform_response = [BluefinShieldconexMgmtTransformResponse::class, 'call'];
});
