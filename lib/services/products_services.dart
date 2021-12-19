import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:project_assignment_e/models/product.dart';

class ProductServices {
  Future<List<Result>> fetchProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/get-products.json');

      final product = productFromJson(response);

      //TODO: I didn't use the url, because the images background is white color, so that effects to the real ui given to me in the assignment.So I am using the json file inside the projects assets file & I made some changes in the "image".what I did was remove the background of the image & upload to a image uploading server.

      /* http.Response response = await http.get(
          Uri.parse(
              "https://run.mocky.io/v3/919a0d45-c054-4452-8175-65538e554272"),
          headers: {"content-type": "application/json"}); 

      print(response.body);
      final product = productFromJson(response.body);*/

      print('product.result ${product.result}');
      return product.result!;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
