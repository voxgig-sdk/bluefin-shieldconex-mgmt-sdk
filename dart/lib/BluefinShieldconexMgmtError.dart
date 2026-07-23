class BluefinShieldconexMgmtError extends Error {
  final bool isBluefinShieldconexMgmtError = true;

  final String sdk = 'BluefinShieldconexMgmt';

  String code;
  String message;
  dynamic ctx;

  // Populated by makeError with the (cleaned) result and spec.
  dynamic result;
  dynamic spec;

  BluefinShieldconexMgmtError(this.code, this.message, [this.ctx]);

  @override
  String toString() => 'BluefinShieldconexMgmtError: ' + code + ': ' + message;
}
