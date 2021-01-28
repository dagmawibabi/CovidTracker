//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import "dart:convert";

class FetchData {
  List countriesData;
  Map worldData;
  Map vaccinesData;
  Future<void> getData() async {
    Response worldDataResponse = await get("https://corona.lmao.ninja/v2/all");
    worldData = jsonDecode(worldDataResponse.body);
    Response countriesDataResponse =
        await get("https://corona.lmao.ninja/v2/countries");
    countriesData = jsonDecode(countriesDataResponse.body);
    Response vaccinesDataResponse =
        await get("https://corona.lmao.ninja/v3/covid-19/vaccine");
    vaccinesData = jsonDecode(vaccinesDataResponse.body);
  }
}
