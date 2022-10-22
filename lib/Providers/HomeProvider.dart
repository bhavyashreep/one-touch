import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_touch/model/category.dart';
import 'package:one_touch/infrastructure/Api/api.dart';




class HomeProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isexist = false;
  var isFirstLogin;
  Welcome homePageData = Welcome(categories: [], offers: []);


  

  Future<void> checkIsFirtInstalling() async {
    final viewData = await SharedPreferences.getInstance();
    final view = viewData.getBool('isFirstInstall');
    isFirstLogin = view;
    // notifyListeners();
    print("view $view");
  }

  Future<void> setIsFirtInstalling() async {
    final viewData = await SharedPreferences.getInstance();
    viewData.setBool("isFirstInstall", false);
    print("object");
  }
Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    var data = await getCateoriesOffers();
    homePageData = data;
    isLoading = false;

    notifyListeners();
  }

  // Future<void> checkUserExist(mobile) async {
  //   isLoading = true;
  //   notifyListeners();

  //   var data = await isUserExist(mobile);
  //   // itemDetils = data;
  //   isLoading = false;
  //   isexist = data.exist;
  //   print("userrrrrr-_______${data.exist}");

  //   notifyListeners();
  // }

  
}
