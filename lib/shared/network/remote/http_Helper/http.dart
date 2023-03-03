import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pokedex/models/allpokemonsmodel.dart';

class HTTP {
  var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');

  static late AllPokemonsModel allPokemonsModel;

  static Future<AllPokemonsModel?> getData() async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    try {
      final Response response = await http.get(url);
      if (response.statusCode == 200) {
        allPokemonsModel = AllPokemonsModelFromJson(response.body);
        print(allPokemonsModel.count);
        return allPokemonsModel;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return null;
  }

  static Future<Response> getHomeData(String? uri) async {
    var url = Uri.parse(uri!);
    try {
      final Response response = await http.get(url);
      // if (response.statusCode == 200) {
      //   allPokemonsModel = AllPokemonsModelFromJson(response.body);
      //   // print(allPokemonsModel.count);
      //   // return allPokemonsModel;
      // } else {
      //   print('Request failed with status: ${response.statusCode}.');
      // }
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}

Future<Response> fetchDatad() async {
  // var url = Uri.https('https://jsonplaceholder.typicode.com/posts');
  // var response = await http.get(url).then((value) async {
  //   print('fff');
  // });
  var url = Uri.parse('https://student.valuxapps.com/api/faqs');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url, headers: {'lang': 'ar'});
  if (response.statusCode == 200) {
    print('sucss');

    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse['message']);
  } else {
    // print('Request failed with status: ${response.statusCode}.');
  }
  // if (response.statusCode == 200) {
  //   var jsonResponse = convert.jsonDecode(response.body) as String;
  //   // var itemCount = jsonResponse['totalItems'];
  //   // print('Number of books about http: $itemCount./**/');
  // } else {
  //   print('Request failed with status: ${response.statusCode}.');
  // }
  // // var data = await jsonDecode(response.body);
  // print(jsonResponse[1]['body']);
  return response;
}
