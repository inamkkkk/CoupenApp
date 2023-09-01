import 'package:flutter/material.dart';

import 'a-z-stores.dart';
import 'custom-search-screen.dart';
import 'custom-store-search.dart';
import 'mostltStoreSearch.dart';

class StoreSearchHistory extends StatefulWidget {
  const StoreSearchHistory({Key? key}) : super(key: key);

  @override
  State<StoreSearchHistory> createState() => _StoreSearchHistoryState();
}

class _StoreSearchHistoryState extends State<StoreSearchHistory> with SingleTickerProviderStateMixin {

  late TabController tabController;
  int selecetdIndex = 0;


  void onItemClicked(int index){
    setState(() {
      selecetdIndex = index;
      tabController.index = selecetdIndex;
    });
  }
  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabSelection);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabController.addListener(() {
      if(tabController.indexIsChanging){
        setState(() {
          selecetdIndex = tabController.index;
        });
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stores'),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                context: context,
                delegate: CustomStoreSearch(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],

        bottom: TabBar(
          controller: tabController,
          indicatorColor:  Colors.white,
          labelColor:  Colors.white,
          labelStyle: const TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          unselectedLabelColor: Colors.white.withOpacity(0.3),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          tabs: const [
            Tab(
              icon: Text('Mostly',),
            ),
            Tab(
              icon: Text('A-Z Stores',),
            ),
          ],
        ),

      ),
      body: TabBarView(

        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          MostlyStoreSearch(),
          AZStores(),
        ],
      ),
    );
  }
}
