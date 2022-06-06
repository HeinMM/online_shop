// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/api_client.dart';
import 'package:online_shop/models/data.dart';
import 'package:online_shop/models/post_data.dart';
import 'package:online_shop/screens/product_detail_screen.dart';
import 'package:online_shop/screens/sale_screen.dart';
import 'package:provider/provider.dart';

class GetAllPost extends StatefulWidget {
  BuildContext? context;
  GetAllPost({Key? key, this.context}) : super(key: key);

  @override
  _GetAllPostState createState() => _GetAllPostState();
}

class _GetAllPostState extends State<GetAllPost> {
  @override
  Widget build(BuildContext context) {
    var apiKey = Provider.of<Status>(context).getApiToken();
    var category = Provider.of<Status>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Items',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          // height: 400,
          child: StreamBuilder<List<PostData>>(
            stream: ApiClient(Dio()).getAllPost("Bearer $apiKey"),
            builder: (context, AsyncSnapshot<List<PostData>> snapshots) {
              if (!snapshots.hasData) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
                    ),
                  ),
                );
              } else {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshots.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => ProductDetail(
                              id: snapshots.data![index].id,
                            ),
                          ),
                        );
                        category.setCategoryId(
                            int.parse("${snapshots.data![index].category_id}"));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              child: Image.asset(
                                Data.images[index],
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              '${snapshots.data![index].title}',
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${snapshots.data![index].price} Ks',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              '⭐⭐⭐⭐⭐ (20)',
                              style: TextStyle(
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
          decoration: BoxDecoration(color: Colors.grey.shade50),
        ),
      ],
    );
  }
}
