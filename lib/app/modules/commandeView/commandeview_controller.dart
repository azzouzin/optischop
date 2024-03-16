import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/command_model.dart';

import '../../data/remote/api_call_status.dart';

class CommandeViewController extends GetxController {
  // hold data coming from api
  RxList commandesList = [].obs;

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // getting data from api
  getData() async {
    //todo Get Commandes From FireBase
  }

  addcommande(CommandModel commandModel) {
    commandesList.add(commandModel);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
