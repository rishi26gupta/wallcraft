import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/Image.dart';

class Helper {
  static const String url = "https://api.pexels.com/v1/";
  static const String key =
      "Dkv18GyTSpu99QcIUvqpGAl5j5epc6NEwONuPGPtbWUkev9XVQJNc9jR";

  static Future<List<Imagee>> getPage(int page) async {
    var route = "curated?page=${page}&per_page=20";

    print("PAGEEEEEEEEEEEEEEEEEEEEEE" + page.toString());
    List<Imagee> tempList = [];
    var uri = Uri.parse(url + route);

    var response = await http.get(uri, headers: {'Authorization': key});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body.toString()) as Map<String, dynamic>;
      for (int i = 0; i < json['per_page']; i++) {
        Imagee temp = await Imagee.fromJson(json['photos'][i]);
        tempList.add(temp);
      }

      return tempList;
    } else if (response.statusCode == 429) {
      print("THISSSSSSS IS    CAUSEINGGGGGGGGG ERRORRRRRRRRRR");
      await Future.delayed(Duration(seconds: 8));
      getPage(page);
    } else {
      //something went wrong
    }
    return tempList;
  }

  static Future<List<Imagee>> getPageBySearch(String query, int page) async {
    var route = "search?query=${query}&per_page=20&page=${page}";

    print("PAGEEEEEEEEEEEEEEEEEEEEEE" + page.toString());
    List<Imagee> tempList = [];
    var uri = Uri.parse(url + route);

    var response = await http.get(uri, headers: {'Authorization': key});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body.toString()) as Map<String, dynamic>;

      for (int i = 0; i < (json['per_page'] == 1 ? 0 : json['per_page']); i++) {
        Imagee temp = await Imagee.fromJson(json['photos'][i]);
        tempList.add(temp);
      }
      return tempList;
    } else if (response.statusCode == 429) {
      await Future.delayed(Duration(seconds: 8));
      getPageBySearch(query, page);
    } else {}
    return tempList;
  }
}
