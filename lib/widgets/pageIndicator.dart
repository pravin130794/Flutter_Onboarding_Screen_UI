import 'package:Flutter_Onboarding_Screen_UI/provider/indexNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key key}) : super(key: key);

  _indicator(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.black : Colors.transparent,
          border: Border.all(color: Colors.black, width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<IndexNotifier>(context).index;
    print(currentIndex);
    List<Widget> _buildIndicator() {
      List<Widget> indicator = new List();

      for (var i = 0; i < 3; i++) {
        indicator.add(i == currentIndex ? _indicator(true) : _indicator(false));
      }
      return indicator;
    }

    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Row(
        children: _buildIndicator(),
      ),
    );
  }
}
