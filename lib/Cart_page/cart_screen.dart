import 'package:exam_e_commerce/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    for(int i=0; i<cartlist.length; i++)
      {
        total = (total + cartlist[i]['price']).toInt();
      }
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(onTap: () {
            Navigator.of(context).pushNamed('/');
          },
            child: Icon(
              CupertinoIcons.arrow_left,
              size: 30,
            ),
          ),
          title: Text(
            'Cart Page',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              ...List.generate(
                cartlist.length,
                    (index) =>
                    cart(image: cartlist[index]['img'],
                        name: cartlist[index]['name'],
                        price: cartlist[index]['price'],
                    qty: cartlist[index]['qty']),
              ),
              Spacer(
                flex: 5,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('$total', style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        alignment: Alignment.center,
                        child: Text('Check Out', style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container cart(
      {required String image, required String name, required int price,required int qty}) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(image,fit: BoxFit.cover,),
            ),
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Price : $price',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(onTap: () {
                      setState(() {
                        '${qty++}';
                      });
                    },
                      child: Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$qty',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(onTap: () {
                      '${qty++}';
                    },
                      child: Icon(
                        Icons.remove,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 60,
            ),
            Column(
              children: [
                InkWell(
                    child: Icon(CupertinoIcons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
int total = 0;
