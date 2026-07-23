# BluefinShieldconexMgmt SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

BluefinShieldconexMgmtUtility.registrar = ->(u) {
  u.clean = BluefinShieldconexMgmtUtilities::Clean
  u.done = BluefinShieldconexMgmtUtilities::Done
  u.make_error = BluefinShieldconexMgmtUtilities::MakeError
  u.feature_add = BluefinShieldconexMgmtUtilities::FeatureAdd
  u.feature_hook = BluefinShieldconexMgmtUtilities::FeatureHook
  u.feature_init = BluefinShieldconexMgmtUtilities::FeatureInit
  u.fetcher = BluefinShieldconexMgmtUtilities::Fetcher
  u.make_fetch_def = BluefinShieldconexMgmtUtilities::MakeFetchDef
  u.make_context = BluefinShieldconexMgmtUtilities::MakeContext
  u.make_options = BluefinShieldconexMgmtUtilities::MakeOptions
  u.make_request = BluefinShieldconexMgmtUtilities::MakeRequest
  u.make_response = BluefinShieldconexMgmtUtilities::MakeResponse
  u.make_result = BluefinShieldconexMgmtUtilities::MakeResult
  u.make_point = BluefinShieldconexMgmtUtilities::MakePoint
  u.make_spec = BluefinShieldconexMgmtUtilities::MakeSpec
  u.make_url = BluefinShieldconexMgmtUtilities::MakeUrl
  u.param = BluefinShieldconexMgmtUtilities::Param
  u.prepare_auth = BluefinShieldconexMgmtUtilities::PrepareAuth
  u.prepare_body = BluefinShieldconexMgmtUtilities::PrepareBody
  u.prepare_headers = BluefinShieldconexMgmtUtilities::PrepareHeaders
  u.prepare_method = BluefinShieldconexMgmtUtilities::PrepareMethod
  u.prepare_params = BluefinShieldconexMgmtUtilities::PrepareParams
  u.prepare_path = BluefinShieldconexMgmtUtilities::PreparePath
  u.prepare_query = BluefinShieldconexMgmtUtilities::PrepareQuery
  u.result_basic = BluefinShieldconexMgmtUtilities::ResultBasic
  u.result_body = BluefinShieldconexMgmtUtilities::ResultBody
  u.result_headers = BluefinShieldconexMgmtUtilities::ResultHeaders
  u.transform_request = BluefinShieldconexMgmtUtilities::TransformRequest
  u.transform_response = BluefinShieldconexMgmtUtilities::TransformResponse
}
