<?php
declare(strict_types=1);

// BluefinShieldconexMgmt SDK utility: prepare_body

class BluefinShieldconexMgmtPrepareBody
{
    public static function call(BluefinShieldconexMgmtContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
