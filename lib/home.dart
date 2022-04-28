import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_share/flutter_share.dart';
import 'account.dart';
import 'data.dart';
import 'cart.dart';
import 'menu.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Interval opacityCurve =
  const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  late AnimationController _drawerSlideController;

  share(String title) async {
    await FlutterShare.share(title: title);
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }
  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
        appBar: AppBar(
          title: Text("Explore"),
          leading:
          IconButton(
            icon: Stack(
              children: const [
                Align(
                  child: Icon(CupertinoIcons.list_bullet),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
            onPressed: () =>
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ListItem())),
          ),
          actions: [
            AnimatedBuilder(
              animation: _drawerSlideController,
              builder: (context, child) {
                return IconButton(
                  onPressed: _toggleDrawer,
                  icon: _isDrawerOpen() || _isDrawerOpening()
                      ? const Icon(
                    Icons.clear,
                  )
                      : const Icon(
                    Icons.menu,
                  ),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserAccount()),
                  );
                },
                icon: Icon(Icons.person)),
          ],
        ),
        body:Stack(
            children: [
              home(),
              menu(),
            ]
        )
    );
  }

  Widget swipe(){
    return  Expanded(
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.asset(
            explore[index],
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: explore.length,
        pagination: SwiperPagination(
            margin: EdgeInsets.zero,
            builder: SwiperCustomPagination(builder: (context, config) {
              return ConstrainedBox(
                child: Row(
                  children: <Widget>[
                    Text(
                      '${title[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: const DotSwiperPaginationBuilder(
                            color: Colors.black12,
                            activeColor: Colors.black,
                            size: 10.0,
                            activeSize: 20.0)
                            .build(context, config),
                      ),
                    )
                  ],
                ),
                constraints: const BoxConstraints.expand(height: 50.0),
              );
            })),
        control: const SwiperControl(color: Colors.redAccent),
      ),
    );
  }
  Widget menu(){
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        print("llll ${_drawerSlideController.value}");
        return FractionalTranslation(
          translation: Offset(
              1.0 - _drawerSlideController.value,
              0.0),
          child:
          _isDrawerClosed() ?  Container(color: Colors.white,) : Menu(),
        );
      },
    );
  }

  Widget home() {
    double width = MediaQuery.of(context).size.width;
    return width<500 ? CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return LongPressDraggable(
                  data: explore[index],
                  dragAnchorStrategy: pointerDragAnchorStrategy,
                  feedback: Container(
                    child: Stack(children: [
                      Image(
                        image: AssetImage(explore[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 140, 110, 0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                title[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                currancy[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  child: Container(
                      child: GestureDetector(
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(explore[index]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 97, 30, 0),
                            child: Container(
                              width: 160,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    title[index],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(currancy[index]),
                                ],
                              ),
                            ),
                          )
                        ]),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder<void>(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return AnimatedBuilder(
                                    animation: animation,
                                    builder: (BuildContext context, Widget? child) {
                                      return Opacity(
                                        opacity:
                                        opacityCurve.transform(animation.value),
                                        child: _buildPage(
                                            context,
                                            explore[index],
                                            desc[index],
                                            title[index],
                                            currancy[index],
                                            review[index]),
                                      );
                                    });
                              },
                            ),
                          );
                        },
                      )));
            },
            childCount: 6,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
        ),
      ],
    ):CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return LongPressDraggable(
                  data: explore[index],
                  dragAnchorStrategy: pointerDragAnchorStrategy,
                  feedback: Container(
                    child: Stack(
                        children: [
                      Image(
                        image: AssetImage(explore[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 140, 110, 0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                title[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                currancy[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  child: Container(
                      child: GestureDetector(
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(explore[index]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 216, 30, 0),
                            child: Container(
                              width: 160,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    title[index],
                                    style: const TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                  ),
                                  Text(currancy[index],style:const TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20),),
                                ],
                              ),
                            ),
                          )
                        ]),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder<void>(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return AnimatedBuilder(
                                    animation: animation,
                                    builder: (BuildContext context, Widget? child) {
                                      return Opacity(
                                        opacity:
                                        opacityCurve.transform(animation.value),
                                        child: _buildPage(
                                            context,
                                            explore[index],
                                            desc[index],
                                            title[index],
                                            currancy[index],
                                            review[index]),
                                      );
                                    });
                              },
                            ),
                          );
                        },
                      )));
            },
            childCount: 6,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context, String image, String description,
      String title, String currancy, String review) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: width<500?Hero(
          tag: '',
          child: SingleChildScrollView(
            child: Card(
              elevation: 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(53, 50, 0, 0),
                              child: Text(
                                title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(160, 50, 0, 0),
                              child: IconButton(
                                  onPressed: () {
                                    share(title);
                                  },
                                  icon: Icon(Icons.share)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                          child: InkWell(
                            child: Image.asset(image),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Container(
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                      currancy,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    )),
                                const SizedBox(
                                  width: 130,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.star, color: Colors.green, size: 18),
                                    Icon(Icons.star, color: Colors.green, size: 18),
                                    Icon(Icons.star, color: Colors.green, size: 18),
                                    Icon(Icons.star, color: Colors.black, size: 18),
                                    Icon(Icons.star, color: Colors.black, size: 18),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${review + 'reviews'}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.5,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'free delivery by 19 nov tue ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            leading: Icon(
                              Icons.delivery_dining,
                              color: Colors.blue[500],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text(
                              '10 days return policy',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            leading: Icon(
                              Icons.assignment_return,
                              color: Colors.blue[500],
                            ),
                          ),
                          ListTile(
                            title: const Text('offers'),
                            leading: Icon(
                              Icons.local_offer,
                              color: Colors.blue[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'free delivery by 19 nov tue ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            leading: Icon(
                              Icons.delivery_dining,
                              color: Colors.blue[500],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text(
                              '10 days return policy',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            leading: Icon(
                              Icons.assignment_return,
                              color: Colors.blue[500],
                            ),
                          ),
                          ListTile(
                            title: const Text('offers'),
                            leading: Icon(
                              Icons.local_offer,
                              color: Colors.blue[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          color: Colors.blue,
                          splashColor: Colors.grey,
                          padding: const EdgeInsets.fromLTRB(60, 18, 60, 10),
                          onPressed: () {},
                          child: const Text("Add to cart"),
                        ),
                        FlatButton(
                          color: Colors.blue,
                          splashColor: Colors.grey,
                          padding: const EdgeInsets.fromLTRB(60, 18, 80, 10),
                          onPressed: () {},
                          child: const Text("Wishlist"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ): Hero(
      tag: '',
      child: SingleChildScrollView(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(250, 50, 0, 0),
                          child: Text(
                            title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(160, 50, 0, 0),
                          child: IconButton(
                              onPressed: () {
                                share(title);
                              },
                              icon: Icon(Icons.share,size: 33,)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 60),
                      child: InkWell(
                        child: Image.asset(image),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                                  currancy,
                                  style: const TextStyle(
                                      color: Colors.black,fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                )),
                            const SizedBox(
                              width: 430,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.star, color: Colors.green, size: 22),
                                Icon(Icons.star, color: Colors.green, size: 22),
                                Icon(Icons.star, color: Colors.green, size: 22),
                                Icon(Icons.star, color: Colors.black, size: 22),
                                Icon(Icons.star, color: Colors.black, size: 22),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${review + 'reviews'}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.5,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12,20,10,10),
                child: SizedBox(
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'free delivery by 19 nov tue ',
                            style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          leading: Icon(
                            Icons.delivery_dining,
                            color: Colors.blue[500],
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            '10 days return policy',
                            style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          leading: Icon(
                            Icons.assignment_return,
                            color: Colors.blue[500],
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('offers',style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 20),),
                          leading: Icon(
                            Icons.local_offer,
                            color: Colors.blue[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12,10,10,10),
                child: SizedBox(
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'free delivery by 19 nov tue ',
                            style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          leading: Icon(
                            Icons.delivery_dining,
                            color: Colors.blue[500],
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            '10 days return policy',
                            style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          leading: Icon(
                            Icons.assignment_return,
                            color: Colors.blue[500],
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('offers',
                             style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                          leading: Icon(
                            Icons.local_offer,
                            color: Colors.blue[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,150,10,10),
                child: Container(
                  child: Row(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        splashColor: Colors.grey,
                        padding: const EdgeInsets.fromLTRB(160, 18, 140, 10),
                        onPressed: () {},
                        child: const Text("Add to cart",style: TextStyle(
                            fontSize: 20),),
                      ),
                      FlatButton(
                        color: Colors.blue,
                        splashColor: Colors.grey,
                        padding: const EdgeInsets.fromLTRB(160, 18,140, 10),
                        onPressed: () {},
                        child: const Text("Wishlist",style: TextStyle(
                            fontSize: 20),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// import 'dart:ui';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'account.dart';
// import 'data.dart';
// import 'cart.dart';
// import 'menu.dart';
//
// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//   Interval opacityCurve =
//       const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
//   late AnimationController _drawerSlideController;
//
//   share(String title) async {
//     await FlutterShare.share(title: title);
//   }
//
//   bool _isDrawerOpen() {
//     return _drawerSlideController.value == 1.0;
//   }
//
//   bool _isDrawerOpening() {
//     return _drawerSlideController.status == AnimationStatus.forward;
//   }
//
//   bool _isDrawerClosed() {
//     return _drawerSlideController.value == 0.0;
//   }
//
//   void _toggleDrawer() {
//     if (_isDrawerOpen() || _isDrawerOpening()) {
//       _drawerSlideController.reverse();
//     } else {
//       _drawerSlideController.forward();
//     }
//   }
//   @override
//   void initState() {
//     super.initState();
//     _drawerSlideController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 150),
//     );
//   }
//
//   @override
//   void dispose() {
//     _drawerSlideController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     timeDilation = 3;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Explore"),
//         leading:
//         IconButton(
//           icon: Stack(
//             children: const [
//               Align(
//                 child: Icon(CupertinoIcons.list_bullet),
//                 alignment: Alignment.centerLeft,
//               ),
//             ],
//           ),
//           onPressed: () =>
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => ListItem())),
//         ),
//         actions: [
//           AnimatedBuilder(
//         animation: _drawerSlideController,
//         builder: (context, child) {
//           return IconButton(
//             onPressed: _toggleDrawer,
//             icon: _isDrawerOpen() || _isDrawerOpening()
//                 ? const Icon(
//               Icons.clear,
//             )
//                 : const Icon(
//               Icons.menu,
//             ),
//           );
//         },
//       ),
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const UserAccount()),
//                 );
//               },
//               icon: Icon(Icons.person)),
//         ],
//       ),
//       body:Stack(
//           children: [
//             home(),
//             menu(),
//           ]
//       )
//     );
//   }
//
//   Widget swipe(){
//     return  Expanded(
//       child: Swiper(
//         itemBuilder: (context, index) {
//           return Image.asset(
//             explore[index],
//             fit: BoxFit.fill,
//           );
//         },
//         autoplay: true,
//         itemCount: explore.length,
//         pagination: SwiperPagination(
//             margin: EdgeInsets.zero,
//             builder: SwiperCustomPagination(builder: (context, config) {
//               return ConstrainedBox(
//                 child: Row(
//                   children: <Widget>[
//                     Text(
//                       '${title[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
//                       style: const TextStyle(fontSize: 20.0),
//                     ),
//                     Expanded(
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: const DotSwiperPaginationBuilder(
//                             color: Colors.black12,
//                             activeColor: Colors.black,
//                             size: 10.0,
//                             activeSize: 20.0)
//                             .build(context, config),
//                       ),
//                     )
//                   ],
//                 ),
//                 constraints: const BoxConstraints.expand(height: 50.0),
//               );
//             })),
//         control: const SwiperControl(color: Colors.redAccent),
//       ),
//     );
//   }
//   Widget menu(){
//     return AnimatedBuilder(
//       animation: _drawerSlideController,
//       builder: (context, child) {
//         print("llll ${_drawerSlideController.value}");
//         return FractionalTranslation(
//           translation: Offset(
//               1.0 - _drawerSlideController.value,
//               0.0),
//           child:
//          _isDrawerClosed() ?  Container(color: Colors.white,) : Menu(),
//         );
//       },
//     );
//   }
//
//   Widget home() {
//     return CustomScrollView(
//       slivers: [
//         SliverGrid(
//           delegate: SliverChildBuilderDelegate(
//             (context, index) {
//               return LongPressDraggable(
//                   data: explore[index],
//                   dragAnchorStrategy: pointerDragAnchorStrategy,
//                   feedback: Container(
//                     child: Stack(children: [
//                       Image(
//                         image: AssetImage(explore[index]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(110, 140, 110, 0),
//                         child: Container(
//                           color: Colors.white,
//                           child: Column(
//                             children: [
//                               Text(
//                                 title[index],
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 currancy[index],
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ]),
//                   ),
//                   child: Container(
//                       child: GestureDetector(
//                     child: Stack(children: [
//                       Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(explore[index]),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(30, 97, 30, 0),
//                         child: Container(
//                           width: 160,
//                           color: Colors.white,
//                           child: Column(
//                             children: [
//                               Text(
//                                 title[index],
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(currancy[index]),
//                             ],
//                           ),
//                         ),
//                       )
//                     ]),
//                     onTap: () {
//                       Navigator.of(context).push(
//                         PageRouteBuilder<void>(
//                           pageBuilder: (BuildContext context,
//                               Animation<double> animation,
//                               Animation<double> secondaryAnimation) {
//                             return AnimatedBuilder(
//                                 animation: animation,
//                                 builder: (BuildContext context, Widget? child) {
//                                   return Opacity(
//                                     opacity:
//                                         opacityCurve.transform(animation.value),
//                                     child: _buildPage(
//                                         context,
//                                         explore[index],
//                                         desc[index],
//                                         title[index],
//                                         currancy[index],
//                                         review[index]),
//                                   );
//                                 });
//                           },
//                         ),
//                       );
//                     },
//                   )));
//             },
//             childCount: 6,
//           ),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: 2,
//             crossAxisSpacing: 2,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPage(BuildContext context, String image, String description,
//       String title, String currancy, String review) {
//     return Scaffold(
//         body: Hero(
//       tag: '',
//       child: SingleChildScrollView(
//         child: Card(
//           elevation: 8.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.all(0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(53, 50, 0, 0),
//                           child: Text(
//                             title,
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(160, 50, 0, 0),
//                           child: IconButton(
//                               onPressed: () {
//                                 share(title);
//                               },
//                               icon: Icon(Icons.share)),
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
//                       child: InkWell(
//                         child: Image.asset(image),
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ),
//                     Container(
//                       child: Text(
//                         description,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontFamily: 'Georgia',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const Divider(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                                 child: Text(
//                               currancy,
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w800),
//                             )),
//                             const SizedBox(
//                               width: 130,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               mainAxisSize: MainAxisSize.min,
//                               children: const [
//                                 Icon(Icons.star, color: Colors.green, size: 18),
//                                 Icon(Icons.star, color: Colors.green, size: 18),
//                                 Icon(Icons.star, color: Colors.green, size: 18),
//                                 Icon(Icons.star, color: Colors.black, size: 18),
//                                 Icon(Icons.star, color: Colors.black, size: 18),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   '${review + 'reviews'}',
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w800,
//                                     fontFamily: 'Roboto',
//                                     letterSpacing: 0.5,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 child: Card(
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: const Text(
//                           'free delivery by 19 nov tue ',
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                         leading: Icon(
//                           Icons.delivery_dining,
//                           color: Colors.blue[500],
//                         ),
//                       ),
//                       const Divider(),
//                       ListTile(
//                         title: const Text(
//                           '10 days return policy',
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                         leading: Icon(
//                           Icons.assignment_return,
//                           color: Colors.blue[500],
//                         ),
//                       ),
//                       ListTile(
//                         title: const Text('offers'),
//                         leading: Icon(
//                           Icons.local_offer,
//                           color: Colors.blue[500],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 child: Card(
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: const Text(
//                           'free delivery by 19 nov tue ',
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                         leading: Icon(
//                           Icons.delivery_dining,
//                           color: Colors.blue[500],
//                         ),
//                       ),
//                       const Divider(),
//                       ListTile(
//                         title: const Text(
//                           '10 days return policy',
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                         leading: Icon(
//                           Icons.assignment_return,
//                           color: Colors.blue[500],
//                         ),
//                       ),
//                       ListTile(
//                         title: const Text('offers'),
//                         leading: Icon(
//                           Icons.local_offer,
//                           color: Colors.blue[500],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     FlatButton(
//                       color: Colors.blue,
//                       splashColor: Colors.grey,
//                       padding: const EdgeInsets.fromLTRB(60, 18, 60, 10),
//                       onPressed: () {},
//                       child: const Text("Add to cart"),
//                     ),
//                     FlatButton(
//                       color: Colors.blue,
//                       splashColor: Colors.grey,
//                       padding: const EdgeInsets.fromLTRB(60, 18, 80, 10),
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => Cart(image: image, title:title,)
//                         //   ),
//                         // );
//                       },
//                       child: const Text("Wishlist"),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
