import 'package:book/data/book%20list.dart';
import 'package:book/data/topratedbook.dart';
import 'package:book/google%20font.dart';
import 'package:book/page/book%20details.dart';
import 'package:book/page/cart.dart';
import 'package:book/page/favorite.dart';
import 'package:book/page/management.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context,ms,_) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/image/photosu.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsPage()));
                          },
                          leading: Icon(
                            Icons.person_pin,
                            size: 35,
                          ),
                          title: Text(
                            "My Profile",
                            style: myStyle(20),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            size: 35,
                          ),
                          title: Text(
                            "Privacy and Security",
                            style: myStyle(20),
                          ),
                        ),ListTile(
                          leading: Icon(
                            Icons.home_filled,
                            size: 35,
                          ),
                          title: Text(
                            "Marketplace",
                            style: myStyle(20),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.question_answer_outlined,
                            size: 35,
                          ),
                          title: Text(
                            "Help and Feedback",
                            style: myStyle(20),
                          ),
                        ),ListTile(
                          leading: Icon(
                            Icons.messenger,
                            size: 35,
                          ),
                          title: Text(
                            "Message request",
                            style: myStyle(20),
                          ),
                        ),ListTile(
                          leading: Icon(
                            Icons.account_box_rounded,
                            size: 35,
                          ),
                          title: Text(
                            "New Group",
                            style: myStyle(20),
                          ),
                        ),ListTile(
                          leading: Icon(
                            Icons.settings,
                            size: 35,
                          ),
                          title: Text(
                            "Setting",
                            style: myStyle(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                                title: Text("Do you want to Log Out?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Yes",
                                        style: style(19),
                                      )),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: style(19),
                                      ))
                                ],
                              );
                        },
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 35,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Log Out",
                      style: myStyle(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white, size: 30,
            ),
            actions: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(icon: Icon(Icons.favorite_outline_outlined),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => Favorite()),
                      );
                    },
                  ),
                  Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text("${ms.bookmarkCounter}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => CartPage()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.book_outlined, size: 30, color: Colors.white,
                    ),
                    Positioned(
                        right: -10,
                        top: -10,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text("${ms.counter}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
              Gap(10),
            ],
          ),
          body: Padding(padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("What are you",
                  style: myStyle(25, Colors.black, FontWeight.bold),
                ),
                Text("reading today",
                  style: myStyle(25, Colors.black, FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search book",
                            hintStyle: TextStyle(
                                color: Colors.white, fontSize: 20),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ratedbook.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "${ratedbook[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("${ratedbook[index].name}",
                                  style: myStyle(15),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }
                    )
                ),
                SizedBox(height: 2),
                Text(
                  "Popular",
                  style: myStyle(20, Colors.black, FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.60,
                    ),
                    itemCount: store.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (builder) =>
                                  BookDetails(bookList: store[index]),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 230,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("${store[index].image}"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${store[index].bookName}",
                              style: myStyle(15),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${store[index].price}", style: myStyle(25),
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: () {
                                      bool added = ms.addToBookmark(store[index]);
                                      
                                      String message = added?
                                          "Book has been added":"Book has been remove";
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 2),
                                              content: Text(message)
                                          )
                                      );
                                    }, icon:store[index].isBookmarked? Icon(Icons.favorite_outline_outlined,size: 30,color: Colors.redAccent,
                                    ):Icon(Icons.favorite_outline_outlined,size: 30,color: Colors.grey),
                                    ),
                                    IconButton(
                                        onPressed:(){
                                          bool added = ms.addToCard(store[index]);
                                          String message = added?
                                              "Book has been added": "Book is already added";
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: Duration(seconds: 2),
                                                  content: Text(message),
                                              ),
                                          );
                                        },
                                        icon: Icon(Icons.book_outlined,size: 30,color: Colors.black,)
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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
