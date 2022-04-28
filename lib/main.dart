import 'package:flutter/material.dart';
import 'reg.dart';
import 'log.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated Login',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  AnimationController? animationController;
  Duration animationDuration = Duration(milliseconds: 80);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width;
    width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);
    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.linear));
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: isLogin ? 0.0 : 1.0,
            duration: animationDuration,
            child: Align(
              alignment: Alignment.topCenter,
              child: width<500?
              Container(
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: isLogin
                      ? null
                      : () {
                          animationController!.reverse();
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                  color: Colors.black,
                ),
              ):Container(
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: isLogin
                      ? null
                      : () {
                    animationController!.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  color: Colors.black,
                ),
              ),
            ),
          ),
          LoginForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultLoginSize),
          AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }
              return Container();
            },
          ),
          RegisterForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultRegisterSize),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: width<500?Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: Colors.black12),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  animationController!.forward();
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? const Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                )
              : null,
        ),
      ):Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: Colors.black12),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
            animationController!.forward();
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: isLogin
              ? const Text(
            "Don't have an account? Sign up",
            style: TextStyle(color: Colors.blue, fontSize: 26),
          )
              : null,
        ),
      ),
    );
  }
}

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }
//
// class _MyPageState extends State<MyPage> {
//   File? imageFile;
//   PlatformFile? file;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image Picker"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         RaisedButton(
//                           color: Colors.greenAccent,
//                           onPressed: () {
//                             _getFromGallery();
//                           },
//                           child: const Text("PICK FROM GALLERY"),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Container(
//                     child: Image.file(
//                       imageFile!,
//                       fit: BoxFit.cover,
//                     ),
//                   )));
//   }
//
//   _getFromGallery() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Drag and Drop'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _indexOfDroppedItem = 0;
//   bool _isDragging = true;
//
//   void _acceptDraggedItem(int index) {
//     setState(() {
//       _indexOfDroppedItem = index;
//     });
//   }
//
//   void _setIsDragging() {
//     setState(() {
//       _isDragging = true;
//     });
//   }
//
//   void _resetIsDragging() {
//     setState(() {
//       _isDragging = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: GridView.count(
//           shrinkWrap: true,
//           primary: false,
//           crossAxisCount: 2,
//           children: List.generate(6, (index) {
//             return Padding(
//               padding: const EdgeInsets.all(44.0),
//               child: index == _indexOfDroppedItem
//                   ? Draggable<int>(
//                 data: index,
//                 child: Container(
//                   child: Image.asset('assets/images/pc.jpg'),
//                 ),
//                 childWhenDragging: Container(
//                   child: Image.asset('assets/images/pc.jpg'),
//                 ),
//                 feedback: Container(
//                   width: 100,
//                   height: 100,
//                   child: Image.asset('assets/images/pc.jpg'),
//                 ),
//               )
//                   : DragTarget<int>(
//                 builder: (
//                     BuildContext context,
//                     List<dynamic> accepted,
//                     List<dynamic> rejected,
//                     ) {
//                   return Container(
//                     child:Image.asset('assets/images/pc.jpg')
//                   );
//                 },
//                 onAccept: (int data) {
//                   _acceptDraggedItem(index);
//                 },
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Drag and Drop'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // int _indexOfDroppedItem =0;
//   bool _indexOfDroppedItem =true;
//   bool _isDragging = false;
//
//   void _acceptDraggedItem(bool index) {
//     setState(() {
//       _indexOfDroppedItem = true;
//     });
//   }
//
//   void _setIsDragging() {
//     setState(() {
//       _isDragging = true;
//     });
//   }
//
//   void _resetIsDragging() {
//     setState(() {
//       _isDragging = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
//         ],
//       ),
//       body: Center(
//         child: GridView.count(
//           shrinkWrap: true,
//           primary: false,
//           crossAxisCount: 2,
//           children: List.generate(6, (index) {
//             return Padding(
//               padding: const EdgeInsets.all(44.0),
//               child: _indexOfDroppedItem
//                   ? Draggable<bool>(
//                       data: true,
//                       child: Container(
//                         child: Image.asset('assets/images/pc.jpg'),
//                       ),
//                       childWhenDragging: Container(
//                      child: Image.asset('assets/images/pc.jpg'),
//                       ),
//                       onDragStarted: () {
//                         _setIsDragging();
//                       },
//                       onDraggableCanceled: (_, __) {
//                         _resetIsDragging();
//                       },
//                       onDragCompleted: () {
//                         _resetIsDragging();
//                       },
//                       feedback: Container(
//                         width: 100,
//                         height: 100,
//                         child: Image.asset('assets/images/pc.jpg'),
//                       ),
//                     )
//                   : DragTarget<bool>(
//                       builder: (
//                         BuildContext context,
//                         List<dynamic> accepted,
//                         List<dynamic> rejected,
//                       ) {
//                         return Container(
//                             decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.blue,
//                           ),
//                           borderRadius: BorderRadius.all(_isDragging
//                               ? const Radius.circular(20)
//                               : const Radius.circular(10)),
//                         )
//                         );
//                       },
//                       onAccept: (bool data) {
//                         _acceptDraggedItem(false);
//                       },
//                     ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

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
//   void _itemDroppedOnCustomerCart({required Item item, required Customer customer,}) {
//     setState(() {
//       customer.items.add(item);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F7F7),
//       appBar: _buildAppBar(),
//       body: _buildContent(),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       iconTheme: const IconThemeData(color: Color(0xFFF64209)),
//       title: Text(
//         'Order Food',
//         style: Theme.of(context).textTheme.headline4?.copyWith(
//           fontSize: 36,
//           color: const Color(0xFFF64209),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       backgroundColor: const Color(0xFFF7F7F7),
//       elevation: 0,
//     );
//   }
//
//   Widget _buildContent() {
//     return Stack(
//       children: [
//         SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: _buildMenuList(),
//               ),
//               _buildPeopleRow(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildMenuList() {
//     return ListView.separated(
//       padding: const EdgeInsets.all(16.0),
//       itemCount: _items.length,
//       separatorBuilder: (context, index) {
//         return const SizedBox(
//           height: 12.0,
//         );
//       },
//       itemBuilder: (context, index) {
//         final item = _items[index];
//         return _buildMenuItem(
//           item: item,
//         );
//       },
//     );
//   }
//
//   Widget _buildMenuItem({
//     required Item item,
//   }) {
//     return LongPressDraggable<Item>(
//       data: item,
//       dragAnchorStrategy: pointerDragAnchorStrategy,
//       feedback: DraggingListItem(
//         dragKey: _draggableKey,
//         photoProvider: item.imageProvider,
//       ),
//       child: MenuListItem(
//         name: item.name,
//         price: item.formattedTotalItemPrice,
//         photoProvider: item.imageProvider,
//       ),
//     );
//   }
//
//   Widget _buildPeopleRow() {
//     return Container(
//       color: Colors.greenAccent,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 8.0,
//         vertical: 20.0,
//       ),
//       child: Row(
//           children:
//           //  [
//           //    IconButton(onPressed: () { _buildPersonWithDropZone; }, icon: Icon(Icons.shopping_cart),)
//           // ]
//           //[]
//           _people.map(_buildPersonWithDropZone).toList()
//       ),
//     );
//   }
//
//   Widget _buildPersonWithDropZone(Customer customer) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 6.0,
//         ),
//         child: DragTarget<Item>(
//           builder: (context, candidateItems, rejectedItems) {
//             if(customer !=null) {
//               return CustomerCart(
//                 hasItems: customer.items.isNotEmpty,
//                 //  highlighted: candidateItems.isNotEmpty,
//                 customer: customer,
//               );
//             }
//             return  Card();
//           },
//           onAccept: (item) {
//             _itemDroppedOnCustomerCart(
//               item: item,
//               customer: customer,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class CustomerCart extends StatelessWidget {
//   const CustomerCart({
//     Key? key,
//     required this.customer,
//     // this.highlighted = false,
//     this.hasItems = false,
//   }) : super(key: key);
//
//   final Customer customer;
//   // final bool highlighted;
//   final bool hasItems;
//
//   @override
//   Widget build(BuildContext context) {
//     final textColor =
//     //highlighted ? Colors.white :
//     Colors.black;
//
//     return Transform.scale(
//       scale:
//       //highlighted ? 1.075:
//       1.0,
//       child: Card(
//         child: GestureDetector(
//           onTap: (){
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CartDetail()),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12.0,
//               vertical: 24.0,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Visibility(
//                   visible: hasItems,
//                   maintainState: true,
//                   maintainAnimation: true,
//                   maintainSize: true,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 4.0),
//                       Text(
//                         customer.formattedTotalItemPrice,
//                         style: Theme.of(context).textTheme.caption!.copyWith(
//                           color: textColor,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4.0),
//                       Text(
//                         '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
//                         style: Theme.of(context).textTheme.subtitle1!.copyWith(
//                           color: textColor,
//                           fontSize: 12.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class CartDetail extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body:
//
//     );
//   }
//
// }
//
// class MenuListItem extends StatelessWidget {
//   const MenuListItem({
//     Key? key,
//     this.name = '',
//     this.price = '',
//     required this.photoProvider,
//     this.isDepressed = false,
//   }) : super(key: key);
//
//   final String name;
//   final String price;
//   final ImageProvider photoProvider;
//   final bool isDepressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 12.0,
//       borderRadius: BorderRadius.circular(20),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12.0),
//               child: SizedBox(
//                 width: 120,
//                 height: 120,
//                 child: Center(
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 100),
//                     curve: Curves.easeInOut,
//                     height: isDepressed ? 115 : 120,
//                     width: isDepressed ? 115 : 120,
//                     child: Image(
//                       image: photoProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 30.0),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   Text(
//                     price,
//                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DraggingListItem extends StatelessWidget {
//   const DraggingListItem({
//     Key? key,
//     required this.dragKey,
//     required this.photoProvider,
//   }) : super(key: key);
//
//   final GlobalKey dragKey;
//   final ImageProvider photoProvider;
//
//   @override
//   Widget build(BuildContext context) {
//     return FractionalTranslation(
//       translation: const Offset(-0.5, -0.5),
//       child: ClipRRect(
//         key: dragKey,
//         borderRadius: BorderRadius.circular(12.0),
//         child: SizedBox(
//           height: 150,
//           width: 150,
//           child: Opacity(
//             opacity: 0.85,
//             child: Image(
//               image:
//               //AssetImage(''),
//               photoProvider,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// @immutable
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
//     items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
//     return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
//   }
//
//   String get addedname {
//     final name =
//     items.fold<String>('', (prev, item) => prev + item.name);
//     return name;
//   }
// }

