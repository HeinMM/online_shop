import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/api_client.dart';
import 'package:online_shop/models/post_data.dart';
import 'package:online_shop/widgets/global_use_widgets/get_recomment_post.dart';
import 'package:online_shop/widgets/product_detail_widgets/bottom_nav_bar_for_normal_post.dart';
import 'package:online_shop/widgets/product_detail_widgets/carousel_slider.dart';
import 'package:online_shop/widgets/product_detail_widgets/description_text.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetail extends StatefulWidget {
  final int? id;
  const ProductDetail({
    Key? key,
    @required this.id,
  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isLoading = true;
  PostData? post;

  @override
  void initState() {
    super.initState();
    _getProductDetail();
  }

  _getProductDetail() async {
    String api = Provider.of<Status>(context, listen: false).getApiToken();
    post = await ApiClient(Dio()).getPost("Bearer $api", widget.id!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String apiKey = Provider.of<Status>(context).getApiToken();
    var category = Provider.of<Status>(context);
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
                Positioned(
                  top: 17,
                  left: 20,
                  child:cartCount==0?Text(''): Text(
                    "$cartCount",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
          backgroundColor: Colors.white.withOpacity(0.9),
          title: const Text(''),
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
                                'Category',
                                style: TextStyle(color: Colors.pink),
                              ),
                            ),
                            const Text(
                              '⭐⭐⭐⭐⭐ (20)',
                              style: TextStyle(
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.pink),
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
                            "${post!.title}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            "item number:${post!.item_number}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            "${post!.price}Ks",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DescriptionText(dec: "${post!.dec}"),
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
                          height: 10,
                        ),
                        GetRecommentPost(),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
            ],
          ),
        ),
        bottomSheet: ButtomNavBarForNormalPost(
          postData: post,
        ));
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
