import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';
import '../pages/memories/memory_page.dart';

class memoryCard extends StatelessWidget {
  const memoryCard({Key? key, required this.outing})
      : super(key: key);

  final Outing outing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return MemoryPage(outing:outing);
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
                      outing.name.length > 19
                          ? outing.name.substring(0, 17) + "..."
                          : outing.name,
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
                  outing.date == null
                      ? 'Show Result'
                      : DateFormat("dd-MM-yyyy")
                          .format(outing.date ?? DateTime(0000)),
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