// Widget buildImage(BuildContext context) {
//   if (file == null) return buildEmptyFile('No Selected File');
//   print(file!.url);
//   return Column(
//     children: [
//       if (file != null) buildFileDetail(file),
//       FlatButton(
//         onPressed: () {
//           OpenFile.open(file.toString());
//         },
//         child: Text("View file"),
//       )
//       // Image.network(file!.url,
//       //   width: MediaQuery.of(context).size.width ,
//       //   height: MediaQuery.of(context).size.height,
//       //   fit: BoxFit.cover,
//       //   errorBuilder:(context,error,_)=>buildEmptyFile('No Preview'),
//       // ),
//     ],
//   );
// }
//
// Widget buildEmptyFile(String text) {
//   return Container(
//     width: 120,
//     height: 120,
//     color: Colors.blue.shade300,
//     child: Center(child: Text(text)),
//   );
// }

// Widget buildFileDetail(File_Data_Model? file) {
//   final style = TextStyle(fontSize: 20);
//   return Container(
//     margin: EdgeInsets.only(left: 24),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           'Selected File Preview ',
//           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//         Text(
//           'Name: ${file?.name}',
//           style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Text('Type: ${file?.mime}', style: style),
//         const SizedBox(
//           height: 10,
//         ),
//         Text('Size: ${file?.size}', style: style),
//         SizedBox(
//           height: 20,
//         )
//       ],
//     ),
//   );
// }
// import 'package:flutter/material.dart';
// import 'reg.dart';
// import 'log.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Animated Login',
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   bool isLogin = true;
//   late Animation<double> containerSize;
//   AnimationController? animationController;
//   Duration animationDuration = Duration(milliseconds: 80);
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: animationDuration);
//   }
//
//   @override
//   void dispose() {
//     animationController!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double viewInset = MediaQuery.of(context).viewInsets.bottom;
//     double defaultLoginSize = size.height - (size.height * 0.2);
//     double defaultRegisterSize = size.height - (size.height * 0.1);
//     containerSize =
//         Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
//             .animate(CurvedAnimation(
//                 parent: animationController!, curve: Curves.linear));
//     return Scaffold(
//       body: Stack(
//         children: [
//           AnimatedOpacity(
//             opacity: isLogin ? 0.0 : 1.0,
//             duration: animationDuration,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 width: size.width,
//                 height: size.height * 0.1,
//                 alignment: Alignment.bottomCenter,
//                 child: IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: isLogin
//                       ? null
//                       : () {
//                           animationController!.reverse();
//                           setState(() {
//                             isLogin = !isLogin;
//                           });
//                         },
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           LoginForm(
//               isLogin: isLogin,
//               animationDuration: animationDuration,
//               size: size,
//               defaultLoginSize: defaultLoginSize),
//           AnimatedBuilder(
//             animation: animationController!,
//             builder: (context, child) {
//               if (viewInset == 0 && isLogin) {
//                 return buildRegisterContainer();
//               } else if (!isLogin) {
//                 return buildRegisterContainer();
//               }
//               return Container();
//             },
//           ),
//           RegisterForm(
//               isLogin: isLogin,
//               animationDuration: animationDuration,
//               size: size,
//               defaultLoginSize: defaultRegisterSize),
//         ],
//       ),
//     );
//   }
//
//   Widget buildRegisterContainer() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         width: double.infinity,
//         height: containerSize.value,
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(100),
//               topRight: Radius.circular(100),
//             ),
//             color: Colors.black12),
//         alignment: Alignment.center,
//         child: GestureDetector(
//           onTap: !isLogin
//               ? null
//               : () {
//                   animationController!.forward();
//                   setState(() {
//                     isLogin = !isLogin;
//                   });
//                 },
//           child: isLogin
//               ? const Text(
//                   "Don't have an account? Sign up",
//                   style: TextStyle(color: Colors.blue, fontSize: 18),
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // class MyPage extends StatefulWidget {
// //   @override
// //   _MyPageState createState() => _MyPageState();
// // }
// //
// // class _MyPageState extends State<MyPage> {
// //   File? imageFile;
// //   PlatformFile? file;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text("Image Picker"),
// //         ),
// //         body: Container(
// //             child: imageFile == null
// //                 ? Container(
// //                     alignment: Alignment.center,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: <Widget>[
// //                         RaisedButton(
// //                           color: Colors.greenAccent,
// //                           onPressed: () {
// //                             _getFromGallery();
// //                           },
// //                           child: const Text("PICK FROM GALLERY"),
// //                         ),
// //                       ],
// //                     ),
// //                   )
// //                 : Container(
// //                     child: Image.file(
// //                       imageFile!,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   )));
// //   }
// //
// //   _getFromGallery() async {
// //     PickedFile? pickedFile = await ImagePicker().getImage(
// //       source: ImageSource.gallery,
// //       maxWidth: 1800,
// //       maxHeight: 1800,
// //     );
// //     if (pickedFile != null) {
// //       setState(() {
// //         imageFile = File(pickedFile.path);
// //       });
// //     }
// //   }
// // }
//
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Drag and Drop'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _indexOfDroppedItem = 0;
// //   bool _isDragging = true;
// //
// //   void _acceptDraggedItem(int index) {
// //     setState(() {
// //       _indexOfDroppedItem = index;
// //     });
// //   }
// //
// //   void _setIsDragging() {
// //     setState(() {
// //       _isDragging = true;
// //     });
// //   }
// //
// //   void _resetIsDragging() {
// //     setState(() {
// //       _isDragging = true;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: GridView.count(
// //           shrinkWrap: true,
// //           primary: false,
// //           crossAxisCount: 2,
// //           children: List.generate(6, (index) {
// //             return Padding(
// //               padding: const EdgeInsets.all(44.0),
// //               child: index == _indexOfDroppedItem
// //                   ? Draggable<int>(
// //                 data: index,
// //                 child: Container(
// //                   child: Image.asset('assets/images/pc.jpg'),
// //                 ),
// //                 childWhenDragging: Container(
// //                   child: Image.asset('assets/images/pc.jpg'),
// //                 ),
// //                 feedback: Container(
// //                   width: 100,
// //                   height: 100,
// //                   child: Image.asset('assets/images/pc.jpg'),
// //                 ),
// //               )
// //                   : DragTarget<int>(
// //                 builder: (
// //                     BuildContext context,
// //                     List<dynamic> accepted,
// //                     List<dynamic> rejected,
// //                     ) {
// //                   return Container(
// //                     child:Image.asset('assets/images/pc.jpg')
// //                   );
// //                 },
// //                 onAccept: (int data) {
// //                   _acceptDraggedItem(index);
// //                 },
// //               ),
// //             );
// //           }),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Drag and Drop'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   // int _indexOfDroppedItem =0;
// //   bool _indexOfDroppedItem =true;
// //   bool _isDragging = false;
// //
// //   void _acceptDraggedItem(bool index) {
// //     setState(() {
// //       _indexOfDroppedItem = true;
// //     });
// //   }
// //
// //   void _setIsDragging() {
// //     setState(() {
// //       _isDragging = true;
// //     });
// //   }
// //
// //   void _resetIsDragging() {
// //     setState(() {
// //       _isDragging = false;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //         actions: [
// //           IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
// //         ],
// //       ),
// //       body: Center(
// //         child: GridView.count(
// //           shrinkWrap: true,
// //           primary: false,
// //           crossAxisCount: 2,
// //           children: List.generate(6, (index) {
// //             return Padding(
// //               padding: const EdgeInsets.all(44.0),
// //               child: _indexOfDroppedItem
// //                   ? Draggable<bool>(
// //                       data: true,
// //                       child: Container(
// //                         child: Image.asset('assets/images/pc.jpg'),
// //                       ),
// //                       childWhenDragging: Container(
// //                      child: Image.asset('assets/images/pc.jpg'),
// //                       ),
// //                       onDragStarted: () {
// //                         _setIsDragging();
// //                       },
// //                       onDraggableCanceled: (_, __) {
// //                         _resetIsDragging();
// //                       },
// //                       onDragCompleted: () {
// //                         _resetIsDragging();
// //                       },
// //                       feedback: Container(
// //                         width: 100,
// //                         height: 100,
// //                         child: Image.asset('assets/images/pc.jpg'),
// //                       ),
// //                     )
// //                   : DragTarget<bool>(
// //                       builder: (
// //                         BuildContext context,
// //                         List<dynamic> accepted,
// //                         List<dynamic> rejected,
// //                       ) {
// //                         return Container(
// //                             decoration: BoxDecoration(
// //                           border: Border.all(
// //                             color: Colors.blue,
// //                           ),
// //                           borderRadius: BorderRadius.all(_isDragging
// //                               ? const Radius.circular(20)
// //                               : const Radius.circular(10)),
// //                         )
// //                         );
// //                       },
// //                       onAccept: (bool data) {
// //                         _acceptDraggedItem(false);
// //                       },
// //                     ),
// //             );
// //           }),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(
// //     const MaterialApp(
// //       home: ExampleDragAndDrop(),
// //       debugShowCheckedModeBanner: false,
// //     ),
// //   );
// // }
// //
// // const List<Item> _items = [
// //   Item(
// //     name: 'Spinach Pizza',
// //     totalPriceCents: 1299,
// //     uid: '1',
// //     imageProvider: NetworkImage('https://flutter'
// //         '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
// //   ),
// //   Item(
// //     name: 'Veggie Delight',
// //     totalPriceCents: 799,
// //     uid: '2',
// //     imageProvider: NetworkImage('https://flutter'
// //         '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
// //   ),
// //   Item(
// //     name: 'Chicken Parmesan',
// //     totalPriceCents: 1499,
// //     uid: '3',
// //     imageProvider: NetworkImage('https://flutter'
// //         '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
// //   ),
// // ];
// //
// // @immutable
// // class ExampleDragAndDrop extends StatefulWidget {
// //   const ExampleDragAndDrop({Key? key}) : super(key: key);
// //
// //   @override
// //   _ExampleDragAndDropState createState() => _ExampleDragAndDropState();
// // }
// //
// // class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
// //     with TickerProviderStateMixin {
// //   final List<Customer> _people = [
// //     Customer(
// //       name: 'Makayla',
// //       imageProvider: const NetworkImage('https://flutter'
// //           '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
// //     ),
// //     Customer(
// //       name: 'Nathan',
// //       imageProvider: const NetworkImage('https://flutter'
// //           '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
// //     ),
// //     Customer(
// //       name: 'Emilio',
// //       imageProvider: const NetworkImage('https://flutter'
// //           '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
// //     ),
// //   ];
// //
// //   final GlobalKey _draggableKey = GlobalKey();
// //
// //   void _itemDroppedOnCustomerCart({required Item item, required Customer customer,}) {
// //     setState(() {
// //       customer.items.add(item);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF7F7F7),
// //       appBar: _buildAppBar(),
// //       body: _buildContent(),
// //     );
// //   }
// //
// //   PreferredSizeWidget _buildAppBar() {
// //     return AppBar(
// //       iconTheme: const IconThemeData(color: Color(0xFFF64209)),
// //       title: Text(
// //         'Order Food',
// //         style: Theme.of(context).textTheme.headline4?.copyWith(
// //           fontSize: 36,
// //           color: const Color(0xFFF64209),
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       backgroundColor: const Color(0xFFF7F7F7),
// //       elevation: 0,
// //     );
// //   }
// //
// //   Widget _buildContent() {
// //     return Stack(
// //       children: [
// //         SafeArea(
// //           child: Column(
// //             children: [
// //               Expanded(
// //                 child: _buildMenuList(),
// //               ),
// //               _buildPeopleRow(),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildMenuList() {
// //     return ListView.separated(
// //       padding: const EdgeInsets.all(16.0),
// //       itemCount: _items.length,
// //       separatorBuilder: (context, index) {
// //         return const SizedBox(
// //           height: 12.0,
// //         );
// //       },
// //       itemBuilder: (context, index) {
// //         final item = _items[index];
// //         return _buildMenuItem(
// //           item: item,
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildMenuItem({
// //     required Item item,
// //   }) {
// //     return LongPressDraggable<Item>(
// //       data: item,
// //       dragAnchorStrategy: pointerDragAnchorStrategy,
// //       feedback: DraggingListItem(
// //         dragKey: _draggableKey,
// //         photoProvider: item.imageProvider,
// //       ),
// //       child: MenuListItem(
// //         name: item.name,
// //         price: item.formattedTotalItemPrice,
// //         photoProvider: item.imageProvider,
// //       ),
// //     );
// //   }
// //
// //   Widget _buildPeopleRow() {
// //     return Container(
// //       color: Colors.greenAccent,
// //       padding: const EdgeInsets.symmetric(
// //         horizontal: 8.0,
// //         vertical: 20.0,
// //       ),
// //       child: Row(
// //           children:
// //           //  [
// //           //    IconButton(onPressed: () { _buildPersonWithDropZone; }, icon: Icon(Icons.shopping_cart),)
// //           // ]
// //           //[]
// //           _people.map(_buildPersonWithDropZone).toList()
// //       ),
// //     );
// //   }
// //
// //   Widget _buildPersonWithDropZone(Customer customer) {
// //     return Expanded(
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(
// //           horizontal: 6.0,
// //         ),
// //         child: DragTarget<Item>(
// //           builder: (context, candidateItems, rejectedItems) {
// //             if(customer !=null) {
// //               return CustomerCart(
// //                 hasItems: customer.items.isNotEmpty,
// //                 //  highlighted: candidateItems.isNotEmpty,
// //                 customer: customer,
// //               );
// //             }
// //             return  Card();
// //           },
// //           onAccept: (item) {
// //             _itemDroppedOnCustomerCart(
// //               item: item,
// //               customer: customer,
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class CustomerCart extends StatelessWidget {
// //   const CustomerCart({
// //     Key? key,
// //     required this.customer,
// //     // this.highlighted = false,
// //     this.hasItems = false,
// //   }) : super(key: key);
// //
// //   final Customer customer;
// //   // final bool highlighted;
// //   final bool hasItems;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final textColor =
// //     //highlighted ? Colors.white :
// //     Colors.black;
// //
// //     return Transform.scale(
// //       scale:
// //       //highlighted ? 1.075:
// //       1.0,
// //       child: Card(
// //         child: GestureDetector(
// //           onTap: (){
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => CartDetail()),
// //             );
// //           },
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(
// //               horizontal: 12.0,
// //               vertical: 24.0,
// //             ),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Visibility(
// //                   visible: hasItems,
// //                   maintainState: true,
// //                   maintainAnimation: true,
// //                   maintainSize: true,
// //                   child: Column(
// //                     children: [
// //                       const SizedBox(height: 4.0),
// //                       Text(
// //                         customer.formattedTotalItemPrice,
// //                         style: Theme.of(context).textTheme.caption!.copyWith(
// //                           color: textColor,
// //                           fontSize: 16.0,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 4.0),
// //                       Text(
// //                         '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
// //                         style: Theme.of(context).textTheme.subtitle1!.copyWith(
// //                           color: textColor,
// //                           fontSize: 12.0,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // class CartDetail extends StatelessWidget{
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // body:
// //
// //     );
// //   }
// //
// // }
// //
// // class MenuListItem extends StatelessWidget {
// //   const MenuListItem({
// //     Key? key,
// //     this.name = '',
// //     this.price = '',
// //     required this.photoProvider,
// //     this.isDepressed = false,
// //   }) : super(key: key);
// //
// //   final String name;
// //   final String price;
// //   final ImageProvider photoProvider;
// //   final bool isDepressed;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       elevation: 12.0,
// //       borderRadius: BorderRadius.circular(20),
// //       child: Padding(
// //         padding: const EdgeInsets.all(12.0),
// //         child: Row(
// //           mainAxisSize: MainAxisSize.max,
// //           children: [
// //             ClipRRect(
// //               borderRadius: BorderRadius.circular(12.0),
// //               child: SizedBox(
// //                 width: 120,
// //                 height: 120,
// //                 child: Center(
// //                   child: AnimatedContainer(
// //                     duration: const Duration(milliseconds: 100),
// //                     curve: Curves.easeInOut,
// //                     height: isDepressed ? 115 : 120,
// //                     width: isDepressed ? 115 : 120,
// //                     child: Image(
// //                       image: photoProvider,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(width: 30.0),
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     name,
// //                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
// //                       fontSize: 18.0,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10.0),
// //                   Text(
// //                     price,
// //                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 18.0,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class DraggingListItem extends StatelessWidget {
// //   const DraggingListItem({
// //     Key? key,
// //     required this.dragKey,
// //     required this.photoProvider,
// //   }) : super(key: key);
// //
// //   final GlobalKey dragKey;
// //   final ImageProvider photoProvider;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return FractionalTranslation(
// //       translation: const Offset(-0.5, -0.5),
// //       child: ClipRRect(
// //         key: dragKey,
// //         borderRadius: BorderRadius.circular(12.0),
// //         child: SizedBox(
// //           height: 150,
// //           width: 150,
// //           child: Opacity(
// //             opacity: 0.85,
// //             child: Image(
// //               image:
// //               //AssetImage(''),
// //               photoProvider,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // @immutable
// // class Item {
// //   const Item({
// //     required this.totalPriceCents,
// //     required this.name,
// //     required this.uid,
// //     required this.imageProvider,
// //   });
// //   final int totalPriceCents;
// //   final String name;
// //   final String uid;
// //   final ImageProvider imageProvider;
// //   String get formattedTotalItemPrice =>
// //       '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
// // }
// //
// // class Customer {
// //   Customer({
// //     required this.name,
// //     required this.imageProvider,
// //     List<Item>? items,
// //   }) : items = items ?? [];
// //
// //   final String name;
// //   final ImageProvider imageProvider;
// //   final List<Item> items;
// //
// //   String get formattedTotalItemPrice {
// //     final totalPriceCents =
// //     items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
// //     return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
// //   }
// //
// //   String get addedname {
// //     final name =
// //     items.fold<String>('', (prev, item) => prev + item.name);
// //     return name;
// //   }
// // }
//
//
//
// // Widget buildImage(BuildContext context) {
// //   if (file == null) return buildEmptyFile('No Selected File');
// //   print(file!.url);
// //   return Column(
// //     children: [
// //       if (file != null) buildFileDetail(file),
// //       FlatButton(
// //         onPressed: () {
// //           OpenFile.open(file.toString());
// //         },
// //         child: Text("View file"),
// //       )
// //       // Image.network(file!.url,
// //       //   width: MediaQuery.of(context).size.width ,
// //       //   height: MediaQuery.of(context).size.height,
// //       //   fit: BoxFit.cover,
// //       //   errorBuilder:(context,error,_)=>buildEmptyFile('No Preview'),
// //       // ),
// //     ],
// //   );
// // }
// //
// // Widget buildEmptyFile(String text) {
// //   return Container(
// //     width: 120,
// //     height: 120,
// //     color: Colors.blue.shade300,
// //     child: Center(child: Text(text)),
// //   );
// // }
//
// // Widget buildFileDetail(File_Data_Model? file) {
// //   final style = TextStyle(fontSize: 20);
// //   return Container(
// //     margin: EdgeInsets.only(left: 24),
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Selected File Preview ',
// //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
// //         ),
// //         Text(
// //           'Name: ${file?.name}',
// //           style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
// //         ),
// //         const SizedBox(
// //           height: 10,
// //         ),
// //         Text('Type: ${file?.mime}', style: style),
// //         const SizedBox(
// //           height: 10,
// //         ),
// //         Text('Size: ${file?.size}', style: style),
// //         SizedBox(
// //           height: 20,
// //         )
// //       ],
// //     ),
// //   );
// // }
