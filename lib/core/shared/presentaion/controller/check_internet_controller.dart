import "dart:async";

import "package:connectivity_plus/connectivity_plus.dart";
import "package:get/get.dart";
import "package:just_movie/core/utils/library/data_connection_checked/data_connection_checker.dart";

class CheckInternetController extends GetxController {
  RxBool isConnected = false.obs;
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectionStream;
  StreamSubscription? dataConnectionStream;
  DataConnectionChecker dataConnectionChecker = DataConnectionChecker();

  @override
  Future<void> onInit() async {
    await init();
    super.onInit();
  }

  Future<void> init() async {
    connectivity.checkConnectivity().then((result) async {
      if (result.contains(ConnectivityResult.none)) {
        /// Connection is not available
        isConnected.value = false;
      } else {
        // isConnected.value = true;

        /// Connection is available
        await dataConnectionChecker.hasConnection
            ? isConnected.value = true
            : isConnected.value = false;
      }
    });
    connectionStream = connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        /// Connection is not available
        isConnected.value = false;
      } else {
        /// Connection is available
        if (!result.contains(ConnectivityResult.mobile)) {
          dataConnectionStream =
              dataConnectionChecker.onStatusChange.listen((status) {
            switch (status) {
              case DataConnectionStatus.connected:
                isConnected.value = true;
                break;
              case DataConnectionStatus.disconnected:
                isConnected.value = false;
                break;
            }
          });
        } else {
          /// Connected and not on wifi
          isConnected.value = true;
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    if (connectionStream != null) {
      connectionStream!.cancel();
    }
    if (dataConnectionStream != null) {
      dataConnectionStream!.cancel();
    }
  }
}
