import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_02/model/home_model.dart';


class ApiServicePage {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<HomeModel>> fetchCategory() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> productslist = jsonResponse['products'];

      return productslist
          .map((product) => HomeModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  fetchCatfetegories() {}
}
