import 'package:car_images_app/src/feature/main/view_model/data/repository/main_repo.dart';
import 'package:flutter/cupertino.dart';

import '../data/entity/get_cars.dart';

class MainVm with ChangeNotifier{

  List<CarModel> carList = [];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  String param = "model";

  MainVm(){
    scrollController.addListener(getScrollEnd);
  }

  void getScrollEnd()async{
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      isLoading = true;
      notifyListeners();
      await getData();
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getData()async{
    List<CarModel> newImages = await MainRepo().getAllImages(param: param, ) ?? [];
    carList.addAll(newImages);
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.removeListener(getScrollEnd);
    scrollController.dispose();
    super.dispose();
  }
}