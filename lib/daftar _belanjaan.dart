import 'package:flutter/material.dart';
import 'list_belanjaan.dart';
import 'package:flutter/painting.dart';
import 'detail_belanjaan.dart';


class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Daftar Belanja'),
      ),
      body: ListView.builder(
        itemCount: groceryList.length,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          final Groceries place = groceryList[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HalamanDetail(place: place);
                }));
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                child: Stack(
                  children: [
                    Image.network(
                      place.productImageUrls[0],
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.bottomLeft,
                      child: textAlignLeftWhite(place.name),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.black,
                              ),
                              textHalamanUtama(place.price),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                              ),
                              textHalamanUtama(place.storeName),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          textHalamanUtama(place.stock),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              place.belanja = !place.belanja;
                            });
                          },
                          icon: (place.belanja)
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                          color:
                          (place.belanja) ? Colors.pink : Colors.black,
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget textAlignLeftWhite(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget textHalamanUtama(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
