import 'package:flutter/material.dart';
import 'list_belanjaan.dart';
import 'daftar _belanjaan.dart';

class HalamanDetail extends StatefulWidget {
  final Groceries place;

  const HalamanDetail({Key? key, required this.place}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return HalamanUtama();
              }));
            });
          }, icon: Icon(Icons.arrow_back)),
          title: Text('${widget.place.name}'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  widget.place.belanja = !widget.place.belanja;
                });
              },
              icon: (widget.place.belanja)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: (widget.place.belanja) ? Colors.pink : Colors.white,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView.builder(
                      itemCount: widget.place.productImageUrls.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.network(widget.place.productImageUrls[index]),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textBesarBold(" > " + widget.place.name + " < "),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                          ),
                          textBiasa(widget.place.price),
                        ],
                      ),
                      // SizedBox(height: 15,),
                      // Text('Deskripsi lokasi :'),
                      // Text(widget.place.description),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textBiasa(widget.place.stock),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textBiasa(widget.place.discount),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          textBiasa(widget.place.storeName),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text('Deskripsi Product :'),
                      Text(widget.place.description),
                    ],
                  ),
                )
              ],
            ),
          ),
        )

    );
  }

  Widget textBesarBold(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }

  Widget textBiasa(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
