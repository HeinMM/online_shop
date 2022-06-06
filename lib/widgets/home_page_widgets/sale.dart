import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/api_client.dart';
import 'package:online_shop/models/data.dart';
import 'package:online_shop/models/sale_data.dart';
import 'package:online_shop/screens/sale_product_detail_screen.dart';
import 'package:online_shop/screens/sale_screen.dart';
import 'package:provider/provider.dart';

class Sale extends StatefulWidget {
  const Sale({Key? key}) : super(key: key);

  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  @override
  Widget build(BuildContext context) {
    var apiKey = Provider.of<Status>(context).getApiToken();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sale',
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
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: StreamBuilder<List<SaleData>>(
            stream: ApiClient(Dio()).getLimitSalePost("Bearer $apiKey"),
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
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshots.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SaleProductDetailScreen(
                                id: snapshots.data![index].id),
                          ),
                        );
                      },
                      child: Container(
                        // height: 150,

                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              width: double.infinity,
                              child: Image.asset(
                                Data.images[index],
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              height: 20,
                              child: Text(
                                "${snapshots.data![index].title}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              '${snapshots.data![index].normal_price} Ks',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              '${snapshots.data![index].sale_price} Ks',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 18),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white38,
                            width: 1,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
