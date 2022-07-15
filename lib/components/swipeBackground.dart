import 'package:bestie_vibes/models/activity_model.dart';
import 'package:bestie_vibes/widgets/widgets.dart';
import 'package:flutter/material.dart';

class swipeBackground extends StatelessWidget {

  const swipeBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.pink[50],
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
        Column(
          children: [
            ActivityCard(activity: 
              Activity(address: '', id: 999, name: '',website: '', description: '', imageUrls: '', opening: '', phone: '', postal: '', tag: '', price: 2, type: '')
            ),
          ],
        ),
        ],
      ),
    );
  }
}