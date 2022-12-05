import 'package:customer_coupon_flutter_app/api-services/apiServices.dart';
import 'package:customer_coupon_flutter_app/models/offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../detail-screen.dart';

class SearchListPage extends StatefulWidget {
  final String searchTxt;
  const SearchListPage(
      {
        required this.searchTxt
      }
      );

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  List<Offers> listOffer = [];
  void listCreate () {
    for(var s in offersList!.offers!){
      listOffer.addIf(s.categories!.toString().toLowerCase().contains(widget.searchTxt.toLowerCase()), s);
    }
  }

  @override
  void initState(){
    // TODO: implement initState
    listCreate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
      ),
      body: listOffer.isNotEmpty?
      ListView.builder(
          itemCount: listOffer.length,
          itemBuilder: (context,i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: InkWell(
                  onTap: ()
                  {
                    Get.to(
                      DetailScreen(
                        url: listOffer[i].url,
                        code: listOffer[i].code,
                        store: listOffer[i].store,
                        startDate: listOffer[i].startDate,
                        offerText: listOffer[i].offerText,
                        offerValue: listOffer[i].offerValue,
                        offer: listOffer[i].offer,
                        title: listOffer[i].title,
                        endDate: listOffer[i].endDate,
                        merchantHomePage: listOffer[i].merchantHomepage,
                        imageUrl: listOffer[i].imageUrl,
                        lmId: listOffer[i].lmdId,
                        lfi: [listOffer[i]],
                        //i: i,
                      ),
                    );
                  },
                  child: Card(
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
                                Container(
                                  width: 90,
                                  height: 70,
                                  child: ClipRRect(
                                    child: listOffer[i].imageUrl != ""?
                                    Image.network(
                                      '${listOffer[i].imageUrl}',
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
                              padding: const EdgeInsets.only(left: 8.0,top: 10,bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // height: 30,
                                          width: MediaQuery.of(context).size.width*0.5,
                                          child: Text(
                                            listOffer[i].code == ""?
                                            '${listOffer[i].title}'
                                                :'${listOffer[i].offerText}',
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
                                          listOffer[i].code == ""?
                                          '${listOffer[i].type}'
                                              :'${listOffer[i].code}',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.3),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),),
                                        Text(
                                          '${listOffer[i].store}'.split('.')[0],
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
                  ),
                ),
              ),
            );
          }
      ):
      const Center(
        child: Text('No Offer Found'),
      ),
    );
  }
}
