import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/data.dart';
import 'package:online_shop/widgets/bag_widgets/normal_item.dart';
import 'package:online_shop/widgets/bag_widgets/sale_iteam.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  _BagScreenState createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    var items = Provider.of<Status>(context);
    var check = true;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.pink,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        title: const Text('Your Bag'),
      ),
      body: ListView(
        shrinkWrap: true,
         physics: const AlwaysScrollableScrollPhysics(),
        children:const [
          Text("Sale"),
         SaleItems(),
          Text("Normal"),
         NormalItems(),
          SizedBox(height: 85,)
        ],
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.07,
        color: Colors.pink,
        child: const Text('CheckOut',style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
    );
  }
}
