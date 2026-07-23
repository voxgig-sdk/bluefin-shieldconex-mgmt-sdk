<?php
declare(strict_types=1);

// BluefinShieldconexMgmt SDK utility: result_headers

class BluefinShieldconexMgmtResultHeaders
{
    public static function call(BluefinShieldconexMgmtContext $ctx): ?BluefinShieldconexMgmtResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
