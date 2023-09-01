import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key? key}) : super(key: key);

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
          child: Deals(),
      ),
    );
  }
}



class Deals extends StatelessWidget {
  var firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {


    return StreamBuilder(
      stream: firebase.collection('Deals').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return  Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green.withOpacity(0.7),
            ),
          );
        }
        if (snapshot.hasData) {
          final deal = snapshot.data!.docs;
          List<Widget> messageBubbles = [];
          for (var deals in deal) {
            // final id = deals.data()['docid'];
            // final lmd_id = deals.data()['lmd_id'];
            //final merchant_homepage = deals.data()['merchant_homepage'];
            // final offer_value = deals.data()['offer_value'];
            //final description = deals.data()['description'];
            // final term_and_condition = deals.data()['term_and_condition'];
            // final categories = deals.data()['categories'];
            // final featured = deals.data()['featured'];
            // final publisher_exclusive = deals.data()['publisher_exclusive'];
            // final smartLink = deals.data()['smartLink'];
            // final offer = deals.data()['offer'];
            // final status = deals.data()['status'];
            // final start_date = deals.data()['start_date'];
            // final end_date = deals.data()['end_date'];
            final url = deals.data()['url'];
            final store = deals.data()['store'];
            final offer_text = deals.data()['offer_text'];
            final title = deals.data()['title'];
            final code = deals.data()['code'];
            final image_url = deals.data()['image_url'];
            final type = deals.data()['type'];

            final messageBubble = ofr(
              ontap: () async{
                final  _url = Uri.parse('${url}');
                if (!await launchUrl(
                  _url,
                  mode: LaunchMode.externalNonBrowserApplication,
                )) {
                  throw 'Could not launch $_url';
                }
              },
              image_url: image_url,
              title: title,
              code: code,
              type: type,
              store: store,
              offer_text: offer_text,
            );

            messageBubbles.add(messageBubble);

          }
          return messageBubbles.isNotEmpty?
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 5.0,
              //mainAxisExtent: 200,
              //crossAxisSpacing: 30.0,
            ),
            physics:   const AlwaysScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            children: messageBubbles,
            reverse: false,
          ):Container();
        }
        return const Center(
          child: Text('No Data Found'),
        );
      },
    );
  }
}
Widget ofr({var image_url,title, offer_text, code,type, store, ontap}){
  return InkWell(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(18),
                  image: image_url != ''?
                  DecorationImage(
                    image: NetworkImage('${image_url}'),
                    fit: BoxFit.fill,
                  ):
                  const DecorationImage(
                      image: AssetImage('assets/images/defualt.png'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 8,right: 8,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          code == ""?
                          '${title}'
                              :'${offer_text}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            //fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          code == ""?
                          '${type}'
                              :'${code}',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          '${store}'.split('.')[0],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    ),
  );
}