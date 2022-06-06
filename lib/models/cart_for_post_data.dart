import 'package:online_shop/models/post_data.dart';
import 'package:online_shop/models/sale_data.dart';

class CartForPostData{
  PostData? postData;

  int itemCount;
  CartForPostData(this.postData,this.itemCount);
}