// ignore_for_file: unnecessary_string_interpolations

import 'package:customer_coupon_flutter_app/api-services/apiServices.dart';
import 'package:customer_coupon_flutter_app/models/offers.dart';
import 'package:customer_coupon_flutter_app/screens/detail-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class CustomSearchDelegate extends SearchDelegate{



  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchCategoriesQuery = [];
    List<String> matchImageUrl = [];
    List<String> matchUrl = [];
    List<String> matchOfferText = [];
    List<String> matchTitle = [];
    List<String> matchCode = [];
    List<String> matchStore = [];
    List<String> matchStartDate = [];
    List<String> matchEndDate = [];
    List<String> matchMerchantHomepage = [];
    List<String> matchOfferValue = [];
    List<String> matchOffer = [];
    List<String> matchlmdId = [];
    List<String> matchType = [];
    List<Offers> matchOfferList = [];
    List<String> queryString = [];
    searchList.add(query);
    prefs.setStringList('sh', searchList);
    print(prefs.getStringList('sh'));
    for (var s in offersList!.offers!) {
      if (s.categories.toString().toLowerCase().contains(query.toLowerCase())){
        matchCategoriesQuery.add(s.categories.toString());
        queryString.add(query);
        matchImageUrl.add('${s.imageUrl!}');
        matchUrl.add('${s.url}');
        matchOfferText.add('${s.offerText}');
        matchlmdId.add('${s.lmdId}');
        matchOffer.add('${s.offer}');
        matchTitle.add('${s.title}');
        matchCode.add('${s.code}');
        matchStore.add('${s.store}');
        matchMerchantHomepage.add('${s.merchantHomepage}');
        matchStartDate.add('${s.startDate}');
        matchEndDate.add('${s.endDate}');
        matchOfferValue.add('${s.offerValue}');
        matchType.add('${s.type}');
        matchOfferList.add(s);
      }
    }

    return matchCategoriesQuery.isNotEmpty?
      ListView.builder(

      itemExtent: 150,
        itemCount: matchCategoriesQuery.length,
        itemBuilder: (BuildContext context, int i){
          // searchList.add(queryString[i]);
          // prefs.setStringList('sh', searchList);
          // print(prefs.getStringList('sh'));
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8),
            child: InkWell (
              onTap: () {
                // searchList.add(queryString[i]);
                // await prefs.setStringList('sh', searchList);
                // print(prefs.getStringList('sh'),);
                Get.to(
                    DetailScreen(
                    url: matchUrl[i],
                    code: matchCode[i],
                    store: matchStore[i],
                    startDate: matchStartDate[i],
                    offerText: matchOfferText[i],
                    offerValue: matchOfferValue[i],
                    offer: matchOffer[i],
                    title: matchTitle[i],
                    endDate: matchEndDate[i],
                    merchantHomePage: matchMerchantHomepage[i],
                    imageUrl: matchImageUrl[i],
                    lmId: matchlmdId[i],
                    lfi: [matchOfferList[i]],
                )
                );
              },
              child: matchCategoriesQuery.isNotEmpty?
                  Card(
                    elevation: 3,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black.withOpacity(0.05)
                              ),

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 90,
                                  height: 70,
                                  child: ClipRRect(
                                    child: matchImageUrl[i] != ""?
                                    Image.network(
                                      '${matchImageUrl[i]}',
                                      fit: BoxFit.fill,
                                    ):
                                    Image.asset('assets/images/defualt.png',fit: BoxFit.fill),
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.05),
                                  child: Center(
                                    child: Text('Get Deal',style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13
                                    ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          // height: 30,
                                          width: MediaQuery.of(context).size.width*0.5,
                                          child: Text(
                                            matchCode[i] == ""?
                                            '${matchTitle[i]}'
                                                :'${matchOfferText[i]}',
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              overflow: TextOverflow.ellipsis,
                                              //fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          matchCode[i] == ""?
                                          '${matchType[i]}'
                                              :'${matchCode[i]}',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.3),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),),
                                        Text(
                                          '${matchStore[i]}'.split('.')[0],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              :const Center(
                  child: SizedBox(child: Text('No Data Match'),)),
            ),
          );
        }
    ):
        const Center(
          child: Text('No Data Match'),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchCategoriesQuery = [];
    List<String> matchImageUrl = [];
    List<String> matchUrl = [];
    List<String> matchOfferText = [];
    List<String> matchTitle = [];
    List<String> matchCode = [];
    List<String> matchStore = [];
    List<String> matchStartDate = [];
    List<String> matchEndDate = [];
    List<String> matchMerchantHomepage = [];
    List<String> matchOfferValue = [];
    List<String> matchOffer = [];
    List<String> matchlmdId = [];
    List<String> matchType = [];
    List<Offers> matchOfferList = [];
    for (var s in offersList!.offers!) {
      if (s.categories.toString().toLowerCase().contains(query.toLowerCase())) {
        matchCategoriesQuery.add(s.categories.toString());
        matchImageUrl.add('${s.imageUrl!}');
        matchUrl.add('${s.url}');
        matchOfferText.add('${s.offerText}');
        matchlmdId.add('${s.lmdId}');
        matchOffer.add('${s.offer}');
        matchTitle.add('${s.title}');
        matchCode.add('${s.code}');
        matchStore.add('${s.store}');
        matchMerchantHomepage.add('${s.merchantHomepage}');
        matchStartDate.add('${s.startDate}');
        matchEndDate.add('${s.endDate}');
        matchOfferValue.add('${s.offerValue}');
        matchType.add('${s.type}');
        matchOfferList.add(s);
      }
    }
    return const SizedBox();
    // return ListView.builder(
    //   itemExtent: 150,
    //     itemCount: matchCategoriesQuery.length,
    //     itemBuilder: (BuildContext context, int i){
    //       return Padding(
    //         padding: const EdgeInsets.all(5.0),
    //         child: InkWell(
    //           onTap: () async{
    //             searchList.add(matchCategoriesQuery[i]);
    //             await prefs.setStringList('sh', searchList);
    //             print(prefs.getStringList('sh'));
    //             print('in suggetion ${matchCategoriesQuery[i]}');
    //             Get.to(DetailScreen(
    //               url: matchUrl[i],
    //               code: matchCode[i],
    //               store: matchStore[i],
    //               startDate: matchStartDate[i],
    //               offerText: matchOfferText[i],
    //               offerValue: matchOfferValue[i],
    //               offer: matchOffer[i],
    //               title: matchTitle[i],
    //               endDate: matchEndDate[i],
    //               merchantHomePage: matchMerchantHomepage[i],
    //               imageUrl: matchImageUrl[i],
    //               lmId: matchlmdId[i],
    //               lfi: [matchOfferList[i]],
    //             )
    //             );
    //           },
    //           child: matchCategoriesQuery.isNotEmpty?
    //           Card(
    //             elevation: 3,
    //             shape:  RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(16),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     width: 90,
    //                     height: 90,
    //                     decoration: BoxDecoration(
    //                       border: Border.all(
    //                           style: BorderStyle.solid,
    //                           color: Colors.black.withOpacity(0.05)
    //                       ),
    //
    //                     ),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.stretch,
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         SizedBox(
    //                           width: 90,
    //                           height: 70,
    //                           child: ClipRRect(
    //                             child: matchImageUrl[i] != ""?
    //                             Image.network(
    //                               '${matchImageUrl[i]}',
    //                               fit: BoxFit.fill,
    //                             ):
    //                             Image.asset('assets/images/defualt.png',fit: BoxFit.fill),
    //                           ),
    //                         ),
    //                         Container(
    //                           color: Colors.black.withOpacity(0.05),
    //                           child: Center(
    //                             child: Text('Get Deal',style: TextStyle(
    //                                 color: Colors.black.withOpacity(0.5),
    //                                 fontWeight: FontWeight.w500,
    //                                 fontSize: 13
    //                             ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Expanded(
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 8),
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Expanded(
    //                             child: Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 SizedBox(
    //                                   // height: 30,
    //                                   width: MediaQuery.of(context).size.width*0.5,
    //                                   child: Text(
    //                                     matchCode[i] == ""?
    //                                     '${matchTitle[i]}'
    //                                         :'${matchOfferText[i]}',
    //                                     maxLines: 2,
    //                                     style: const TextStyle(
    //                                       fontSize: 15,
    //                                       overflow: TextOverflow.ellipsis,
    //                                       //fontWeight: FontWeight.w500
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.only(top: 10.0),
    //                             child: Row(
    //                               crossAxisAlignment: CrossAxisAlignment.end,
    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Text(
    //                                   matchCode[i] == ""?
    //                                   '${matchType[i]}'
    //                                       :'${matchCode[i]}',
    //                                   style: TextStyle(
    //                                     color: Colors.black.withOpacity(0.3),
    //                                     fontWeight: FontWeight.w400,
    //                                     fontSize: 15,
    //                                   ),),
    //                                 Text(
    //                                   '${matchStore[i]}'.split('.')[0],
    //                                   style: const TextStyle(
    //                                     fontWeight: FontWeight.w500,
    //                                     fontSize: 15,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           )
    //               :const Center(
    //               child: SizedBox(child: Text('No Data Match'),)),
    //         ),
    //       );
    //     }
    // );
  }
}