class AppLink {
  static const String server = "";
  static const String imagestatic = "";

  //++++++++++++++++++++++++++++++Image+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  //============================================================================================
  static const String test = "$server/test.php";
  //=================================auth=====================================================
  static const String login = "$server/admin_login.php";
  //=================================forgetpassword==========================================;
  static const String checkemail = "$server/admin_checkemail1.php";
  static const String verifycode1forgetpassword =
      "$server/admin_verifycode1.php";
  static const String resendverfiycode = "$server/admin_resendverfiycode.php";
  static const String resetpassword1 = "$server/admin_resetpassword1.php";

//=======================================orders==============================================

  static const String approveorder = "$server/admin_orders_approve.php";
  static const String prepareorder = "$server/  admin_orders_prepare.php";
  static const String archiveorder = "$server/admin_orders_archive.php";
  static const String viewacceptedorder ="$server/admin_orders_viewaccepted.php";
  static const String viewpendingorder = "$server/admin_orders_viewpending.php";
  static const String detailesorder = "$server/admin_orders_detailes.php";

//  static const String doneorder = "$server/admin_orders_done.php";

//categories

  static const String categoriesview = "$server/admin_categories_view.php";
  static const String categoriesadd = "$server/admin_categories_add.php";
  static const String categoriesdelete = "$server/admin_categories_delete.php";
  static const String categoriesedite = "$server/admin_categories_edit.php";

//items
  static const String itemsview = "$server/admin_items_view.php";
  static const String itemsadd = "$server/admin_items_add.php";
  static const String itmesdelete = "$server/admin_items_delete.php";
  static const String itemsedite = "$server/admin_items_edit.php";
}
