import 'dart:convert';

import 'package:customer_coupon_flutter_app/api-services/apiServices.dart';
import 'package:customer_coupon_flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'offer-screen.dart';

class CustomStoreSearch extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    List<String> matchUrl = [];
    for (var s in storeName) {
      if (s.split('.')[1].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(s.split('.')[1]);
        matchUrl.add(s);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var url = matchUrl[index];
        return InkWell(
          onTap: () async{
            storeSearchHistory.add(url);
            await prefs.setStringList('ssl', storeSearchHistory);
            print(prefs.getStringList('ssl'));
          Get.to(
            OffersScreen(
            storeTitle: result,
          ),
          );
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    List<String> matchUrl = [];
    for (var s in storeName) {
      if (s.split('.')[1].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(s.split('.')[1]);
        matchUrl.add(s);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var url = matchUrl[index];
        return InkWell(
          onTap: () async{
            storeSearchHistory.add(url);
            await prefs.setStringList('ssl', storeSearchHistory);
            print(prefs.getStringList('ssl'));
            Get.to(OffersScreen(storeTitle: result));
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
}
