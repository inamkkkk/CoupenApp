import 'offers.dart';

class Coupons {
  bool? result;
  List<Offers>? offers;

  Coupons({this.result, this.offers});

  Coupons.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


