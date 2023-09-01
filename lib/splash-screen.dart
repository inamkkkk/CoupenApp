// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:customer_coupon_flutter_app/screens/main-tab-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // var firebaseAuth;
  // getUser() async {
  //   firebaseAuth =  await FirebaseAuth.instance.currentUser;
  //  FirebaseAuth.instance.signOut();
  // }
  @override
  void initState() {
    //getUser();
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const MainTabScreen());
      // firebaseAuth!=null?Get.offAll(HomeScreen()):Get.offAll(Authentication());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset('assets/images/dealbuds.png'),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}