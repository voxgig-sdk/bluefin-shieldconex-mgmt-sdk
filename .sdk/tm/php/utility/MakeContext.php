<?php
declare(strict_types=1);

// BluefinShieldconexMgmt SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class BluefinShieldconexMgmtMakeContext
{
    public static function call(array $ctxmap, ?BluefinShieldconexMgmtContext $basectx): BluefinShieldconexMgmtContext
    {
        return new BluefinShieldconexMgmtContext($ctxmap, $basectx);
    }
}
