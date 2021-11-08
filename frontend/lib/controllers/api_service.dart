import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spur/models/pledge_model.dart';
import 'package:spur/models/spur_model.dart';
import 'package:spur/utils/settings.dart';

class APIService extends GetxService {
  // Use this when you want something initialized from the start
  Future<APIService> init() async {
    print('$runtimeType ready!');
    return this;
  }

  /// get featured spurs
  Future<List> getFeatured() async {
    List<Spur> _featured = [];

    // ! Artificial delay for testing with API delay
    // await Future.delayed(Duration(seconds: 3));
    try {
      // var response = await http.get('http://localhost:8888/spur/featured');
      final _url = apiUri.toString() + '/spur/featured';
      final response = await http.get(_url);
      List jsonni = json.decode(response.body.toString());
      jsonni.forEach((element) {
        _featured.add(Spur.fromJson(element));
      });
    } catch (e) {
      print('API Error: ' + e.toString());
    }
    return _featured;
  }

  /// Get single spur
  Future<Spur> getSpurById(id) async {
    Spur _spur;

    // ! Artificial delay for testing with API delay
    // await Future.delayed(Duration(seconds: 3));
    try {
      final _url = apiUri.toString() + '/spur/$id';
      final _response = await http.get(_url);
      // var _response = await http.get('http://localhost:8888/spur/$id');
      final _jsonni = json.decode(_response.body.toString());
      _spur = Spur.fromJson(_jsonni);
      // print(_spur.falseMoneyRoute.forResolve);
      // print(_spur.trueMoneyRoute.forResolve);
    } catch (e) {
      print('API Error: ' + e.toString());
    }

    return _spur;
  }

  /// Get pledges
  Future<Map> getPledges(spurid, offset) async {
    Map _pledgesMap = {};
    try {
      // Get pledgeMap, consist of count and list of pledges fetched with offset
      final _url = apiUri.toString() + '/pledge?spurid=$spurid&offset=$offset';
      // print(_url);
      final _response = await http.get(_url);
      _pledgesMap = json.decode(_response.body.toString());

      // print(_pledgesMap);
    } catch (e) {
      print('API Error: ' + e.toString());
    }
    return _pledgesMap;
  }
}
