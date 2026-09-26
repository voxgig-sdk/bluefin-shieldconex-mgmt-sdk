"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BluefinShieldconexMgmtError = void 0;
class BluefinShieldconexMgmtError extends Error {
    isBluefinShieldconexMgmtError = true;
    sdk = 'BluefinShieldconexMgmt';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.BluefinShieldconexMgmtError = BluefinShieldconexMgmtError;
//# sourceMappingURL=BluefinShieldconexMgmtError.js.map