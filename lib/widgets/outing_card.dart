import 'package:flutter/material.dart';
import '/models/models.dart';


class OutingCard extends StatelessWidget {
  final Outing outing;

  const OutingCard({Key? key, required this.outing}) : super(key: key);

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
        children:[
          Positioned(
            bottom: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${outing.name}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '${outing.address}',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "${outing.postal}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),
                Text(
                  "${outing.price}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),
                Text(
                  "${outing.website}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),Text(
                  "${outing.phone}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),Text(
                  "${outing.opening}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),Text(
                  "${outing.type}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),Text(
                  "${outing.tags}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),Text(
                  "${outing.bio}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  ),
                ),
                
              ],
            )
            ),
            // Positioned.fill(
            //     child: Align(
            //         alignment: Alignment.bottomLeft,
            //         child: Container(
            //             width: 362,
            //             height: 201,
            //             child: Stack(
            //                 children:[
            //                     Positioned(
            //                         left: 66,
            //                         top: 40,
            //                         child: Text(
            //                         '${outing.name}',
            //                         textAlign: TextAlign.center,
            //                         style: Theme.of(context).textTheme.headline2!.copyWith(
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.normal,
            //                           ),
            //                       ),
            //                     ),
            //                     Positioned(
            //                         left: 70,
            //                         top: 77,
            //                         child: Text(
            //                         '${outing.address}',
            //                         style: Theme.of(context).textTheme.headline2!.copyWith(
            //                             color: Colors.black,
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.normal,
            //                           ),
            //                       ),
            //                     ),
            //                     Positioned(
            //                         left: 70,
            //                         top: 134,
            //                         child: Text(
            //                             "Completed by ${outing.name}",
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: 15,
            //                             ),
            //                         ),
            //                     ),
            //                     Positioned(
            //                         left: 282,
            //                         top: 123,
            //                         child: Text(
            //                             "price",
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: 10,
            //                             ),
            //                         ),
            //                     ),
            //                     Positioned(
            //                         left: 70,
            //                         top: 158,
            //                         child: Text(
            //                             "Liked by Tricia",
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: 15,
            //                             ),
            //                         ),
            //                     ),
            //                     Positioned(
            //                         left: 41,
            //                         top: 77,
            //                         child: Container(
            //                             width: 22,
            //                             height: 28,
            //                             child: Icon(Icons.add_location_outlined, color: Colors.black,),
            //                         ),
            //                     ),
            //                     Positioned(
            //                         left: 44,
            //                         top: 134,
            //                         child: Container(
            //                             width: 22,
            //                             height: 28,
            //                             child: Icon(Icons.tag_faces_outlined, color: Colors.black,),
            //                         ),
            //                     ),
            //                     Positioned(
            //                         left: 44,
            //                         top: 158,
            //                         child: Container(
            //                             width: 22,
            //                             height: 28,
            //                             child: Icon(Icons.favorite, color: Colors.black,),
            //                         ),
            //                     ),
            //                 ],
            //             ),
            //         ),
            //     ),
            // ),
            Positioned(
                right: 10,
                left: 10,
                top: 10,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 20, ),
                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(outing.imageUrls[0])),
                                            borderRadius: BorderRadius.circular(10.0),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withOpacity(0.5))
                                            ]
                                  ),
                                ),
                            
                       
                    
                ),
            ),
        ],
    ),
)
              // Container(
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 255, 205, 209),
              //       // image: DecorationImage(
              //       //     fit: BoxFit.cover,
              //       //     image: NetworkImage(outing.imageUrls[0])),
              //       borderRadius: BorderRadius.circular(5.0),
              //       boxShadow: [
              //         BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 4,
              //             blurRadius: 4,
              //             offset: Offset(3, 3)),
              //       ]),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //      image: DecorationImage(
              //            fit: BoxFit.cover,
              //            image: NetworkImage(outing.imageUrls[0])),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5.0),
              //       gradient: LinearGradient(
              //         colors: [
              //           Color.fromARGB(200, 0, 0, 0),
              //           Color.fromARGB(0, 0, 0, 0),
              //         ],
              //         begin: Alignment.bottomCenter,
              //         end: Alignment.topCenter,
              //       )),
              // ),
              // Column(
              //   children: [
              //   Positioned(
              //     bottom: 30,
              //     left: 20,
              //     child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         '${outing.name}',
              //         style: Theme.of(context).textTheme.headline2!.copyWith(
              //             color: Colors.white,
              //           ),
              //       ),
              //       Text(
              //         '${outing.address}',
              //         style: Theme.of(context).textTheme.headline2!.copyWith(
              //             color: Colors.white,
              //             fontWeight: FontWeight.normal,
              //           ),
              //       ),
              //        Text(
              //         '${outing.address}',
              //         style: Theme.of(context).textTheme.headline2!.copyWith(
              //             color: Colors.white,
              //             fontWeight: FontWeight.normal,
              //           ),
              //       ),                   
              //       ])
              //   ),
              //   ],
              // )
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