// ignore_for_file: unnecessary_new

class CartModel {
  String? itemsprice;
  String? countitems;
  String? cardId;
  String? cardUserid;
  String? cardItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActiv;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsData;
  String? itemsCat;

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cardId,
      this.cardUserid,
      this.cardItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActiv,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsData,
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cardId = json['card_id'];
    cardUserid = json['card_userid'];
    cardItemsid = json['card_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActiv = json['items_activ'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsData = json['items_data'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['card_id'] = cardId;
    data['card_userid'] = cardUserid;
    data['card_itemsid'] = cardItemsid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_activ'] = itemsActiv;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_data'] = itemsData;
    data['items_cat'] = itemsCat;
    return data;
  }
}
