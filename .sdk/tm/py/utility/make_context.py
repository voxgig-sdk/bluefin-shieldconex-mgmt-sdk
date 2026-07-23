# BluefinShieldconexMgmt SDK utility: make_context

from core.context import BluefinShieldconexMgmtContext


def make_context_util(ctxmap, basectx):
    return BluefinShieldconexMgmtContext(ctxmap, basectx)
