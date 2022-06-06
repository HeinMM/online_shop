import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/data.dart';
import 'package:provider/provider.dart';

class SaleItems extends StatefulWidget {
  const SaleItems({Key? key}) : super(key: key);

  @override
  _SaleItemsState createState() => _SaleItemsState();
}

class _SaleItemsState extends State<SaleItems> {
  @override
  Widget build(BuildContext context) {
    var items = Provider.of<Status>(context);
    var check = true;
    return ListView.builder(
         shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
        itemCount: items.gettSaleData().length,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
            padding:
                const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 0),
            width: MediaQuery.of(context).size.width * 1,
            // height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: check,
                      onChanged: (value) {},
                      activeColor: Colors.pink.shade400,
                    ),
                    Flexible(
                      child: Text(
                        'adfdafdfadfaf${items.gettSaleData()[index].saleData!.title}+fsddfasdfadfafdaf',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Data.images[index],
                      height: 80,
                      width: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Waiting Time : ${items.gettSaleData()[index].saleData!.waiting_time}',
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          ' ${items.gettSaleData()[index].saleData!.normal_price}Ks',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Text(
                          ' ${items.gettSaleData()[index].saleData!.sale_price}Ks',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink,
                                  minimumSize: Size(7, 5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 15),
                          width: 80,
                          height: 25,
                          color: Colors.white.withOpacity(1),
                          child:
                              Text(' ${items.gettSaleData()[index].itemCount}'),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 15),
                          width: 80,
                          height: 20,
                          color: Colors.pink,
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
          );
        });
  }
}
