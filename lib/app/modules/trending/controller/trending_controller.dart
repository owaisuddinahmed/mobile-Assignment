import 'package:get/get.dart';
import 'package:mobile_assignment/app/modules/trending/model/trending_model.dart';
import 'package:mobile_assignment/app/services/base_client.dart';
import 'package:mobile_assignment/app/utils/api_utils.dart';
import 'package:mobile_assignment/app/utils/utils.dart';

class TrendingController extends GetxController {
  Rx<TrendingModel> trendingModel = TrendingModel().obs;

  RxBool trendingError = false.obs;
  RxBool showShimmer = false.obs;

  @override
  void onInit() {
    getTrending();
    super.onInit();
  }

  Future<void> getTrending() async {
    showShimmer.value= true;
    Utils.check().then(
      (value)async {
        if (value) {
          await BaseClient.get(
            ApiUtils.trendingUrl,
            onSuccess: (response) {
              print('resources: ${response.data}');
              trendingModel.value = TrendingModel.fromJson(response.data);
              print("Here${trendingModel.value.items?.first.fullName}");
              showShimmer.value = false;
              trendingError.value = false;
            },
            onError: (error) {
              trendingError = true.obs;
              showShimmer.value = false;
              print('Error here ==> ${error.message}');
            },
          );
        }else{
          trendingError = true.obs;
          showShimmer.value= false;
          print('No internet');
        }
      });
  }
}
