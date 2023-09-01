import 'package:customer_coupon_flutter_app/api-services/apiServices.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AZStores extends StatelessWidget {
  const AZStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: storeName.isNotEmpty?
      ListView.builder(
        itemCount: storeName.length,
          itemBuilder: (context, i){
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child: InkWell(
            onTap: () async{
              final  _url = Uri.parse(storeName.elementAt(i));
              if (!await launchUrl(
                _url,
                mode: LaunchMode.externalNonBrowserApplication,
              )) {
                throw 'Could not launch $_url';
              }
            },
            child: ListTile(
              title: Text('${storeName.elementAt(i)}'.split('.')[1],
                style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),),
              leading: storeName.elementAt(i).split('.')[1] == 'amazon'?
              Image.asset('assets/images/amazon.png'):
              storeName.elementAt(i).split('.')[1].toLowerCase() == 'ebay'?
              Image.asset('assets/images/ebay.png'):
              storeName.elementAt(i).split('.')[1].toLowerCase() == 'etsy'?
              Image.asset('assets/images/etsy.png'):
              storeName.elementAt(i).split('.')[1].toLowerCase() == 'kmart'?
              Image.asset('assets/images/k.png'):
              storeName.elementAt(i).split('.')[1].toLowerCase() == 'soccer'?
              Image.asset('assets/images/football-ball.png'):
              Icon(Icons.image),
            ),
          ),
        );
      }
      ):
      const Center(
        child: Text('No Store Found'),
      ),
    );
  }
}
