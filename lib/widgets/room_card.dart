import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';
import '../pages/pages.dart';

class roomCard extends StatelessWidget {
  const roomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return ChatRoomPage(room: room);
          }),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                // CircleAvatar(
                //   radius: 35.0,
                //   backgroundImage: NetworkImage(room.imageUrl[0]),
                // ),
                // SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      room.name.length > 19
                          ? room.name.substring(0, 17) + "..."
                          : room.name,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.45,
                    //   child: Text(
                    //     room.text,
                    //     style: TextStyle(
                    //       color: Colors.blueGrey,
                    //       fontSize: 14.0,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  DateFormat("dd-MM-yyyy").format(room.createdAt),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                // chat.unread
                //     ? Container(
                //         width: 40.0,
                //         height: 20.0,
                //         decoration: BoxDecoration(
                //           color: Theme.of(context).primaryColor,
                //           borderRadius: BorderRadius.circular(30.0),
                //         ),
                //         alignment: Alignment.center,
                //         child: Text(
                //           'NEW',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 12.0,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       )
                //     : Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
