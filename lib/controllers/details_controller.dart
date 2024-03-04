import 'package:get/get.dart';
import '../modals/all_pokemons_modal.dart';

class DetailController extends GetxController {
  final Rx<Pokemon> _selectedPoke = Pokemon().obs;
  Pokemon? get selectedPoke => _selectedPoke.value;
  RxBool isBusy = false.obs;

  @override
  void onReady() {
    super.onReady();
    ready();
  }

  ready() async {
    if (Get.arguments != null) {
      if (Get.arguments[0] != null) {
        _selectedPoke.value = Get.arguments[0] ;
      }
    }
  }
}
