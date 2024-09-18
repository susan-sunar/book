import 'package:book/data/delivery.dart';
import 'package:book/data/paymentdata.dart';
import 'package:book/google%20font.dart';
import 'package:book/model/payment%20model.dart';
import 'package:book/page/buypage.dart';
import 'package:book/page/management.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentModel _selectedMethod = allMethods[0];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _showCardDetails = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context,ms,_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff00b4d8),
            title: Text(
              "Payment Information",
              style: myStyle(29, Colors.black),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black, size: 27),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${customer[0].name}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Email: ${customer[0].email}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Contact: ${customer[0].phoneNo}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Address: ${customer[0].address}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Number of Books: ${ms.cardProducts[index].quantity}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Total Price:  \$ ${ms.calculate()}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(10),
                                Text(
                                  "Choose your payment method",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(10),
                                Card(
                                  elevation: 4,
                                  child: DropdownButton<PaymentModel>(
                                    value: _selectedMethod,
                                    onChanged: (PaymentModel? newValue) {
                                      setState(() {
                                        _selectedMethod = newValue!;
                                        _showCardDetails =
                                            _selectedMethod != allMethods[0];
                                      });
                                    },
                                    items: allMethods
                                        .map<DropdownMenuItem<PaymentModel>>(
                                          (PaymentModel method) {
                                        return DropdownMenuItem<PaymentModel>(
                                          value: method,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "${method.imgUrl}"),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Gap(10),
                                              Text("${method.paymentMethod}"),
                                            ],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _cardNumber,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Card number',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _amount,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _password,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(20),
                                MaterialButton(
                                  height: 45,
                                  color: Color(0xff90e0ef),
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (builder) => BuyPage()));
                                  },
                                  child:Text("Buy Now",style: myStyle(20,Colors.black),
                                ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
