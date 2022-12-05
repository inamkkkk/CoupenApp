import 'package:customer_coupon_flutter_app/screens/search%20screen/searchListPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api-services/apiServices.dart';
import '../../main.dart';
import 'custom-search-screen.dart';

class SearchHistory extends StatefulWidget {
  const SearchHistory({Key? key}) : super(key: key);

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory>{
  void getData(){
    SearchHistoryList();
    setState(() {
    });

    if (prefs.getStringList('sh') != null ) {
      searchList.clear();
      var map = prefs.getStringList('sh');
      for (var v in map) {
       searchList.add(v);
      }
    }
    print(searchList.length);
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: searchHistor.isNotEmpty?
      ListView.builder(
          itemCount: searchHistor.length,
          itemBuilder: (context, i){
            return Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  Get.to(SearchListPage(
                    searchTxt: searchHistor.elementAt(i),
                  ));
                },
                child: ListTile(
                  title: Text('${searchHistor.elementAt(i)}'),
                ),
              ),
            );
          }
      ):
      const Center(
          child: Text('No Record Found'),
      ),
    );
  }
}
