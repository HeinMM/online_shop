import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/models/data.dart';
import 'package:provider/provider.dart';

class NormalItems extends StatefulWidget {
  const NormalItems({Key? key}) : super(key: key);

  @override
  _NormalItemsState createState() => _NormalItemsState();
}

class _NormalItemsState extends State<NormalItems> {
  TextEditingController _itemCountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var items = Provider.of<Status>(context);
    var check = true;
    return ListView.builder(
         shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
        itemCount: items.gettPostData().length,
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
                    Text(
                      '${items.gettPostData()[index].postData!.title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
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
                        const Text(
                          'Waiting Time : 2day',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          ' ${items.gettPostData()[index].postData!.price}Ks',
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
                                  minimumSize: const Size(7, 5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        itemCountEdit(context, index);
                      },
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 15),
                            width: 80,
                            height: 25,
                            color: Colors.white.withOpacity(1),
                            child: Text(
                                ' ${items.gettPostData()[index].itemCount}'),
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
                    ),
                  ],
                ),
              ],
            ),
            decoration: const BoxDecoration(
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

  itemCountEdit(BuildContext context, int index) async {
    var getCount = Provider.of<Status>(context, listen: false);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            
            title:  Text("Our Items qty : ${getCount.gettPostData()[index].postData!.qty}"),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: _itemCountController,
              decoration: InputDecoration(
                  hintText: '${getCount.gettPostData()[index].itemCount}'),
            ),
            actions: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () {
                  if (int.parse(_itemCountController.text) > 0 &&
                      int.parse(_itemCountController.text) <=
                          int.parse(
                              "${getCount.gettPostData()[index].postData!.qty}")) {
                    setState(
                      () {
                        getCount.gettPostData()[index].itemCount =
                            int.parse(_itemCountController.text);
                        Navigator.pop(context);
                      },
                    );
                  }else{
                    if ( int.parse(_itemCountController.text) >
                          int.parse(
                              "${getCount.gettPostData()[index].postData!.qty}")) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('You must buy under item qty'),),);
                    }
                    
                  }
                },
                child: const Text('Update'),
              ),
            ],
          );
        });
  }
}
