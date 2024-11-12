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
              Image.asset(place.imageAsset),
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
            child: Text(place.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Monserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold
              ),
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
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Icon(Icons.calendar_today),
                    const SizedBox(height: 8.0),
                    Text(place.openDays,
                    style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.access_time),
                    const SizedBox(height: 8.0),
                    Text(place.openTimes,
                    style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.monetization_on),
                    const SizedBox(height: 8.0),
                    Text(place.price,
                    style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
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
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: place.imgSlide.map((FileImage){
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/${FileImage}'),
                  ),
                  );
              }).toList()
            )
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
