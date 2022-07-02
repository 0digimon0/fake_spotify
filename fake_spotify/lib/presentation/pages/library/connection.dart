/// Connection is an enum of supported network states
enum Connection {
  /// When connection state is [Constants.wifi]
  wifi,

  /// When connection state is [Constants.cellular]
  cellular,

  /// When connection state is [Constants.disconnected]
  disconnected,

  /// When connection state is [Constants.unknown]
  unknown
}
