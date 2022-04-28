// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     const MaterialApp(
//       home: ExampleDragAndDrop(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }
//
// const List<Item> _items = [
//   Item(
//     name: 'Spinach Pizza',
//     totalPriceCents: 1299,
//     uid: '1',
//     imageProvider: NetworkImage('https://flutter'
//         '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
//   ),
//   Item(
//     name: 'Veggie Delight',
//     totalPriceCents: 799,
//     uid: '2',
//     imageProvider: NetworkImage('https://flutter'
//         '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
//   ),
//   Item(
//     name: 'Chicken Parmesan',
//     totalPriceCents: 1499,
//     uid: '3',
//     imageProvider: NetworkImage('https://flutter'
//         '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
//   ),
// ];
//
// @immutable
// class ExampleDragAndDrop extends StatefulWidget {
//   const ExampleDragAndDrop({Key? key}) : super(key: key);
//
//   @override
//   _ExampleDragAndDropState createState() => _ExampleDragAndDropState();
// }
//
// class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
//     with TickerProviderStateMixin {
//   final List<Customer> _people = [
//     Customer(
//       name: 'Makayla',
//       imageProvider: const NetworkImage('https://flutter'
//           '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
//     ),
//     Customer(
//       name: 'Nathan',
//       imageProvider: const NetworkImage('https://flutter'
//           '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
//     ),
//     Customer(
//       name: 'Emilio',
//       imageProvider: const NetworkImage('https://flutter'
//           '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
//     ),
//   ];
//
//   final GlobalKey _draggableKey = GlobalKey();
//
//   void _itemDroppedOnCustomerCart({
//     required Item item,
//     required Customer customer,
//   }) {
//     setState(() {
//       customer.items.add(item);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isDepressed = false;
//     return Scaffold(
//         backgroundColor: const Color(0xFFF7F7F7),
//         appBar: AppBar(
//           title: Text("huhjc "),
//           actions: [
//             IconButton(
//                 icon: Stack(
//                   children: const [
//                     Align(
//                       child: Icon(Icons.shopping_cart),
//                       alignment: Alignment.centerLeft,
//                     ),
//                     Align(
//                         alignment: Alignment.topRight,
//                         child: CircleAvatar(
//                           radius: 10,
//                           child: Text(
//                               '',
//                               style: TextStyle(
//                                   fontSize: 11, fontWeight: FontWeight.bold)
//                           ),
//                           backgroundColor: Colors.red,
//                         ))
//                   ],
//                 ),
//                 onPressed: () {}),
//           ],
//         ),
//         body: Stack(
//           children: [
//             SafeArea(
//               child: Column(
//                 children: [
//                   Expanded(
//                       child: ListView.separated(
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: _items.length,
//                     separatorBuilder: (context, index) {
//                       return const SizedBox(
//                         height: 12.0,
//                       );
//                     },
//                     itemBuilder: (context, index) {
//                       final item = _items[index];
//                       return LongPressDraggable<Item>(
//                           data: item,
//                           dragAnchorStrategy: pointerDragAnchorStrategy,
//                           feedback: FractionalTranslation(
//                             translation: const Offset(-0.5, -0.5),
//                             child: ClipRRect(
//                               key: _draggableKey,
//                               borderRadius: BorderRadius.circular(12.0),
//                               child: SizedBox(
//                                 height: 150,
//                                 width: 150,
//                                 child: Opacity(
//                                   opacity: 0.85,
//                                   child: Image(
//                                     image: item.imageProvider,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           child: Material(
//                             elevation: 12.0,
//                             borderRadius: BorderRadius.circular(20),
//                             child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(12.0),
//                                     child: SizedBox(
//                                       width: 120,
//                                       height: 120,
//                                       child: Center(
//                                         child: AnimatedContainer(
//                                           duration:
//                                               const Duration(milliseconds: 100),
//                                           curve: Curves.easeInOut,
//                                           height: isDepressed ? 115 : 120,
//                                           width: isDepressed ? 115 : 120,
//                                           child: Image(
//                                             image: item.imageProvider,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 30.0),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           item.name,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .subtitle1
//                                               ?.copyWith(
//                                                 fontSize: 18.0,
//                                               ),
//                                         ),
//                                         const SizedBox(height: 10.0),
//                                         Text(
//                                           item.formattedTotalItemPrice,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .subtitle1
//                                               ?.copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 18.0,
//                                               ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ));
//                     },
//                   )),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8.0,
//                       vertical: 20.0,
//                     ),
//                     child: Row(
//                       children: _people.map(_buildPersonWithDropZone).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
//
//   Widget _buildPersonWithDropZone(Customer customer) {
//     return Expanded(
//       child: DragTarget<Item>(
//         builder: (context, candidateItems, rejectedItems) {
//           final textColor =
//               candidateItems.isNotEmpty ? Colors.white : Colors.black;
//           return Transform.scale(
//             scale: candidateItems.isNotEmpty ? 1.075 : 1.0,
//             child: Material(
//               elevation: candidateItems.isNotEmpty ? 8.0 : 4.0,
//               borderRadius: BorderRadius.circular(22.0),
//               color: candidateItems.isNotEmpty
//                   ? const Color(0xFFF64209)
//                   : Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12.0,
//                   vertical: 24.0,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Visibility(
//                       visible: customer.items.isNotEmpty,
//                       maintainState: true,
//                       maintainAnimation: true,
//                       maintainSize: true,
//                       child: Column(
//                         children: [
//                           Text(
//                             '${customer.items.length}',
//                             style: Theme.of(context).textTheme.subtitle1!.copyWith(
//                                       color: textColor,
//                                       fontSize: 12.0,
//                                     ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         onAccept: (item) {
//           _itemDroppedOnCustomerCart(
//             item: item,
//             customer: customer,
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Item {
//   const Item({
//     required this.totalPriceCents,
//     required this.name,
//     required this.uid,
//     required this.imageProvider,
//   });
//   final int totalPriceCents;
//   final String name;
//   final String uid;
//   final ImageProvider imageProvider;
//   String get formattedTotalItemPrice =>
//       '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
// }
//
// class Customer {
//   Customer({
//     required this.name,
//     required this.imageProvider,
//     List<Item>? items,
//   }) : items = items ?? [];
//
//   final String name;
//   final ImageProvider imageProvider;
//   final List<Item> items;
//
//   String get formattedTotalItemPrice {
//     final totalPriceCents =
//         items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
//     return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
//   }
// }
