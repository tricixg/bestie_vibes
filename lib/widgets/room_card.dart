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
 
              ],
            ),
          ],
        ),
      ),
    );
  }
}
