import 'package:get/get.dart';

import '../../../utils/home_helper.dart';
import '../model/home_model.dart';

class HomeController extends GetxController
{
  RxInt index = 0.obs;
  RxInt number = 1.obs;

  RxList marks = [].obs;
  Future<Animal> QuizApi()
  async {

    ApiHelper apiHelper = ApiHelper();
    Animal a1 = await apiHelper.apicall();

    return a1;
  }
}