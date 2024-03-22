import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/command_model.dart';
import './commande_details_controller.dart';

class CommandeDetailsView extends GetView<CommandeDetailsController> {
  CommandeDetailsView({super.key});
  CommandModel commandeModel = Get.arguments["commande"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CommandeDetailsController>(
        builder: (controller) {
          return const Center(
            child: Text("commande_detailsView"),
          );
        },
      ),
    );
  }
}
