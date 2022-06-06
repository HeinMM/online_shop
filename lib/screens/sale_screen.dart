import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/api_client.dart';
import 'package:online_shop/models/data.dart';
import 'package:online_shop/models/sale_data.dart';
import 'package:online_shop/screens/sale_product_detail_screen.dart';
import 'package:provider/provider.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String apiKey = Provider.of<Status>(context).getApiToken();
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
          title: const Text('Sales'),
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              // height: 400,
              child: StreamBuilder<List<SaleData>>(
                stream: ApiClient(Dio()).getAllSalePost("Bearer $apiKey"),
                builder: (context, AsyncSnapshot<List<SaleData>> snapshots) {
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                builder: (contex) => SaleProductDetailScreen(
                                  id: snapshots.data![index].id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 400,
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
                                Row(
                                  children: [
                                    Text(
                                      '${snapshots.data![index].sale_price} Ks',
                                      style: const TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      '${snapshots.data![index].normal_price} Ks',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                     
                                  ],
                                ),
                                Text(
                                      'WaitingTime: ${snapshots.data![index].waiting_time}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
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
        ));
  }
}
