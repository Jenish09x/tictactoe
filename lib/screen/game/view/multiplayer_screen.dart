import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';

class MultiplayerScreen extends StatefulWidget {
  const MultiplayerScreen({super.key});

  @override
  State<MultiplayerScreen> createState() => _MultiplayerScreenState();
}

class _MultiplayerScreenState extends State<MultiplayerScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.50,
                child: GridView.builder(
                  itemCount: controller.gridList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (controller.gridList[index].isEmpty &&
                            controller.winner.value.isEmpty) {
                          controller.gridList[index] = 'X';
                          controller.player.value++;
                          controller.checkForWinner();
                          // controller.checkBotMove();
                          if (controller.winner.value.isEmpty) {
                            if (controller.player.value == 1) {
                              controller.botMove();
                            } else {
                              controller.checkBotWin();
                            }
                          }
                        }
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${controller.gridList[index]}",
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
              Text(
                "Winner ${controller.winner.value}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.reset();
                },
                child: const Text("Re Play"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
