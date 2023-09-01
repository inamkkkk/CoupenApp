
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api-services/apiServices.dart';
import 'detail-screen.dart';


class FV extends StatefulWidget {
  const FV({Key? key}) : super(key: key);

  @override
  State<FV> createState() => _FVState();
}

class _FVState extends State<FV> {

  void getdata () async {

     local();

    setState(() {

    });
    // kfav = json.decode(prefs.getString('kfav'));
    // print(kfav.length);
  }
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 150,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Saved Deals', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: lf.isNotEmpty?
        ListView.builder(
          itemCount: lf.length,
          itemBuilder: (context, i) {
            return lf.isNotEmpty?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: InkWell(
                  onTap: ()
                  {
                    Get.to(
                      DetailScreen(
                        url: lf[i].url,
                        code: lf[i].code,
                        store: lf[i].store,
                        startDate: lf[i].startDate,
                        offerText: lf[i].offerText,
                        offerValue: lf[i].offerValue,
                        offer: lf[i].offer,
                        title: lf[i].title,
                        endDate: lf[i].endDate,
                        merchantHomePage: lf[i].merchantHomepage,
                        imageUrl: lf[i].imageUrl,
                        lmId: lf[i].lmdId,
                        lfi: [lf[i]],
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
                                SizedBox(
                                  width: 90,
                                  height: 70,
                                  child: ClipRRect(
                                    child: lf[i].imageUrl != ""?
                                    Image.network(
                                      '${lf[i].imageUrl}',
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
                                        SizedBox(
                                          // height: 30,
                                          width: MediaQuery.of(context).size.width*0.5,
                                          child: Text(
                                            lf[i].code == ""?
                                            '${lf[i].title}'
                                                :'${lf[i].offerText}',
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
                                  Row(
                                    children: [
                                      Icon(Icons.watch_later_outlined,size: 18,color: Colors.grey,),
                                      Text('  ${
                                          DateTime.parse(lf[i].endDate!).difference(DateTime.now()).inDays
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
                                          lf[i].code == ""?
                                          '${lf[i].type}'
                                              :'${lf[i].code}',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.3),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),),
                                        Text(
                                          '${lf[i].store}'.split('.')[0],
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
            //     ? ListTile(
            //   title: Text(lf[i].title.toString()),
            // )
                : const SizedBox(
              height: 0,
              width: 0,
            );
          },
        )
            :const Center(child: Text("No Record Found"),
      ),
      ),
    );
  }
}
