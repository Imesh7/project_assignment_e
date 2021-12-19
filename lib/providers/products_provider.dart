import 'package:flutter/cupertino.dart';
import 'package:project_assignment_e/models/product.dart';
import 'package:project_assignment_e/services/products_services.dart';

enum ApiStatus { loading, initial, completed, error }

class ProductProvider extends ChangeNotifier {
  List<Result> _productList = [];

  List<Result> _productListbyCategory = [];

  List<Result> get productList =>
      categorySelected == false ? _productList : _productListbyCategory;

  bool categorySelected = false;

  String? _categoryNameReceived;

  ApiStatus _apiDataStatus = ApiStatus.initial;

  ApiStatus get apidatastatus => _apiDataStatus;

  bool get isfavorite => _isFavorite;
  bool _isFavorite = false;
  
  //get the all products fetch from internet or from assets file.
  void getProducts() async {
    _apiDataStatus = ApiStatus.loading;

    _productList = await ProductServices().fetchProducts();

    _apiDataStatus = ApiStatus.completed;
    notifyListeners();
  }

  //filter products by category & show the item
  void filterByCate(String categoryName) {
    if (_categoryNameReceived != categoryName ||
        _categoryNameReceived == null) {
      categorySelected = true;
      _productListbyCategory = _productList
          .where((element) => element.category == categoryName)
          .toList();
      _categoryNameReceived = categoryName;
    } else {
      categorySelected = !categorySelected;
    }

    notifyListeners();
  }

  //search by the model name
  void searchByModel(String searchModelName) {
    categorySelected = true;

    _productListbyCategory = _productList
        .where((element) => element.model == searchModelName.toUpperCase())
        .toList();

    notifyListeners();
  }

  //make favorite in the details of the produvts screen heart icon
  void makeFavorite() {
    _isFavorite = !_isFavorite;

    notifyListeners();
  }
}
