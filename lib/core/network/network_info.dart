import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/routes/app_routes.dart';


// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {

  late final PrefUtils _prefUtils;

  Connectivity connectivity;

  NetworkInfo(this.connectivity) {
    connectivity = this.connectivity;
    connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _prefUtils = PrefUtils();
  }

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      print("connection is on");
      return true;
    }
    print("connection is off");
    return false;
  }

  // to check type of internet connectivity
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      _prefUtils.setErrorType("networkConnection");
      Get.toNamed(
        AppRoutes.errorScreen,
      );
    }
  }
}
