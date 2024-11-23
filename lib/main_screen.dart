import 'package:flutter/material.dart';
import 'package:palembang_mobile/Wisata_data.dart';
import 'package:palembang_mobile/detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Row(
                 children: [
              Text(
                'Halo Warga Palembang',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),  
              const SizedBox(height: 8),       
               Spacer(),         
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return personUser();
                        }));
                      }, 
                      icon: const Icon(
                        Icons.person, 
                      size: 24,
                      ),
                    ),
                    ),
                 ],
                ),
              const SizedBox(height: 4),
              Text(
                'Nak Kemano Hari ini?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                  ),
                  itemCount: WisataDataList.length,
                  itemBuilder: (context, index) {
                    final place = WisataDataList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                            return  DetailScreen(place: place);
                      }),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                               color: Colors.grey[300],
                              child: Image.asset(
                                 place.imageAsset,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              place.name,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(padding: 
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            place.category,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.w100),
                            ),
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
      ),
    );
  }
}

class personUser extends StatelessWidget {
  const personUser ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundColor: Colors.grey,
                  child: IconButton( icon: const Icon(
                    Icons.arrow_back, color: Colors.black,
                  ),onPressed: (){
                    Navigator.pop(context);
                  },
                  ),),
                ],
              ),
              Image.asset('images/POTPROF.jpg',
              width: 300, height: 300,
              ),
              const SizedBox(height: 16.0),

              SizedBox(
                child: Text('Muhammad Adithya Warman',
                style: TextStyle(fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.center ,
                ),
              ),
              
            ],
        ),

        ),
      );
  }
}
