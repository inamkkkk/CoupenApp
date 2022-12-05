import 'package:customer_coupon_flutter_app/api-services/apiServices.dart';
import 'package:customer_coupon_flutter_app/screens/detail-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LatestScreen extends StatefulWidget {
  const LatestScreen({Key? key}) : super(key: key);

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  
  void getdata () async {

   // await getResponse ();

    setState(() {

    });
    // lf = json.decode(prefs.getString('lf'));
    // print(kfav.length);
  }
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
    //
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: ltl.isNotEmpty?
            // isLoading ?
            //     const Center(
            //       child: CircularProgressIndicator(),
            //     ) :
            GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 5.0,
           // mainAxisExtent: 200,
            //crossAxisSpacing: 30.0,
          ),
          itemCount: ltl.length,
          itemBuilder: (context, i) {
            return ltl.isNotEmpty ?
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell (
                onTap: (){
                  Get.to(
                    DetailScreen(
                      url: ltl[i].url,
                      code: ltl[i].code,
                      store: ltl[i].store,
                      startDate: ltl[i].startDate,
                      offerText: ltl[i].offerText,
                      offerValue: ltl[i].offerValue,
                      offer: ltl[i].offer,
                      title: ltl[i].title,
                      endDate: ltl[i].endDate,
                      merchantHomePage: ltl[i].merchantHomepage,
                      imageUrl: ltl[i].imageUrl,
                      lmId: ltl[i].lmdId,
                      lfi: [ltl[i]],
                      //i: i,
                  ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: ltl[i].imageUrl == ''?
                          const DecorationImage(
                            image: AssetImage('assets/images/defualt.png'),
                          //  NetworkImage('${ltl[i].imageUrl}')
                            fit: BoxFit.fill,):
                          DecorationImage(
                            //image: AssetImage('assets/images/defualt.png'),
                            image: NetworkImage('${ltl[i].imageUrl}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ltl[i].code == "" ?
                            '${ltl[i].type}' :
                            '${ltl[i].code}',
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400
                              //color: Colors.white,
                            ),
                          ),
                          Text('${ltl[i].store}'.split('.')[0],
                            // style: const TextStyle(
                            //     fontWeight: FontWeight.w500
                            // ),

                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.grey,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            // SizedBox(
            //   height: 100,
            //   width: double.infinity,
            //   child: Card(
            //     elevation: 5,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         ClipRRect(
            //           child: Image.network(
            //             ltl[i].imageUrl != ""?
            //             '${ltl[i].imageUrl}'
            //                 :'https://cpb-us-e1.wpmucdn.com/sites.psu.edu/dist/b/33081/files/2015/10/url.jpg',
            //             fit: BoxFit.fill,
            //             width: 120,
            //             height: double.infinity,
            //           ),
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 8),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Expanded(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Text(
            //                         ltl[i].code == ""?
            //                         '${ltl[i].title}'
            //                             :'${ltl[i].offerText}',
            //                         style: const TextStyle(
            //                           fontSize: 13,
            //                           //fontWeight: FontWeight.w500
            //                         ),
            //                       ),
            //                       Text(
            //                         ltl[i].code == ""?
            //                         '${ltl[i].type}'
            //                             :'${ltl[i].code}',
            //                         style: TextStyle(
            //                           color: Colors.black.withOpacity(0.3),
            //                           fontWeight: FontWeight.w500
            //                       ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.end,
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     //const Icon(Icons.more_vert),
            //                     Text(
            //                       '${ltl[i].store}'.split('.')[0],
            //                       style: const TextStyle(
            //                           fontWeight: FontWeight.w500
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
                : const SizedBox(
              height: 0,
              width: 0,
            );
          },
        ) :
        const Center(child: Text("No Record Found"),),
      ),
    );
  }
}
