import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:palembang_mobile/Wisata_data.dart';


class DetailScreen extends StatelessWidget {
  final WisataData place;
 
 
  const DetailScreen({Key? key, required this.place}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
             CarouselSlider(
                options: CarouselOptions(height: 300.0),
                  items: place.imgSlide.map((imgPath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                             decoration: BoxDecoration(
                               color: Colors.transparent
                                ),
                                 child: Image.asset('images/$imgPath')
                                 );
                                },
                              );
                            }).toList(),
                          ),
              SafeArea(
                child: Padding(padding: 
                const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      ),
                    ),

                    const FavoriteBtn(),
                  ],
                ),
                )

              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: 
                      Text(place.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                   fontFamily: 'Montserrat',
                   fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                 ),    
              SizedBox(width: 16.0),
                const FavoriteBtn()    
                ],
                ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child:Text(place.category,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w200
            ),
            ) ,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(place.description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 10,
            fontFamily: 'Montserrat'
            ),
            ),
          ),
          
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Icon(Icons.calendar_today,
                    color: Colors.blue),
                    const SizedBox(height: 8.0),
                    Text(place.openDays,
                    style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.access_time,
                    color: Colors.blue),
                    const SizedBox(height: 8.0),
                    Text(place.openTimes,
                    style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.monetization_on,
                    color: Colors.blue),
                    const SizedBox(height: 8.0),
                    Text(place.price,
                    style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class FavoriteBtn extends StatefulWidget {
  const FavoriteBtn({Key? key}) : super(key: key);

  @override
  _FavouriteBtnState createState() => _FavouriteBtnState();
  }

  class _FavouriteBtnState extends State<FavoriteBtn>{
    bool isFavorite = false;

    @override
    Widget build(BuildContext context) {
      return IconButton(icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState((){
          isFavorite = !isFavorite;
        });
      },
      );
    }
  }
