import 'package:exam_e_commerce/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          leading: Icon(Icons.menu),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(CupertinoIcons.search),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    ...List.generate(
                      produlist.length,
                      (index) => InkWell(onTap: () {
                        setState(() {
                          selectionindex = index;
                        });
                        Navigator.of(context).pushNamed('/detail');
                      },
                        child: product(image: produlist[index]['img'],
                          name: produlist[index]['name'],
                          price: produlist[index]['price'],),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container product({required String image,required String name, required int price}) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      height: 210,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.black38,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset(image,fit: BoxFit.cover,),
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            'price : $price',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
