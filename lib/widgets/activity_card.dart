import 'package:flutter/material.dart';
import '/models/models.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xffffcdd1),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 420,
                        left: 22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity.name,
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              '\$' * activity.price + " | " + activity.type + " for: " + activity.tag,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              activity.address + ", S" + activity.postal,
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    height: 2.5
                                  ),
                            ),
                            Text(
                              activity.opening + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 1.25, //this is the total width of your screen
                                child: Text(
                              activity.description,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            ),
                          ],
                        )),
                    Positioned(
                      right: 10,
                      left: 10,
                      top: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        padding: const EdgeInsets.only(
                          left: 14,
                          right: 14,
                          top: 20,
                          bottom: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(activity.imageUrls)),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(0.5))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

// - name
// - address
// - postal code
// - price (scale 1-3)
// - website (text)
// - phone (num)
// - opening hours (text)
// - type (activity/food/both - text)
// - tag (text)
// - description (text)
