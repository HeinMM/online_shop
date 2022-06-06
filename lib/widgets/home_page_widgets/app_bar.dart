import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/screens/bag_screen.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Status>(context);
    var cartCount = (cart.gettPostData().length)+(cart.gettSaleData().length);
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const FlutterLogo(
            size: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                //margin: EdgeInsets.only(left: 30,),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BagScreen()));
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
              ),
               Positioned(
                  top: 18,
                  left: 20,
                  child:cartCount==0?const Text("") :Text(
                    "$cartCount",
                    style:const TextStyle(
                      color: Colors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
