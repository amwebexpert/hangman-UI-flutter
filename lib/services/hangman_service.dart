import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'api_text.dart';

class HangmanService {
  static final HangmanService INSTANCE = HangmanService();

  static final String AUTHORITY = 'esighclouddemo.appspot.com';
  static final String CATEGORIES_URL = '/api/v1/categories';

  List<ApiText> entries = [];

  Future<void> loadData() async {
    try {
      String categoryUuid = '64d28a1e-24cf-40f7-a6f1-3a76fd534639';
      String entriesUrl = '$CATEGORIES_URL/$categoryUuid/texts';
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
}
