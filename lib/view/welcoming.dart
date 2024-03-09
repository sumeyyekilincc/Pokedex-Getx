import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/resources/r.dart';
import 'package:pokedex/view/dashboard.dart';

class Welcoming extends StatefulWidget {
  const Welcoming({super.key});

  @override
  State<Welcoming> createState() => _WelcomingState();
}

class _WelcomingState extends State<Welcoming> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(
          Dashboard(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.to(() => Dashboard());
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: R.appColor.clr.appBar),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                R.drawable.img1.pokeball,
                height: 150,
              ),
              Image.asset(
                R.drawable.img1.pokedexLogo,
                height: 150,
                width: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
