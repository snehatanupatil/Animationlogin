import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Formm extends StatefulWidget {
  @override
  _FormmState createState() => _FormmState();
}

class _FormmState extends State<Formm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List Countries = [
    "India",
    "Australia",
    "Africa",
    "America",
    "Germany",
    "Brazil",
    "Italy"
  ];
  List State = ["Karnataka", "Maharashtra", "Punjab"];
  List City = ["Bangalore", "Mumbai", "Changigarh"];
  List mode = ["offline", "Online"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: width < 500
            ? Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  padding: EdgeInsets.all(4),
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.black54),
                          //  hintText:  'Name',
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.black54),
                          // hintText:  'Email',
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    Divider(),
                    DropdownSearch<dynamic>(
                      mode: Mode.BOTTOM_SHEET,
                      items: Countries,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Name of the  Country",
                        //  hintText: "Name of the  Country",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: print,
                      showSearchBox: true,
                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                          labelText: "Search the Country",
                        ),
                      ),
                      popupShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                    Divider(),
                    DropdownSearch<dynamic>(
                      items: State,
                      maxHeight: 300,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Name of the  State",
                        //  hintText: "Name of the  State",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: print,
                      showSearchBox: true,
                    ),
                    Divider(),
                    DropdownSearch<dynamic>.multiSelection(
                      showSelectedItems: true,
                      showSearchBox: true,
                      compareFn: (i, s) => i == s,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Name of the City",
                        //  hintText: "Choose of the City",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onFind: (filter) => getData(filter),
                      onChanged: (data) {
                        print(data);
                      },
                      favoriteItemBuilder: (context, City, isSelected) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          child: Row(
                            children: [
                              Text(
                                "${City}",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.indigo),
                              ),
                              Padding(padding: EdgeInsets.only(left: 8)),
                              isSelected
                                  ? Icon(Icons.check_box_outlined)
                                  : Container(),
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(),
                    DropdownSearch<dynamic>(
                      items: mode,
                      maxHeight: 300,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Choose a mode",
                        //  hintText: "Choose a mode",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: print,
                    ),
                    Divider(),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Choose date',
                          labelStyle: const TextStyle(color: Colors.black54),
                          hintText: selectedDate == null
                              ? 'Choose date'
                              : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                          hintStyle: const TextStyle(color: Colors.black54),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_today_sharp,
                              size: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Submitt")),
                    )
                  ],
                ),
              )
            : Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Name', labelStyle: const TextStyle(color: Colors.black54,
                            fontSize:20 ),
                          //  hintText:  'Name',
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                    ),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.black54,
                              fontSize:20 ),
                          // hintText:  'Email',
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                    ),
                    DropdownSearch<dynamic>(
                      mode: Mode.BOTTOM_SHEET,
                      items: Countries,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Name of the  Country",
                        labelStyle: const TextStyle(color: Colors.black54,
                            fontSize:20 ),
                        //  hintText: "Name of the  Country",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: print,
                      showSearchBox: true,
                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                          labelText: "Search the Country",
                          labelStyle: const TextStyle(color: Colors.black54,
                              fontSize:20 ),
                        ),
                      ),
                      popupShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                    ),
                    DropdownSearch<dynamic>(
                      items: State,
                      maxHeight: 300,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Name of the  State",
                        labelStyle: const TextStyle(color: Colors.black54,
                            fontSize:20 ),
                        //  hintText: "Name of the  State",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: print,
                      showSearchBox: true,
                    ),
                    Divider(
                      height: 20,
                    ),
                    DropdownSearch<dynamic>.multiSelection(
                      showSelectedItems: true,
                      showSearchBox: true,
                      compareFn: (i, s) => i == s,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Name of the City",
                        labelStyle: const TextStyle(color: Colors.black54,
                            fontSize:20 ),
                        //  hintText: "Choose of the City",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onFind: (filter) => getData(filter),
                      onChanged: (data) {
                        print(data);
                      },
                      favoriteItemBuilder: (context, City, isSelected) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          child: Row(
                            children: [
                              Text(
                                "${City}",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.indigo),
                              ),
                              Padding(padding: EdgeInsets.only(left: 8)),
                              isSelected
                                  ? Icon(Icons.check_box_outlined)
                                  : Container(),
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(
                      height: 20,
                    ),
                    DropdownSearch<dynamic>(
                      items: mode,
                      maxHeight: 300,
                      dropdownSearchDecoration: const InputDecoration(
                        labelText: "Choose a mode",
                        labelStyle: const TextStyle(color: Colors.black54,
                            fontSize:20 ),
                        //  hintText: "Choose a mode",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: print,
                    ),
                    Divider(
                      height: 20,
                    ),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Choose date',
                          labelStyle: const TextStyle(color: Colors.black54,
                              fontSize:20 ),
                          hintText: selectedDate == null
                              ? 'Choose date'
                              : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                          hintStyle: const TextStyle(color: Colors.black54),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_today_sharp,
                              size: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 560, 0, 10),
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                primary: Colors.blue),
                            onPressed: () {},
                            child: const Text(
                              "Submit",
                              style: TextStyle(fontSize: 30),
                            )),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future<List<dynamic>> getData(filter) async {
    var item = City;
    return item;
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}

// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class Formm extends StatefulWidget {
//   @override
//   _FormmState createState() => _FormmState();
// }
//
// class _FormmState extends State<Formm> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController nameController=TextEditingController();
//   DateTime selectedDate= DateTime.now();
//   List Countries=["India","Australia","Africa","America","Germany","Brazil","Italy"];
//   List State=["Karnataka","Maharashtra","Punjab"];
//   List City=["Bangalore","Mumbai","Changigarh"];
//   List mode=["offline","Online"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Form")),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Form(
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: ListView(
//             padding: EdgeInsets.all(4),
//             children: <Widget>[
//              SizedBox(
//                height: 48,
//                child: TextFormField(
//                   style: const TextStyle(color: Colors.black),
//                   controller: nameController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderSide: const BorderSide(width: 3, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(15)),
//                     enabledBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     focusedBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     disabledBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     errorBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     labelText: 'Name',
//                     labelStyle: const TextStyle(color: Colors.black54),
//                   //  hintText:  'Name',
//                     hintStyle: const TextStyle(color: Colors.black54),
//                   ),
//                 ),
//              ),
//               Divider(),
//               SizedBox(
//                 height: 48,
//                 child: TextFormField(
//                   style: const TextStyle(color: Colors.black),
//                   controller: nameController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderSide: const BorderSide(width: 3, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(15)),
//                     enabledBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     focusedBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     disabledBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     errorBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     labelText: 'Email',
//                     labelStyle: const TextStyle(color: Colors.black54),
//                    // hintText:  'Email',
//                     hintStyle: const TextStyle(color: Colors.black54),
//                   ),
//                 ),
//               ),
//               Divider(),
//               DropdownSearch<dynamic>(
//                 mode: Mode.BOTTOM_SHEET,
//                 items: Countries,
//                 dropdownSearchDecoration: const InputDecoration(
//                   labelText: "Name of the  Country",
//                 //  hintText: "Name of the  Country",
//                   contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: print,
//                 showSearchBox: true,
//                 searchFieldProps: const TextFieldProps(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
//                     labelText: "Search the Country",
//                   ),
//                 ),
//                 popupShape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//               ),
//               Divider(),
//               DropdownSearch<dynamic>(
//                 items: State,
//                 maxHeight: 300,
//                 dropdownSearchDecoration: const InputDecoration(
//                   labelText: "Name of the  State",
//                 //  hintText: "Name of the  State",
//                   contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: print,
//                 showSearchBox: true,
//               ),
//               Divider(),
//               DropdownSearch<dynamic>.multiSelection(
//                 showSelectedItems: true,
//                 showSearchBox: true,
//                 compareFn: (i, s) => i == s ,
//                 dropdownSearchDecoration: const InputDecoration(
//                   labelText: "Name of the City",
//                 //  hintText: "Choose of the City",
//                   contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
//                   border: OutlineInputBorder(),
//                 ),
//                 onFind: (filter) => getData(filter),
//                 onChanged: (data) {
//                   print(data);
//                 },
//                 favoriteItemBuilder: (context, City, isSelected) {
//                   return Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey[100]),
//                     child: Row(
//                       children: [
//                         Text(
//                           "${City}",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.indigo),
//                         ),
//                         Padding(padding: EdgeInsets.only(left: 8)),
//                         isSelected
//                             ? Icon(Icons.check_box_outlined)
//                             : Container(),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               Divider(),
//               DropdownSearch<dynamic>(
//                 items: mode,
//                 maxHeight: 300,
//                 dropdownSearchDecoration: const InputDecoration(
//                   labelText: "Choose a mode",
//                 //  hintText: "Choose a mode",
//                   contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: print,
//               ),     Divider(),
//               SizedBox(
//                 height: 48,
//                 child: TextFormField(
//                   style: const TextStyle(color: Colors.black),
//                   controller: nameController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderSide: const BorderSide(width: 3, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(15)),
//                     enabledBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     focusedBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     disabledBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     errorBorder:
//                     const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                     labelText: 'Choose date',
//                     labelStyle: const TextStyle(color: Colors.black54),
//                     hintText:   selectedDate==null ? 'Choose date':  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
//                     hintStyle: const TextStyle(color: Colors.black54),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         _selectDate(context);
//                       },
//                       icon: Icon(Icons.calendar_today_sharp,size: 19,),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(60.0),
//                 child: ElevatedButton(
//                     onPressed: (){}, child:  const Text("Submit")
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<List<dynamic>> getData(filter) async {
//     var item=City;
//     return item;
//   }
//
//   _selectDate(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2010),
//       lastDate: DateTime(2025),
//     );
//     if (selected != null && selected != selectedDate
//     )
//       setState(() {
//         selectedDate = selected;
//       });
//   }
// }
//
//
