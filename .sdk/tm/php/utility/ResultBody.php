<?php
declare(strict_types=1);

// BluefinShieldconexMgmt SDK utility: result_body

class BluefinShieldconexMgmtResultBody
{
    public static function call(BluefinShieldconexMgmtContext $ctx): ?BluefinShieldconexMgmtResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
