class MyFavorateModel {
  String? favorateId;
  String? favorateUserid;
  String? favorateItemsid;
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
  String? usersId;

  MyFavorateModel(
      {this.favorateId,
      this.favorateUserid,
      this.favorateItemsid,
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
      this.itemsCat,
      this.usersId});

  MyFavorateModel.fromJson(Map<String, dynamic> json) {
    favorateId = json['favorate_id'];
    favorateUserid = json['favorate_userid'];
    favorateItemsid = json['favorate_itemsid'];
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
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorate_id'] = favorateId;
    data['favorate_userid'] = favorateUserid;
    data['favorate_itemsid'] = favorateItemsid;
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
    data['users_id'] = usersId;
    return data;
  }
}
