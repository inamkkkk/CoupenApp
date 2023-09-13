// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../models/coupons.dart';
import '../models/offers.dart';

class deals extends ChangeNotifier{

}

//const String apiKey = 'c2d0d69ce02524947f50bb4230972354';
//const String apiKey = 'abf7d7a6327fbc47da2abdf3691043a3';
const String apiKey = 'be9c4462f8d6484122921e67129b23c9';

Coupons? offersList;
List<Offers> lf = [];

List<Offers> ltl = [];
List<String> favList = [];
Set<String> storeName = {};
Set<String> storeHistor = {};
Set<String> searchHistor = {};

DateTime currentDate = DateTime.now();

var parsedDate;
var limitdate;


Future<dynamic> getResponse () async {
  var request = http.Request('GET', Uri.parse(
      'https://feed.linkmydeals.com/getOffers/?API_KEY=${apiKey}&format=json'));

  http.StreamedResponse Streamresponse = await request.send();
  var response = await http.Response.fromStream(Streamresponse);
  if (Streamresponse.statusCode == 200) {
   // offersList.clear();
    print('hello');
    var map = jsonDecode(response.body);
   // print('$map');
 //deals
    offersList = Coupons.fromJson(map);
    print("${offersList?.offers![0]}");
    for(var v in offersList!.offers!){
      storeName.add(v.merchantHomepage!);
      parsedDate = DateTime.parse(v.startDate!);
      limitdate = parsedDate.add(const Duration(days: 30));
      if(currentDate.isBefore(limitdate)){
        var b = jsonEncode(v);
        var map = jsonDecode(b);
        ltl.add(Offers.fromJson(map));
      }
    }
    print(await offersList!.offers![0].title);
    return true;
  }
  else {
    var map = jsonDecode(response.body);
    print(map);
    print('failed');
  }
}

void fav() async{
  if(prefs.getStringList('favi') != null){
    favList.clear();
    favList = prefs.getStringList('favi');

    for(var v in favList){
      isTap[int.parse(v)] = 'true';
    }
  }
  else{}
}

void local() async{
  if (json.decode(prefs.getString('lf')) != null) {
    // offersList.clear();
    print('hello');
    lf.clear();
    print(json.decode(prefs.getString('lf')));
    var map = json.decode(prefs.getString('lf'));
     print('this is map $map');
    for(var m in map){
      lf.add(Offers.fromJson(m));
      print(lf.length);
      //ld = lf;
    }

    print(await lf[0].title);

  }
  else {

  }
}

void StoreHistory() async{
  if (prefs.getStringList('ssl') != null) {
    print('hello');
    storeHistor.clear();
    print(prefs.getStringList('ssl'));
    var map = prefs.getStringList('ssl');
    for(var m in map){
      storeHistor.add(m);
      print(storeHistor.length);
    }

    print(await storeHistor.elementAt(0));

  }
  else {

  }
}

void SearchHistoryList() async{
  if (prefs.getStringList('sh') != null) {
    print('hello');
    searchHistor.clear();
    print(prefs.getStringList('sh'));
    var map = prefs.getStringList('sh');
    for(var m in map){
      searchHistor.add(m);
      print(searchHistor.length);
    }

    print(await searchHistor.elementAt(0));

  }
  else {

  }
}