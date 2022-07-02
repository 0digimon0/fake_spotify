import 'package:fake_spotify/constant/conectivity_constant.dart';

import '../presentation/pages/library/connection.dart';

class Utils {
  /// converts the network events to the appropriate values of
  /// the [Connection] enum
  static Connection intToConnection(int connectionInt) {
    var connection = Connection.unknown;
    switch (connectionInt) {
      case ConnectivityConstant.wifi:
        connection = Connection.wifi;
        break;
      case ConnectivityConstant.cellular:
        connection = Connection.cellular;
        break;
      case ConnectivityConstant.disconnected:
        connection = Connection.disconnected;
        break;
      case ConnectivityConstant.unknown:
        connection = Connection.unknown;
        break;
    }
    return connection;
  }
}
