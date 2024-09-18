import 'package:book/page/delivery.dart';
import 'package:book/page/management.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.cardProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${ms.cardProducts[index].bookName}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "\$${ms.cardProducts[index].price}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Gap(30),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              ms.decreaseQuantity(
                                                  ms.cardProducts[index]);
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Gap(5),
                                          Text(
                                            '${ms.cardProducts[index].quantity}',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          Gap(5),
                                          IconButton(
                                            onPressed: () {
                                              ms.increaseQuantity(
                                                  ms.cardProducts[index]);
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Gap(10),
                                          IconButton(
                                              onPressed: () {
                                                ms.deleteProducts(
                                                    ms.cardProducts[index]);
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                size: 30,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 23),
                            ),
                            Text(
                              "\$${ms.calculate()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => AddressPage()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(19),
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Check out",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
