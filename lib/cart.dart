import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'data.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isLoading = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: const Text("List of items")),
        body: width < 500
            ? SingleChildScrollView(
                child: isLoading
                    ? Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(6, 10, 0, 10),
                                // Padding(
                                // padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // SizedBox(
                                    //     width:90,
                                    //     child: Shimmer.fromColors(
                                    //       child: Container(
                                    //         color: Colors.white,
                                    //         child: Image.asset(explore[index]
                                    //   // "assets/images/pc.jpg"
                                    // ),
                                    //       ),
                                    //       baseColor: Colors.black12,
                                    //       highlightColor: Colors.black38,
                                    //     )
                                    // ),
                                    //

                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.0),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: double.infinity,
                                            height: 18.0,
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.white,
                                                // width: double.infinity,
                                                // height: 18.0,
                                                // child:  Text(title[index]),
                                              ),
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.black38,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 18.0,
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.white,
                                                // width: double.infinity,
                                                // height: 18.0,
                                              ),
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.black38,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 18,
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.white,
                                              ),
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.black38,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }))
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(6, 10, 0, 10),
                                // Padding(
                                // padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                        width: 90,
                                        child: Image.asset(explore[index]
                                            // "assets/images/pc.jpg"
                                            )),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.0),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            height: 18.0,
                                            child: Text(title[index]),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 18.0,
                                            child: Text(currancy[index]),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                  size: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })))
            : SingleChildScrollView(
                child: isLoading
                    ? Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(6, 10, 0, 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.0),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: double.infinity,
                                            height: 18.0,
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.white,
                                              ),
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.black38,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 18.0,
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.white,
                                                // width: double.infinity,
                                                // height: 18.0,
                                              ),
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.black38,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 18,
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.white,
                                              ),
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.black38,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }))
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                        width: 190,
                                        child: Image.asset(explore[index],)),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            height: 30.0,
                                            child: Text(title[index],
                                              style: TextStyle(fontSize: 20),),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 20.0,
                                            child: Text(currancy[index],
                                              style: TextStyle(fontSize: 20),),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }))));
  }
}

// class Cart extends StatefulWidget {
//   final String image;
//   final String title;
//   Cart({Key? key, required this.image, required this.title}) : super(key: key);
//   @override
//   _Cart createState() => _Cart();
// }
//
// class _Cart extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Cart")),
//       body: Container(
//         child: Column(
//           children: [
//             Image.asset(widget.image),
//             Text(widget.title),
//           ],
//         ),
//       ),
//     );
//   }

