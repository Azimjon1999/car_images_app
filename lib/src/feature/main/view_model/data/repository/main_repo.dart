import 'package:car_images_app/riverpod.dart';
import 'package:car_images_app/src/feature/main/view_model/data/entity/get_cars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/api/api_constants.dart';

final mainFetchData = FutureProvider((ref){
  final getResult = ref.read(mainVM);
  return getResult.getData();
});

final class MainRepo{
  Future<List<CarModel>?> getAllImages({required String param,})async{
    String? result = await DioService.getData( ApiConstants.apiCars, ApiConstants.paramGetModel(model: param));
    if(result != null){
      List<CarModel> getAllCArs = carModelFromJson(result);
      return getAllCArs;
    }else{
      return null;
    }
  }
}