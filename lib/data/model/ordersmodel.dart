class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersCoupon;
  String? ordersDatetime;
  String? ordersPaymentmethodes;
  String? ordersTotalprice;
  String? ordersStatuse;
  String? ordersRating;
  String? ordersNoterating;
  String? addressId;
  String? addressUsersid;
  String? addressCity;
  String? addressStreet;
  String? addressName;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPaymentmethodes,
      this.ordersTotalprice,
      this.ordersStatuse,
      this.ordersRating,
      this.ordersNoterating,
      this.addressId,
      this.addressUsersid,
      this.addressCity,
      this.addressStreet,
      this.addressName});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethodes = json['orders_paymentmethodes'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatuse = json['orders_statuse'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_datetime'] = ordersDatetime;
    data['orders_paymentmethodes'] = ordersPaymentmethodes;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_statuse'] = ordersStatuse;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_name'] = addressName;
    return data;
  }
}
