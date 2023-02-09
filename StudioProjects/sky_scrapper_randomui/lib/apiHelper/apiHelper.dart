import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sky_scrapper_randomui/modals/global.dart';

class apiHelper {
  apiHelper._();

  static final apiHelper api = apiHelper._();


  fetchRandomData() async {
    http.Response res = await http.get(
      Uri.parse('https://randomuser.me/api/#'),
    );

    if (res.statusCode == 200) {
      var decodedCode = jsonDecode(res.body);
      global ranData = global.fromMap(data: decodedCode);
      return ranData;
    }
  }
}
