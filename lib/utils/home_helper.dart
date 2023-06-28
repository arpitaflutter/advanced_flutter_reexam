import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screens/home/model/home_model.dart';

class ApiHelper
{
  Future<Animal> apicall()
  async {
    String link = "https://opentdb.com/api.php?amount=10&category=27&difficulty=easy&type=multiple";

    Uri uri = Uri.parse(link);

    var response = await http.get(uri);

    var json = jsonDecode(response.body);

    Animal a1= Animal.fromJson(json);

    return a1;

  }
}