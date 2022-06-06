import 'package:flutter/material.dart';
import 'package:online_shop/Auth/status.dart';
import 'package:online_shop/screens/sale_screen.dart';
import 'package:online_shop/widgets/global_use_widgets/get_recomment_post.dart';
import 'package:online_shop/widgets/home_page_widgets/all_post.dart';
import 'package:online_shop/widgets/home_page_widgets/app_bar.dart';
import 'package:online_shop/widgets/home_page_widgets/banner.dart';
import 'package:online_shop/widgets/home_page_widgets/category.dart';
import 'package:online_shop/widgets/home_page_widgets/sale.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _startShowBottomSheet(context));
  }

  @override
  Widget build(BuildContext context) {
    var getRecommentId = Provider.of<Status>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: ListView(
            children: [
              const CustomAppBar(),
              const MyBanner(),
              const Category(),
              const Sale(),
              getRecommentId.getCategoryId() == 0
                  ? const SizedBox(height: 0,)
                  : const GetRecommentPost(),
              GetAllPost(
                context: context,
              ),
            ],
          ),
        ));
  }

  void _startShowBottomSheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (_) {
          return GestureDetector(
            //onTap: () {},
            child: Container(
              height: 500,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.cancel_sharp,
                      color: Colors.red,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => SaleScreen(),
                      ),
                    ),
                    child: Container(
                      height: 310,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/images/sale.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => SaleScreen(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'SEE MORE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.pink,
                          size: 28,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }
}
