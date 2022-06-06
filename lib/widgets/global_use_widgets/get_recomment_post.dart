import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/api_client.dart';
import 'package:online_shop/models/data.dart';
import 'package:online_shop/models/post_data.dart';
import 'package:online_shop/screens/product_detail_screen.dart';
import 'package:online_shop/screens/sale_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class GetRecommentPost extends StatelessWidget {
  const GetRecommentPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String apiKey = Provider.of<Status>(context).getApiToken();
    var category = Provider.of<Status>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recomment',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => const SaleScreen(),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.pink,
                  size: 18,
                ),
              ),
            ],
          ),
      
        Container(
          height: 340,
          width: double.infinity,
           color: Colors.white.withOpacity(1),
          child: StreamBuilder(
              stream: ApiClient(Dio()).getRecommentPostByCategory(
                "Bearer $apiKey",
                Data.categories[category.getCategoryId()],
              ),
              builder: (contex, AsyncSnapshot<List<PostData>> snapshots) {
                //print( Data.categories[]);
                if (!snapshots.hasData ||
                    snapshots.data == null ||
                    snapshots.connectionState == ConnectionState.waiting) {
                  return singleShimmerBuild(context, 200);
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshots.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 3),
                          width: 200,
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                color: Colors.amber,
                                height: 200,
                                child: Image.asset(
                                  Data.images[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 2),
                                      width: double.infinity,
                                      height: 50,
                                      child: Text(
                                        '${snapshots.data![index].title}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 2),
                                          child: Text(
                                            '${snapshots.data![index].price} Ks',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          child: Text(
                                            'qty: ${snapshots.data![index].qty}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (contex) {
                                          return ProductDetail(
                                              id: snapshots.data![index].id);
                                        }));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'see more',
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.pink,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }
              }),
        ),
      ],
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
