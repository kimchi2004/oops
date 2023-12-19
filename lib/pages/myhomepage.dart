import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_prj/consts.dart';
import 'package:ecommerce_prj/models/cart_model.dart';
import 'package:ecommerce_prj/pages/details_page.dart';
import 'package:ecommerce_prj/models/mobi_model.dart';
import 'package:ecommerce_prj/pages/my_favorite.dart';
import 'package:ecommerce_prj/pages/mycart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'TAP Mobile',
              style: style.copyWith(color: Colors.black, fontSize: 16),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCart()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: blue,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Cart',
                      style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: blue),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavorite()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 226, 59, 59),
                  size: 28,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              TabBar(
                  controller: _controller,
                  unselectedLabelStyle: style.copyWith(fontSize: 14),
                  labelStyle: style.copyWith(fontSize: 14),
                  indicator: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Mobile',
                    ),
                    Tab(
                      text: 'Laptop',
                    ),
                    Tab(
                      text: 'Phụ Kiện',
                    ),
                  ]),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(controller: _controller, children: [
                  _buildlistitem(items: all),
                  _buildlistitem(items: mobilist),
                  _buildlistitem(items: laptoplist),
                  _buildlistitem(items: phukienlist),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildlistitem({required List<MobileModel> items}) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? BounceInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index))
              : BounceInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index));
        });
  }

  Widget _builditem({required List<MobileModel> myitems, required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(
                      item: myitems[index],
                    )));
      },
      child: AspectRatio(
        aspectRatio: 3 / 2.3,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: myitems[index].color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10, color: Colors.grey, offset: Offset(0, 10))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 160,
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(myitems[index].img),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          myitems[index].name,
                          style: style.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              myitems[index].isselected =
                                  !myitems[index].isselected;
                            });
                            myitems[index].isselected
                                ? favouriteitems.add(myitems[index])
                                : favouriteitems.remove(myitems[index]);
                          },
                          child: Icon(
                            Icons.favorite_sharp,
                            color:
                                myitems[index].isselected ? Colors.red : white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      myitems[index].company,
                      style: style.copyWith(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '${myitems[index].price} \$',
                          style: style.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            boughtitems.add(
                              CartModel(
                                name: myitems[index].name,
                                price: myitems[index].price,
                                img: myitems[index].img,
                                color: myitems[index].color,
                                items: 1,
                              ),
                            );
                            total = total + myitems[index].price;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyCart()));
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
