
import 'dart:convert';

import 'package:customer_coupon_flutter_app/screens/detail-screen.dart';
import 'package:customer_coupon_flutter_app/screens/main-tab-screen.dart';
import 'package:customer_coupon_flutter_app/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api-services/apiServices.dart';
import 'models/offers.dart';


var prefs;
List<Offers> kfav = [];
List<String> storeSearchHistory = [];
List<String> searchList = [];
List<String> findex = [];
List<String> isTap = [
for(var v in offersList!.offers!)
'false'
];
var isLoading = true;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  await getResponse ();
  isLoading = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen (),
    );
  }
}


