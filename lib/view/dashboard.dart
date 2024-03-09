import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/resources/r.dart';
import 'package:pokedex/controllers/all_poke_controller.dart';
import 'package:pokedex/view/detail.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  AllPokeController allPokeController = Get.put(AllPokeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Container(
            decoration: BoxDecoration(color: R.appColor.clr.appBar),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: Image.asset(
                          R.drawable.img1.pokeball,
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Text(
                        "Pokédex",
                        style: TextStyle(
                            fontSize: R.dimens.dashboardHeaderSize,
                            color: R.appColor.clr.heading,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: R.appColor.clr.neutralColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: allPokeController.isBusy.value == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 1,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 1),
                              itemCount: allPokeController
                                      .allPokeModal?.pokemon?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => DetailPage(),
                                    arguments: [
                                      allPokeController
                                          .allPokeModal?.pokemon?[index],
                                    ],
                                  );
                                },
                                child: Card(
                                  elevation: 3,
                                  color: R.appColor.clr.greyColor2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 108,
                                          width: 108,
                                          child: Image.network(
                                            allPokeController.allPokeModal
                                                    ?.pokemon?[index].img ??
                                                R.drawable.img1.noImage,
                                            fit: BoxFit.fill,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              } else {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: R.appColor.clr
                                                        .defaultColor,
                                                  ),
                                                );
                                              }
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return SizedBox(
                                                height: 100,
                                                width: 100,
                                                child: Image.asset(
                                                  R.drawable.img1.noImage,
                                                  fit: BoxFit.fill,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            allPokeController.allPokeModal
                                                    ?.pokemon?[index].name ??
                                                "**",
                                            style: TextStyle(
                                              color:
                                                  R.appColor.clr.defaultColor,
                                              fontSize:
                                                  R.dimens.dashboardDetailSize,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
