import 'dart:convert';

import 'package:covidtutorials/Modle/services/Uillities/Uri-app.dart';
import 'package:http/http.dart'as http;

import '../WorldStatesModle.dart';

class StatesServices{

  Future<WorldStatesModle> futureWorldStatesRecords () async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

if (response.statusCode==200){
  var data = jsonDecode(response.body);
return WorldStatesModle.fromJson(data);
}else{
throw Exception('Error');
}

  }
  Future<List<dynamic>> countriesListApi () async{
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode==200){
      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }

  }

}