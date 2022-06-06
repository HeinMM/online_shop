import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){},//////////////////////////////////////////Innisfree
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/icons/concealer.png',
                        ),
                      ),
                      const Text(
                        'Innisfree',
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
               InkWell(
                 onTap: (){},/////////////////////////////////////////////////NatureRepublic
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/icons/cosmetics.png',
                        ),
                      ),
                      const Text(
                        'NatureRepublic',
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
               InkWell(
                 onTap: (){},/////////////////////////////////////////////////Laneige
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/icons/cosmetics2.png',
                        ),
                      ),
                      const Text(
                        'Laneige',
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
               InkWell(
                 onTap: (){},//////////////////////////////////////////im foem
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/icons/lotion.png',
                        ),
                      ),
                      const Text(
                        'I\'m Form',
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              )
            ],
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){},///////////////////////////////////////////////3ce
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/icons/makeup.png',
                        ),
                      ),
                      const Text(
                        '3CE',
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
               InkWell(
                 onTap: (){},//////////////////////////////////////////////////////manyo
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/icons/moisturizer.png',
                        ),
                      ),
                      const Text(
                        'Manyo',
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
               InkWell(
                 onTap: (){},///////////////////////////////////////////////////mamonde
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/icons/organic.png',
                        ),
                      ),
                      const Text(
                        'Mamonde',
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
               InkWell(
                 onTap: (){},///////////////////////////////////////////////////////////////other
                child: Container(
                  width: 80,
                  height: 70,
                  child: Column(
                    
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.more_horiz,size: 40,color: Colors.deepOrangeAccent,)
                      ),
                      const Text(
                        'Other',
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              )
            ]
          )
            
        ],
      ),
    );
  }
}
