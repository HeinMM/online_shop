import 'package:flutter/cupertino.dart';

import 'package:online_shop/models/cart_for_post_data.dart';
import 'package:online_shop/models/cart_for_sale_data.dart';
import 'package:online_shop/models/post_data.dart';
import 'package:online_shop/models/sale_data.dart';

class Status extends ChangeNotifier {
  bool _isLogin = false;
  bool? _isFailLogin = false;
  String _apiToken = '';
  int? _categoryId = 0;
  int _itemCount = 0;
  List<CartForPostData> _postData = [];
  List<CartForSaleData> _saleData = [];

  // Map<PostData, int> _mapPostData = {};

//////////////////////////////////////////
  bool getIsLogin() {
    return _isLogin;
  }

  void setIsLogin(bool islogin) {
    _isLogin = islogin;
    notifyListeners();
  }

//////////////////////////////////////////
  bool getIsFailLogin() {
    return _isFailLogin!;
  }

  void setIsFailLogin(bool isFaillogin) {
    _isFailLogin = isFaillogin;
    notifyListeners();
  }

//////////////////////////////////////////
  String getApiToken() {
    return _apiToken;
  }

  void setApiToken(String apiToken) {
    _apiToken = apiToken;
    notifyListeners();
  }

  /////////////////////////////////////////
  int getCategoryId() {
    return _categoryId!;
  }

  void setCategoryId(int categoryId) {
    _categoryId = categoryId;
    // print(_categoryId);
    notifyListeners();
  }

  /////////////////////////////////////////
  void setItemCount(int itemCount) {
    _itemCount = itemCount;
    //print("ITEM COUNT IS${_itemCount}");
    notifyListeners();
  }

  ///////////////////////////////////////
  List<CartForPostData> gettPostData() {
    return _postData;
  }

  void setPostData(CartForPostData postData) {
    _postData.add(postData);
    notifyListeners();
  }

  /////////////////////////////////////////
  List<CartForSaleData> gettSaleData() {
    return _saleData;
  }

  void setSaleData(CartForSaleData saleData) {
    _saleData.add(saleData);
    print(_saleData.length);
    notifyListeners();
  }
  /////////////////////////////////////////

  //   Map<PostData,int> getMapPostData() {
  //   return _mapPostData;
  // }

  // void setMapPostData(int iteamCount,PostData postData) {
  //  _mapPostData[postData] = iteamCount;

  //   notifyListeners();
  // }
}
