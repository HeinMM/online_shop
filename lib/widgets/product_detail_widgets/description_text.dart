import 'package:flutter/material.dart';
import 'package:flutter_expandable/expandable.dart';
import 'package:flutter_expandable/expander.dart';
import 'package:online_shop/widgets/product_detail_widgets/tests.dart';

class DescriptionText extends StatefulWidget {
  final String? dec;
  const DescriptionText({Key? key, @required this.dec}) : super(key: key);

  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expander(
          rotatingArrowColor: Colors.pink,
          rotateArrow: true,
          rotatingArrowSize: 40,
          arrowRotationDuration: const Duration(milliseconds: 5),
          triggerWidgets: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'Product Description : ',
                maxLines: 2,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
          controller: controller,
        ),
        const SizedBox(
          height: 10,
        ),
        Expandable(
          height: 1000,
          controller: controller,
          duration: const Duration(seconds: 1),
          child: LimitedBox(
            maxHeight: 900,
            child: Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: Text(
                // '${widget.dec}',
                '${Tests.dec}',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
