
import 'package:book/google%20font.dart';
import 'package:book/page/management.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Purchase",
          style: myStyle(29, Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 27),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          if (ms.cardProducts.isEmpty) {
            return Center(
              child: Text(
                "No products in cart",
                style: myStyle(25),
              ),
            );
          }

          return ms.cardProducts.length == 1
              ? ListView.builder(
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                            "${ms.cardProducts[index].image}")),
                    Icon(Icons.check_circle_outline,color: Colors.grey,size: 100,),
                    Text("Your operation was complete successful.",
              style: myStyle(20,),),
                  ],
                ),
              );
            },
          )
              : GridView.builder(
            padding: const EdgeInsets.all(30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.12,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 1500,
                    height: 200,
                    child: Image.asset("${ms.cardProducts[index].image}",fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Text(
                      "Your operation was complete successful.",
                      style: myStyle(20,),
                    ),
                  ),
              Icon(Icons.check_circle_outline,color: Colors.grey,size: 100,),
                ],
              );
            },
          );
        },
      ),
    );
  }
}