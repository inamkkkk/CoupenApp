import 'package:customer_coupon_flutter_app/Responsive/ResponsiveClass.dart';
import 'package:customer_coupon_flutter_app/screens/detail-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api-services/apiServices.dart';




class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          child: offersList != null?
          const ApiDeals()
              : const SizedBox(),
        ),

      );
  }
}



class ApiDeals extends StatefulWidget {
  const ApiDeals({Key? key}) : super(key: key);

  @override
  State<ApiDeals> createState() => _ApiDealsState();
}

class _ApiDealsState extends State<ApiDeals> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offersList!.offers!.length,
      itemBuilder: (context, i) {
        return offersList!.offers!.isNotEmpty ?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
          child: SizedBox(
            height: responsive(120, context),
            width: double.infinity,
            child: InkWell(
              onTap: ()
              {
                Get.to(
                  DetailScreen(
                    url: offersList!.offers![i].url,
                    code: offersList!.offers![i].code,
                    store: offersList!.offers![i].store,
                    startDate: offersList!.offers![i].startDate,
                    offerText: offersList!.offers![i].offerText,
                    offerValue: offersList!.offers![i].offerValue,
                    offer: offersList!.offers![i].offer,
                    title: offersList!.offers![i].title,
                    endDate: offersList!.offers![i].endDate,
                    merchantHomePage: offersList!.offers![i].merchantHomepage,
                  imageUrl: offersList!.offers![i].imageUrl,
                  lmId: offersList!.offers![i].lmdId,
                  lfi: [offersList!.offers![i]],
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
                  padding:  EdgeInsets.only(right: responsive(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: responsive(120, context),
                        height: responsive(100, context),
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
                              width: responsive(120, context),
                              height: responsive(80, context),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(responsive(8, context)),   // Top left corner radius
                                    //bo: Radius.circular(20),  // Top right corner radius
                                  ),
                                ),
                                // borderRadius: BorderRadius.circular(18),
                                image: ltl[i].imageUrl == ''?
                                const DecorationImage(
                                  image: AssetImage('assets/images/defualt.png'),
                                  //  NetworkImage('${ltl[i].imageUrl}')
                                  fit: BoxFit.fitHeight,):
                                DecorationImage(
                                  //image: AssetImage('assets/images/defualt.png'),
                                  image: NetworkImage('${ltl[i].imageUrl}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(responsive(8, context)),   // Top left corner radius
                                    //bo: Radius.circular(20),  // Top right corner radius
                                  ),
                                ),
                                color: Colors.black.withOpacity(0.05),
                              ),
                            // height: responsive(20, context),

                              child: Center(
                                child: Text('Get Deal',style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                  fontSize: responsive(13, context)
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
                                        offersList!.offers![i].code == ""?
                                        '${offersList!.offers![i].title}'
                                            :'${offersList!.offers![i].offerText}',
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          //fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    // const Icon(Icons.more_vert),
                                    // InkWell(
                                    //   onTap: () async{
                                    //     setState(() {
                                    //
                                    //       isTap[i] == 'true'? isTap[i]= 'false':
                                    //       isTap[i] = 'true';
                                    //     });
                                    //     var b = jsonEncode(offersList!.offers![i]);
                                    //     var map = jsonDecode(b);
                                    //     if(isTap[i] == 'true'){
                                    //       findex.add('${i.toString()}');
                                    //       kfav.add(Offers.fromJson(map));
                                    //     }else{
                                    //       kfav.removeWhere((element) {
                                    //         return offersList!.offers![i].lmdId == element.lmdId;
                                    //       });
                                    //       if(findex.asMap().containsKey(i)){
                                    //         findex.removeAt(i);
                                    //       }
                                    //     }
                                    //     // isTap[i] == 'true'
                                    //     //     ?
                                    //     // findex.add('${i.toString()}')
                                    //     //     :
                                    //     // findex.asMap().containsKey(i)
                                    //     //     ?
                                    //     // findex.removeAt(i)
                                    //     //     :
                                    //     // null;
                                    //     //
                                    //     // //await prefs.setString('kfav', offersList!.offers![i]);
                                    //     // isTap[i] == 'true'?
                                    //     //     //lf by kfav
                                    //     // kfav.add(Offers.fromJson(map))
                                    //     //     :kfav.removeWhere((element) {
                                    //     //       return  offersList!.offers![i].lmdId == element.lmdId;});
                                    //
                                    //     await prefs.setString('lf', json.encode(kfav));
                                    //     await prefs.setStringList('favi', findex);
                                    //
                                    //     print(prefs.getString('lf'));
                                    //   },
                                    //   child: isTap[i]=='true'?const Icon(Icons.favorite,color: Colors.pink,)
                                    //       : const Icon(Icons.favorite_border),
                                    // ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    size: 18,
                                    color: Colors.grey,),
                                  Text(
                                      '  ${
                                      DateTime.parse(offersList!.offers![i].endDate!).difference(DateTime.now()).inDays
                                      } days left'),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      offersList!.offers![i].code == ""?
                                      '${offersList!.offers![i].type}'
                                          :'${offersList!.offers![i].code}',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),),
                                    Text(
                                      '${offersList!.offers![i].store}'.split('.')[0],
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
        )
            : Container(
          height: 0,
          width: 0,
        );
      },
    );
  }
}



