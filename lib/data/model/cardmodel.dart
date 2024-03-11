class CardModel {
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

  CardModel(
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

  CardModel.fromJson(Map<String, dynamic> json) {
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
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['card_id'] = this.cardId;
    data['card_userid'] = this.cardUserid;
    data['card_itemsid'] = this.cardItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_activ'] = this.itemsActiv;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_data'] = this.itemsData;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}