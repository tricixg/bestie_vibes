import 'package:bestie_vibes/models/user_model.dart';
import 'package:bestie_vibes/models/userr_model.dart';
import 'package:bestie_vibes/utils/constants.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  final User friend;

  FriendCard(this.friend);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, right: 15, bottom: 10),
            child: ClipOval(
              child: Image.network(
                friend.imageUrl[0],
                width: 50,
                height: 50,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${friend.name}'),
                SizedBox(height: 2),
                Text('${friend.id}'),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: (() {
                  context.showSnackBar(message: 'Added to Group');
                }),
                icon: Icon(
                  Icons.add,
                  color: Colors.grey[600],
              ),
              label: Text('add'),)
              

            ],
          ),
        ],
      ),
    );
  }
}