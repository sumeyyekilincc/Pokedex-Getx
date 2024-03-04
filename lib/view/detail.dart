import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/details_controller.dart';
import 'package:pokedex/resources/r.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({super.key});
  DetailController detailController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.drawable.img1.pokeballBack),
                  fit: BoxFit.contain),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "#"
                            "${detailController.selectedPoke?.num.toString()} ",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: R.appColor.clr.defaultColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            shape: BoxShape.circle),
                        child: detailController.selectedPoke?.img == null
                            ? CircularProgressIndicator(
                                color: R.appColor.clr.errorColor,
                              )
                            : Image.network(
                                detailController.selectedPoke?.img ??
                                    R.drawable.img1.noImage,
                                scale: 0.5,
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: R.appColor.clr.greyColor,
                            offset: const Offset(0, 1),
                            spreadRadius: 5,
                            blurRadius: 18)
                      ],
                      color: R.appColor.clr.redColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: detailController.selectedPoke?.name
                                          .toString() ??
                                      "--",
                                  style: TextStyle(
                                    fontSize: R.dimens.detailHeaderSize,
                                    letterSpacing: 3,
                                    color: R.appColor.clr.neutralColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nType: ",
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    fontWeight: FontWeight.bold,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: detailController.selectedPoke?.type
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nCandy: ",
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    fontWeight: FontWeight.bold,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: detailController.selectedPoke?.candy
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nHeight: ",
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    fontWeight: FontWeight.bold,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: detailController.selectedPoke?.height
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nWeight: ",
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    fontWeight: FontWeight.bold,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: detailController.selectedPoke?.weight
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nWeaknesses: ",
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    fontWeight: FontWeight.bold,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: detailController
                                      .selectedPoke?.weaknesses
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nEgg: ",
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    fontWeight: FontWeight.bold,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                                TextSpan(
                                  text: detailController.selectedPoke?.egg
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: R.dimens.detailSize,
                                    color: R.appColor.clr.neutralColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
