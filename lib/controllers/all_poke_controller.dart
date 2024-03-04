import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:pokedex/resources/constants.dart';
import 'package:pokedex/resources/extentions.dart';
import 'package:pokedex/view/widgets/dialogs.dart';
import '../modals/all_pokemons_modal.dart';
import 'package:http/http.dart' as http;

class AllPokeController extends GetxController {
  final Rx<AllPokes> _allPokeModel = AllPokes().obs;
  AllPokes? get allPokeModal => _allPokeModel.value;
  RxBool isBusy = false.obs;
  List<String> types = [];
  
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await fetchAllPoke(Get.context);
  }

  fetchAllPoke(context) async {
    isBusy.value = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.hasInternetConnection) {
      try {
        var response = await http.get(
          Uri.parse(ApiEndpoints.allPoke),
        );
        if (response.statusCode == 200) {
          var parsed = json.decode(response.body);

          _allPokeModel.value = AllPokes.fromJson(parsed);
        }
      } catch (_) {}
    } else {
      getDialogNewtworkConnectionFailed(context);
    }
    isBusy.value = false;
  }

 
}
