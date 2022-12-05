import 'dart:async';

import 'package:customer_coupon_flutter_app/api-services/apiServices.dart';
import 'package:customer_coupon_flutter_app/screens/featured-screen.dart';
import 'package:customer_coupon_flutter_app/screens/fv.dart';
import 'package:customer_coupon_flutter_app/screens/tranding-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import 'latest-screen.dart';
import 'search screen/search-history.dart';
import 'search screen/store-search-history.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> with SingleTickerProviderStateMixin{
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
    tabController = TabController(length: 3, vsync: this);
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
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            toolbarHeight: 120,
            elevation: 0,
            actions: [
              IconButton(onPressed: (){
                Get.to(SearchHistory());
              }, icon: const Icon(Icons.search)),
              IconButton(onPressed: () async{

                Timer(const Duration(seconds: 5), () {
                    isLoading = true;

                });
                await getResponse();
                setState(() {
                  isLoading = false;
                });
              }, icon: const Icon(Icons.refresh)),

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
                  icon: Text('Latest',),
                ),
                Tab(
                  icon: Text('Featured',),
                ),
                Tab(
                  icon: Text('Trending',),
                ),
              ],
            ),
            title: const Text('DealBuds', style: TextStyle(color: Colors.white),),

          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width*0.75,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),

              )
            ),
            child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/dealbuds.png'),
                          ),
                          SizedBox(height: 10,),
                          Text('DealBuds',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          // ListTile(
                          //   leading: CircleAvatar(
                          //     radius: 30,
                          //   ),
                          //   title: Text('My Deals',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.w600,
                          //         fontSize: 18),),
                          //   subtitle: Text('Shopping Deals and Coupons',style: TextStyle(color: Colors.white,fontSize: 15),),
                          // ),
                        ],
                      ),
                    ),),
                  
                  ListTile(
                    onTap: (){
                      setState(() {
                        tabController.index=0;
                      });
                      Navigator.pop(context);
                      // LatestScreen();
                    },
                    leading: const Icon(Icons.dashboard),
                    title: const Text('Latest Deals'),
                  ),
                  ListTile(
                    onTap: (){
                      setState(() {
                        tabController.index=1;
                      });
                      Navigator.pop(context);

                    },
                    leading: const Icon(Icons.featured_play_list),
                    title: const Text('Featured Deals'),
                  ),
                  ListTile(
                    onTap: (){
                      setState(() {
                        tabController.index=2;
                      });
                      Navigator.pop(context);

                    },
                    leading: const Icon(Icons.trending_up),
                    title: const Text('Trending Deals'),
                  ),
                  ListTile(
                    onTap: (){
                      // setState(() {
                      //   tabController.index=2;
                      // });
                      Navigator.pop(context);
                      Get.to(const FV());
                    },
                    leading: const Icon(Icons.save),
                    title: const Text('Saved Deals'),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: (){
                      Navigator.pop(context);
                      Get.to(StoreSearchHistory());
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('Stores'),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pop(context);
                      Get.to(SearchHistory());

                    },
                    leading: const Icon(Icons.search),
                    title: const Text('Search'),
                  ),

                ],
            ),
          ),
          body:  TabBarView(

            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: const [
              LatestScreen(),
              FeaturedScreen(),
              TrendingScreen(),
            ],
          ),
    );
  }
}
