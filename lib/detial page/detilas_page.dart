import 'package:exam_e_commerce/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(
              CupertinoIcons.arrow_left,
              size: 30,
            ),
          ),
          title: Text(
            'Detail Page',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.asset(produlist[selectionindex]['img'],fit: BoxFit.cover,),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                produlist[selectionindex]['name'],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Price : ${produlist[selectionindex]['price']}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                'Category : ${produlist[selectionindex]['category']} ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Desecrption : ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
              Text(
               produlist[selectionindex]['dec'],
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 35,),
              InkWell(onTap: () {
                cartlist.add(produlist[selectionindex]);
                Navigator.of(context).pushNamed('/cart');
              },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.cart,size: 30,),
                      SizedBox(width: 30,),
                      Text('Add to Cart',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
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
}
