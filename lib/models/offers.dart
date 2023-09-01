

import 'categoryArray.dart';

class Offers {
  String? lmdId;
  String? store;
  String? merchantHomepage;
  String? offerText;
  String? offerValue;
  String? title;
  String? description;
  String? code;
  String? termsAndConditions;
  String? categories;
  CategoryArray? categoryArray;
  String? featured;
  String? publisherExclusive;
  String? url;
  String? smartLink;
  String? imageUrl;
  String? type;
  String? offer;
  String? status;
  String? startDate;
  String? endDate;

  Offers(
      {this.lmdId,
        this.store,
        this.merchantHomepage,
        this.offerText,
        this.offerValue,
        this.title,
        this.description,
        this.code,
        this.termsAndConditions,
        this.categories,
        this.categoryArray,
        this.featured,
        this.publisherExclusive,
        this.url,
        this.smartLink,
        this.imageUrl,
        this.type,
        this.offer,
        this.status,
        this.startDate,
        this.endDate});

  Offers.fromJson(Map<String, dynamic> json) {
    lmdId = json['lmd_id'];
    store = json['store'];
    merchantHomepage = json['merchant_homepage'];
    offerText = json['offer_text'];
    offerValue = json['offer_value'];
    title = json['title'];
    description = json['description'];
    code = json['code'];
    termsAndConditions = json['terms_and_conditions'];
    categories = json['categories'];
    categoryArray = json['category_array'] != null
        ? CategoryArray.fromJson(json['category_array'])
        : null;
    featured = json['featured'];
    publisherExclusive = json['publisher_exclusive'];
    url = json['url'];
    smartLink = json['smartLink'];
    imageUrl = json['image_url'];
    type = json['type'];
    offer = json['offer'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lmd_id'] = lmdId;
    data['store'] = store;
    data['merchant_homepage'] = merchantHomepage;
    data['offer_text'] = offerText;
    data['offer_value'] = offerValue;
    data['title'] = title;
    data['description'] = description;
    data['code'] = code;
    data['terms_and_conditions'] = termsAndConditions;
    data['categories'] = categories;
    if (categoryArray != null) {
      data['category_array'] = categoryArray!.toJson();
    }
    data['featured'] = featured;
    data['publisher_exclusive'] = publisherExclusive;
    data['url'] = url;
    data['smartLink'] = smartLink;
    data['image_url'] = imageUrl;
    data['type'] = type;
    data['offer'] = offer;
    data['status'] = status;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}