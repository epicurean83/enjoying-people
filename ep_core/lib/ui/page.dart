import 'package:get/get.dart';

mixin UIPage<T> {
  void exit([T? result]) => Get.back(result: result);
}
