import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/api_client.dart';
import 'package:online_shop/models/sale_data.dart';
import 'package:online_shop/screens/bag_screen.dart';
import 'package:online_shop/widgets/product_detail_widgets/bottom_nav_bar_for_sale_post.dart';
import 'package:online_shop/widgets/product_detail_widgets/carousel_slider.dart';
import 'package:online_shop/widgets/product_detail_widgets/description_text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class SaleProductDetailScreen extends StatefulWidget {
  int? id;
   SaleProductDetailScreen({ Key? key,@required this.id }) : super(key: key);

  @override
  State<SaleProductDetailScreen> createState() => _SaleProductDetailScreenState();
}

class _SaleProductDetailScreenState extends State<SaleProductDetailScreen> {
   bool isLoading = true;
  SaleData? getSaleData;
  @override
  void initState() {
    super.initState();
    _getProductDetail();
  }

  _getProductDetail() async {
    String api = Provider.of<Status>(context, listen: false).getApiToken();
    getSaleData = await ApiClient(Dio()).getSalePost("Bearer $api", widget.id!);
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Status>(context);
    var cartCount = (cart.gettPostData().length)+(cart.gettSaleData().length);
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
          actions: [
             Stack(
            children: [
              Container(
                //margin: EdgeInsets.only(left: 30,),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const BagScreen()));
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
                  child:cartCount==0?const Text('') :Text(
                    "$cartCount",
                    style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ],
          ),
          ],
          backgroundColor: Colors.white.withOpacity(0.9),
          title: const Text('Sales'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CarousalSlider(),
              isLoading
                  ? shimmerBuild(context, 140.0)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15, top: 10),
                              child: const Text(
                                'Sale',
                                style: TextStyle(color: Colors.pink),
                              ),
                            ),
                            
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 5,
                            right: 15,
                            bottom: 5,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${getSaleData!.title}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${getSaleData!.normal_price} Ks",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                       
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 0),
                          child: Text(
                            "${getSaleData!.sale_price} Ks",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                         Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Waiting Time : ${getSaleData!.waiting_time}",
                            style: const TextStyle(
                            
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DescriptionText(dec: "${getSaleData!.dec}"),
                        Image.asset(
                          "assets/images/banner1.jpg",
                          width: double.infinity,
                          height: 200,
                        ),
                        Image.asset(
                          "assets/images/banner2.jpg",
                          width: double.infinity,
                          height: 200,
                        ),
                        
                  
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
            ],
          ),
        ),
        bottomSheet:  ButtomNavBarForSalePost(saleData: getSaleData,));
  }
   Widget shimmerBuild(BuildContext context, double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: height,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 350,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  Widget singleShimmerBuild(BuildContext context, double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      child: Container(
        width: double.infinity,
        height: height,
        color: Colors.grey.shade600,
      ),
    );
  }
}