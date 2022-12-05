import 'package:customer_coupon_flutter_app/screens/search%20screen/offer-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api-services/apiServices.dart';
import '../../main.dart';

class MostlyStoreSearch extends StatefulWidget {
  const MostlyStoreSearch({Key? key}) : super(key: key);

  @override
  State<MostlyStoreSearch> createState() => _MostlyStoreSearchState();
}

class _MostlyStoreSearchState extends State<MostlyStoreSearch> {
  void getData(){
    StoreHistory();
    setState(() {

    });
    if (prefs.getStringList('ssl') != null ) {
      storeSearchHistory.clear();
      var map = prefs.getStringList('ssl');
      for (var v in map) {
        storeSearchHistory.add(v);
      }
    }
    print(storeSearchHistory.length);
  }
  Future<void> showMyDialog({var title, var url}) async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Store or Deals?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('What do you want to check? Directly goto ${title},or view deals from ${title}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:  Text('Go to store'.toUpperCase()),
              onPressed: () async{
                final  _url = Uri.parse(url);
                if (!await launchUrl(

                  _url,
                  mode: LaunchMode.externalNonBrowserApplication,
                )) {
                  throw 'Could not launch $_url';
                }
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:  Text('view deals'.toUpperCase()),
              onPressed: (){
                Navigator.of(context).pop();
                Get.to(OffersScreen(storeTitle: title));

              },
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: storeHistor.isNotEmpty?
            ListView.builder(
                itemCount: storeHistor.length,
                itemBuilder: (context, i){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        showMyDialog(title: storeHistor.elementAt(i).split('.')[1],
                        url: storeHistor.elementAt(i),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          '${storeHistor.elementAt(i)}'.split('.')[1],
                          style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),),
                        leading: storeHistor.elementAt(i).split('.')[1] == 'amazon'?
                        Image.asset('assets/images/amazon.png'):
                        storeHistor.elementAt(i).split('.')[1].toLowerCase() == 'ebay'?
                        Image.asset('assets/images/ebay.png'):
                        storeHistor.elementAt(i).split('.')[1].toLowerCase() == 'etsy'?
                        Image.asset('assets/images/etsy.png'):
                        storeHistor.elementAt(i).split('.')[1].toLowerCase() == 'kmart'?
                        Image.asset('assets/images/k.png'):
                        storeHistor.elementAt(i).split('.')[1].toLowerCase() == 'soccer'?
                        Image.asset('assets/images/football-ball.png'):
                        const Icon(Icons.image),
                      ),
                    ),
                  );
                }
            ):
        const Center(
            child: Text('Mostly search here'),
        ),
    );

  }
}
