import 'dart:convert';
import 'package:cms_application/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:cms_application/models/address_model.dart';

class EditProfileRepo {
  Future<List<Address>> getCountries() async {
    String url = AppConstants.getCountries;
    Uri uri = Uri.parse(url);
    var body = jsonEncode(<String, dynamic>{});

    var response = await http.post(uri,
        body: body,
        headers: <String, String>{'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      Iterable data = jsonData['Data'];
      List<Address> countriesList =
          data.map((json) => Address.fromJson(json)).toList();

      return countriesList;
    } else {
      throw Exception('Failed to fetch countries details');
    }
  }

  Future<List<Address>> getProvince(countryId) async {
    String url = AppConstants.getProvince;
    Uri uri = Uri.parse(url);
    var body = jsonEncode(<String, dynamic>{
      "CountryId": countryId,
    });

    var response = await http.post(uri,
        body: body,
        headers: <String, String>{'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      Iterable data = jsonData['Data'];
      List<Address> provinceList =
          data.map((json) => Address.fromJson(json)).toList();

      return provinceList;
    } else {
      throw Exception('Failed to fetch Province details');
    }
  }

  Future<List<Address>> getCity(provinceId) async {
    String url = AppConstants.getCities;
    Uri uri = Uri.parse(url);
    var body = jsonEncode(<String, dynamic>{
      "StateORProvinceId": provinceId,
    });

    var response = await http.post(uri,
        body: body,
        headers: <String, String>{'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      Iterable data = jsonData['Data'];
      List<Address> cityList =
          data.map((json) => Address.fromJson(json)).toList();

      return cityList;
    } else {
      throw Exception('Failed to fetch city details');
    }
  }
}
