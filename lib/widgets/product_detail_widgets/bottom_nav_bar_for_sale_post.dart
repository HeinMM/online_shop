import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/cart_for_sale_data.dart';
import 'package:online_shop/models/sale_data.dart';
import 'package:provider/provider.dart';

class ButtomNavBarForSalePost extends StatefulWidget {
  SaleData? saleData;
  ButtomNavBarForSalePost({Key? key, this.saleData}) : super(key: key);

  @override
  State<ButtomNavBarForSalePost> createState() =>
      _ButtomNavBarForSalePostState();
}

class _ButtomNavBarForSalePostState extends State<ButtomNavBarForSalePost> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Icon(
              Icons.favorite_outline,
              size: 28,
              color: Colors.grey.shade900,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.only(
              left: 5,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.pink.shade400),
              onPressed: () {
                _startShowBottomSheet(context);
              },
              child: const Text(
                'CHECKOUT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 0.5, color: Colors.grey.shade300),
        bottom: BorderSide(width: 0.5, color: Colors.grey.shade300),
      )),
    );
  }

  void _startShowBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
                bottom: 5,
              ),
              height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.4,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Text('1Set'),
                  Text(
                    '${widget.saleData!.normal_price} Ks',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    '${widget.saleData!.sale_price} Ks',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const Text(
                    'delivery fees : 2000 Ks',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      'our item quantity : ${widget.saleData!.qty}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Waiting Time is ${widget.saleData!.waiting_time}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        ////////////////////////////////////////count
                        width: 80,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                if (itemCount > 1) {
                                  Provider.of<Status>(context, listen: false)
                                      .setItemCount(itemCount--);
                                }
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              alignment: Alignment.center,
                              // color: Colors.black,
                              child: Text(
                                '$itemCount',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                               
                                if (itemCount <  int.parse('${widget.saleData!.qty}')) {
                                  Provider.of<Status>(context, listen: false)
                                      .setItemCount(itemCount++);
                                }
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.black87, width: 0.5)),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: OutlinedButton(
                          onPressed: () {
                             CartForSaleData cart = CartForSaleData(widget.saleData!, itemCount);
                            Provider.of<Status>(context,listen: false).setSaleData(cart);
                            Navigator.pop(context);
                          },
                          child: const Text('Add to Bag'),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.pink,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ElevatedButton(
                          onPressed: () {
                            
                          },
                          child: const Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }).whenComplete(() => itemCount = 1);
  }
}
