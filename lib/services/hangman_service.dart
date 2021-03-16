import 'dart:convert' as convert;
import 'dart:math';

import 'package:hangman/services/api_category.dart';
import 'package:http/http.dart' as http;

import 'api_text.dart';

class HangmanService {
  static final HangmanService INSTANCE = HangmanService();

  static final String AUTHORITY = 'esighclouddemo.appspot.com';
  static final String CATEGORIES_URL = '/api/v1/categories';

  List<ApiCategory> categories = [];
  String selectedCategoryUuid;
  List<ApiText> entries = [];

  Future<void> loadCategories() async {
    try {
      Uri url = Uri.https(AUTHORITY, CATEGORIES_URL);

      // API call
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> resp = convert.jsonDecode(response.body);
        List array = resp['content'];

        this.categories = array.map((it) => ApiCategory.fromJson(it)).toList();
        this.selectedCategoryUuid = this.categories[0].uuid;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed: ${e.toString()}');
    }
  }

  Future<void> loadData() async {
    try {
      String entriesUrl = '$CATEGORIES_URL/$selectedCategoryUuid/texts';
      Uri url = Uri.https(AUTHORITY, entriesUrl);

      // API call
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> resp = convert.jsonDecode(response.body);
        List array = resp['content'];
        this.entries = array.map((it) => ApiText.fromJson(it)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed: ${e.toString()}');
    }
  }

  ApiText shuffle() {
    int i = Random().nextInt(entries.length);
    return entries.elementAt(i);
  }
}