// _onItemReorder(
//     int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
//   setState(() {
//     var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
//     _contents[newListIndex].children.insert(newItemIndex, movedItem);
//   });
// }
//
// _onListReorder(int oldListIndex, int newListIndex) {
//   setState(() {
//     var movedList = _contents.removeAt(oldListIndex);
//     _contents.insert(newListIndex, movedList);
//   });
// }
//
// _onItemAdd(DragAndDropItem newItem, int listIndex, int itemIndex) {
//   print('adding new item');
//   setState(() {
//     if (itemIndex == -1)
//       _contents[listIndex].children.add(newItem);
//     else
//       _contents[listIndex].children.insert(itemIndex, newItem);
//   });
// }
//
// _onListAdd(DragAndDropListInterface newList, int listIndex) {
//   print('adding new list');
//   setState(() {
//     if (listIndex == -1)
//       _contents.add(newList as DragAndDropList);
//     else
//       _contents.insert(listIndex, newList as DragAndDropList);
//   });
// }
//}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'data.dart';
//
// const _shimmerGradient = LinearGradient(
//   colors: [
//     Color(0xFFEBEBF4),
//     Color(0xFFF4F4F4),
//     Color(0xFFEBEBF4),
//   ],
//   stops: [
//     0.1,
//     0.3,
//     0.4,
//   ],
//   begin: Alignment(-1.0, -0.3),
//   end: Alignment(1.0, 0.3),
//   tileMode: TileMode.clamp,
// );
//
// class ListItem extends StatefulWidget {
//   @override
//   _ListItemState createState() => _ListItemState();
// }
//
// class _ListItemState extends State<ListItem> {
//   bool isLoading = true;
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 3)).then((value) {
//       setState(() {
//         isLoading = false;
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text("List of items")),
//         body: SingleChildScrollView(
//             child: isLoading
//                 ? Container(
//                     color: Colors.white,
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                         itemCount: 6,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Padding(
//                             padding: const EdgeInsets.fromLTRB(6, 10, 0, 10),
//                             // Padding(
//                             // padding: const EdgeInsets.only(bottom: 8.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//
//                                 // SizedBox(
//                                 //     width:90,
//                                 //     child: Shimmer.fromColors(
//                                 //       child: Container(
//                                 //         color: Colors.white,
//                                 //         child: Image.asset(explore[index]
//                                 //   // "assets/images/pc.jpg"
//                                 // ),
//                                 //       ),
//                                 //       baseColor: Colors.black12,
//                                 //       highlightColor: Colors.black38,
//                                 //     )
//                                 // ),
//                                 //
//
//                                 const Padding(
//                                   padding:
//                                   EdgeInsets.symmetric(horizontal: 6.0),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       SizedBox(
//                                         width: double.infinity,
//                                         height: 18.0,
//                                         child: Shimmer.fromColors(
//                                           child: Container(
//                                             color: Colors.white,
//                                             // width: double.infinity,
//                                             // height: 18.0,
//                                            // child:  Text(title[index]),
//                                           ),
//                                           baseColor: Colors.black12,
//                                           highlightColor: Colors.black38,
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding:
//                                         EdgeInsets.symmetric(vertical: 2.0),
//                                       ),
//                                       SizedBox(
//                                         width: double.infinity,
//                                         height: 18.0,
//                                         child: Shimmer.fromColors(
//                                           child: Container(
//                                             color: Colors.white,
//                                             // width: double.infinity,
//                                             // height: 18.0,
//                                           ),
//                                           baseColor: Colors.black12,
//                                           highlightColor: Colors.black38,
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding:
//                                         EdgeInsets.symmetric(vertical: 2.0),
//                                       ),
//                                       SizedBox(
//                                       width: double.infinity,
//                                         height: 18,
//                                         child: Shimmer.fromColors(
//                                           child: Container(
//                                             color: Colors.white,
//                                           ),
//                                           baseColor: Colors.black12,
//                                           highlightColor: Colors.black38,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           );
//                         }
//                         )
//                   )
//                 : Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                         itemCount: 6,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Padding(
//                             padding: const EdgeInsets.fromLTRB(6, 10, 0, 10),
//                             // Padding(
//                             // padding: const EdgeInsets.only(bottom: 8.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 SizedBox(
//                                     width:90,child: Image.asset(explore[index]
//                                    // "assets/images/pc.jpg"
//                                 )
//                                 ),
//                                 const Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 6.0),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Container(
//                                         width: double.infinity,
//                                         height: 18.0,
//                                         child:  Text(title[index]),
//                                       ),
//                                       const Padding(
//                                         padding:
//                                             EdgeInsets.symmetric(vertical: 2.0),
//                                       ),
//                                       Container(
//                                         width: double.infinity,
//                                         height: 18.0,
//                                         child: Text(currancy[index]),
//                                       ),
//                                       const Padding(
//                                         padding:
//                                             EdgeInsets.symmetric(vertical: 2.0),
//                                       ),
//                                       Container(
//                                         child:  Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: const [
//                                             Icon(Icons.star, color: Colors.green,size: 10,),
//                                             Icon(Icons.star, color: Colors.green,size: 10,),
//                                             Icon(Icons.star, color: Colors.green,size: 10,),
//                                             Icon(Icons.star, color: Colors.black,size: 10,),
//                                             Icon(Icons.star, color: Colors.black,size: 10,),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           );
//                         }))));
//
//     //   ),
//     // return Padding(
//     //   padding: const EdgeInsets.only(
//     //       top: 8.0, bottom: 8.0, left: 0.0, right: 0.0),
//     //   child: SizedBox(
//     //     height: 30,
//     //     width: MediaQuery.of(context).size.width,
//     //     child: const Text(
//     //       "It's not about work it's about lifestyle.",
//     //       style: TextStyle(fontSize: 16),
//     //     ),),
//     // );
//     //             }),
//     //       ) ),
//     // );
//   }
// }
//
// // class Cart extends StatefulWidget {
// //   final String image;
// //   final String title;
// //   Cart({Key? key, required this.image, required this.title}) : super(key: key);
// //   @override
// //   _Cart createState() => _Cart();
// // }
// //
// // class _Cart extends State<Cart> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Cart")),
// //       body: Container(
// //         child: Column(
// //           children: [
// //             Image.asset(widget.image),
// //             Text(widget.title),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
//
// // _onItemReorder(
// //     int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
// //   setState(() {
// //     var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
// //     _contents[newListIndex].children.insert(newItemIndex, movedItem);
// //   });
// // }
// //
// // _onListReorder(int oldListIndex, int newListIndex) {
// //   setState(() {
// //     var movedList = _contents.removeAt(oldListIndex);
// //     _contents.insert(newListIndex, movedList);
// //   });
// // }
// //
// // _onItemAdd(DragAndDropItem newItem, int listIndex, int itemIndex) {
// //   print('adding new item');
// //   setState(() {
// //     if (itemIndex == -1)
// //       _contents[listIndex].children.add(newItem);
// //     else
// //       _contents[listIndex].children.insert(itemIndex, newItem);
// //   });
// // }
// //
// // _onListAdd(DragAndDropListInterface newList, int listIndex) {
// //   print('adding new list');
// //   setState(() {
// //     if (listIndex == -1)
// //       _contents.add(newList as DragAndDropList);
// //     else
// //       _contents.insert(listIndex, newList as DragAndDropList);
// //   });
// // }
// //}
