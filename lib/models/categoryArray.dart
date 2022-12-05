


class CategoryArray {
  var stationary;
  var homeAndLiving;
  var healthAndBeauty;
  //List<Null>? giftItems;
  var fashion;
  var entertainment;
  var kidsAndToddlers;

  CategoryArray(
      {this.stationary,
        this.homeAndLiving,
        this.healthAndBeauty,
        // this.giftItems,
        this.fashion,
        this.entertainment,
        this.kidsAndToddlers});

  CategoryArray.fromJson(Map<String, dynamic> json) {
    stationary = json['Stationary'];
    homeAndLiving = json['Home and Living'];
    healthAndBeauty = json['Health and Beauty'];
    if (json['Gift Items'] != null) {
      // giftItems = <Null>[];
      // json['Gift Items'].forEach((v) {
      //   giftItems!.add(Null.fromJson(v));
      // });
    }
    fashion = json['Fashion'];
    entertainment = json['Entertainment'];
    kidsAndToddlers = json['Kids and Toddlers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Stationary'] = stationary;
    data['Home and Living'] = homeAndLiving;
    data['Health and Beauty'] = healthAndBeauty;
    // if (giftItems != null) {
    //   data['Gift Items'] = giftItems!.map((v) => v.toJson()).toList();
    // }
    data['Fashion'] = fashion;
    data['Entertainment'] = entertainment;
    data['Kids and Toddlers'] = kidsAndToddlers;
    return data;
  }
}