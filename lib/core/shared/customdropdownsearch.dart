import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDrobDownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedID;

  const CustomDrobDownSearch({
    super.key,
    required this.title,
    required this.listdata,
    required this.dropDownSelectedName,
    required this.dropDownSelectedID,
  });

  @override
  State<CustomDrobDownSearch> createState() => _CustomDrobDownSearchState();
}

class _CustomDrobDownSearchState extends State<CustomDrobDownSearch> {
  void showDropDownSearch() {
    //    "drop_down_list" هي عبارة عن حزمة جاهزة
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          //         //عنوان الشريط

          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        // isSearchVisible: false,   // شريط البحث الذي بداخل الشريط  مرىي
        //isDismissible: false,  //اذاكانت صحيحة لايمكن اغلاق الشريط اذا نقرناعلى الشاشة يلي خلفه
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata, //         //هي عبارة عن قا~مة اختياراتك
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem =
              selectedList[0]; //تعني اول عنصر بالعناصر المضغوطة
          widget.dropDownSelectedName.text =
              selectedListItem.name; //عملية اسناد
          widget.dropDownSelectedID.text =
              selectedListItem.value!; //من اجل ان تعطي دليل العنصر المختار
          print("1111111111111111");
          print(selectedListItem.value);
          print("11111111111111111");
          // List<String> list = [];
          // for(var item in selectedList) {
          //   if(item is SelectedListItem) {
          //     list.add(item.name);
          //   }
          // }
          // showSnackBar(list.toString());
        },
        // enableMultipleSelection: true,  //تعني ممكن ان نختار اكثر من خيار
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropDownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus(); //لم يلاحظ فرق حذفها
        showDropDownSearch();
      },
      decoration: InputDecoration(
          hintText: widget.dropDownSelectedName.text ==
                  "" //اظهار الصنف المختار في الحقل النصي
              ? widget.title
              : widget.dropDownSelectedName.text,
          prefixIcon: const Icon(
            Icons.category,
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down)),
    );
  }
}
