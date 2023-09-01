import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api-services/apiServices.dart';
import '../main.dart';
import '../models/offers.dart';



class DetailScreen extends StatefulWidget {
  final String? url;
  final String? imageUrl;
  final String? offerText;
  final String? title;
  final String? code;
  final String? store;
  final String? startDate;
  final String? endDate;
  final String? merchantHomePage;
  final String? offerValue;
  final String? offer;
  final String? lmId;
  //final int i;
  List<Offers> lfi;


   DetailScreen({
    @required this.url,
    @required this.code,
    @required this.store,
    @required this.startDate,
    @required this.offerText,
    @required this.offerValue,
    @required this.offer,
    @required this.title,
    @required this.endDate,
    @required this.merchantHomePage,
     @required this.imageUrl,
     @required this.lmId,
     required this.lfi,
     //required this.i,
});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var check = true;

  void getdata () async {
    //await getResponse ();
    fav();
    setState(() {
    });
     //kfav = json.decode(prefs.getString('lf'));
    if (json.decode(prefs!.getString('lf')) != null) {
      kfav.clear();
      var map = json.decode(prefs.getString('lf'));
      for (var v in map) {
        kfav.add(Offers.fromJson(v));
      }
    }
    print(kfav.length);
  }

@override
  void initState() {
    // TODO: implement initState
  getdata();
  //print(kfav.length);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.7)  ,
        title: const Text('Info'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined,),

        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () async{
                     final  _url = Uri.parse('${widget.merchantHomePage}');
                    //final _url = offersList!.offers![0].store;
                    if (!await launchUrl(
                      _url,
                      mode: LaunchMode.externalNonBrowserApplication,
                    )) {
                      throw 'Could not launch $_url';
                    }
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 10,right: 10,left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                    //               image: widget.imageUrl == ''?
                    //                 const DecorationImage(
                    //                 image: AssetImage('assets/images/defualt.png'),
                    //             //  NetworkImage('${ltl[i].imageUrl}')
                    //             fit: BoxFit.fitHeight,):
                    //       DecorationImage(
                    //       //image: AssetImage('assets/images/defualt.png'),
                    //       image: NetworkImage('${widget.imageUrl}'),
                    //   fit: BoxFit.cover,
                    // ),
                                ),
                                child:widget.imageUrl != ''?
                                Image.network('${widget.imageUrl}'):
                                Image.asset('assets/images/defualt.png',scale: 5,),
                              ),

                          ),
                          const SizedBox(height: 20,),
                          Text('${widget.store}'.split('.')[0],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 10,),

                          Text(
                            widget.code == ''?
                                '${widget.title}' :
                              '${widget.offerText}',

                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text('${widget.startDate}',
                            style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                widget.offer == 'Percentage-Off'?
                Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Text('Discount',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text('${widget.offerValue}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),

                        ],
                      ),
                    ),
                    ):
                const SizedBox(),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Coupon',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                widget.code != ''?
                                  '${widget.code}' :
                                    '---',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          style:  ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.withOpacity(0.4),
                          ),
                            onPressed:  () async{
                          final  _url = Uri.parse('${widget.url}');
                          //final _url = offersList!.offers![0].store;
                          if (!await launchUrl(
                            _url,
                            mode: LaunchMode.externalNonBrowserApplication,
                          )) {
                            throw 'Could not launch $_url';
                          }
                        },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Get Deal'.toUpperCase(),style: const TextStyle(
                                  color: Colors.deepPurple,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('How to buy this product?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,

                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('1. Go to product page',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            final  _url = Uri.parse('${widget.url}');
                            //final _url = offersList!.offers![0].store;
                            if (!await launchUrl(
                              _url,
                              mode: LaunchMode.externalNonBrowserApplication,
                            )) {
                              throw 'Could not launch $_url';
                            }
                          },
                          child: Text(
                              '${widget.url}',
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2
                            ),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                          children: [
                            const TextSpan(
                              text: 'at '
                            ),
                            TextSpan(
                              text: '${widget.store}'.split('.')[0]
                            ),
                            const TextSpan(
                              text: ' and buy the product'
                            ),
                          ]
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: TextButton(
                    style:  ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.4),
                    ),
                    onPressed:  () async{
                      var b = jsonEncode(widget.lfi[0]);
                      var map = jsonDecode(b);


                      if(kfav.isNotEmpty){
                        print('not empty');
                      for (var v in kfav) {
                        print('in loop');
                        print(kfav.length);

                        if (v.lmdId == widget.lmId) {
                          print('condition satisfied');
                          check = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Already Saved'),
                            ),);
                        }
                        print('end of loop');
                      }
                    }else{
                        print('list is empty');

                        kfav.add(Offers.fromJson(map));
                        check = false;
                        print('add in list when empty');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('1st Deal Saved'),
                            ));
                      }

                      if(check){
                      kfav.add(Offers.fromJson(map));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Deal Saved'),
                              ),
                          );
                      }


                      await prefs.setString('lf', json.encode(kfav));
                      print(prefs.getString('lf'));
                      },


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Save Deal'.toUpperCase(),style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
