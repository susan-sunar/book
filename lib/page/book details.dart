import 'package:book/model/booklist.dart';
import 'package:book/page/management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../google font.dart';

class BookDetails extends StatefulWidget {
  BookList bookList;
  BookDetails({super.key, required this.bookList});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "About Books",
          style: myStyle(25, Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 25,
        ),
      ),
      body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage("${widget.bookList.image}"),
                      ),
                    ),
                  ),
               Text("Name:${widget.bookList.bookName}",style: myStyle(25),),
               Text("Auther:${widget.bookList.authore}",style: myStyle(21),),
               Text("Describtion:${widget.bookList.describtion}",style: myStyle(20),),
                Gap(20),
            Row(
            children: [
              Text("\$${widget.bookList.price}",style: myStyle(23),
            ),
            Padding(padding: EdgeInsets.all(8),
            ),
            Column(
            children: [
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                itemCount: 4,
              initialRating: widget.bookList.rating,
              maxRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context,_)=>Icon(Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating){
                  setState(() {
                    widget.bookList.rating = rating;
                  });
              },
            ),
                Text(widget.bookList.rating.toStringAsFixed(1),
            style: myStyle(23),
            )
            ],
            ),

            ],
            ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      bool added = ms.addToBookmark(widget.bookList);
                      String message = added?
                      "Book has been added":"Book is already added";
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(message),
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite_outline_outlined,size: 25,color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      bool added = ms.addToCard(widget.bookList);
                      String message = added?
                      "Book has been added":"Book is already added";
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(message),
                          )
                      );
                    },
                    icon: Icon(Icons.book_outlined,size: 25,color: Colors.black,),
                  ),
                ],
              )
            ],
            )
                ],
              ),
            );

    }
      ),
    );
  }

}