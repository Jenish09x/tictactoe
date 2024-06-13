import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screen/game/view/game_screen.dart';
import 'package:tic_tac_toe/screen/game/view/multiplayer_screen.dart';
import 'package:tic_tac_toe/screen/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => const GameScreen(),
                      transition: Transition.circularReveal);
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  width: MediaQuery.sizeOf(context).height * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.amber, Colors.yellowAccent],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Play With Friend's",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Get.to(() => const MultiplayerScreen(),
                      transition: Transition.circularReveal);
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  width: MediaQuery.sizeOf(context).height * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.amber, Colors.yellowAccent],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Single Play",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
