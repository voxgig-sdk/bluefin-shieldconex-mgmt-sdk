package voxgig.bluefinshieldconexmgmtsdk.utility;

import java.util.LinkedHashMap;
import java.util.Map;

import voxgig.bluefinshieldconexmgmtsdk.core.Context;
import voxgig.bluefinshieldconexmgmtsdk.core.Helpers;
import voxgig.bluefinshieldconexmgmtsdk.core.Response;
import voxgig.bluefinshieldconexmgmtsdk.core.Result;

final class ResultHeaders {

  private ResultHeaders() {}

  static Result resultHeaders(Context ctx) {
    Response response = ctx.response;
    Result result = ctx.result;

    if (result != null) {
      if (response != null && response.headers != null) {
        Map<String, Object> hm = Helpers.toMapAny(response.headers);
        if (hm != null) {
          result.headers = hm;
        }
        else {
          result.headers = new LinkedHashMap<>();
        }
      }
      else {
        result.headers = new LinkedHashMap<>();
      }
    }

    return result;
  }
}
