// import 'package:flutter/material.dart';

// class PageSelector extends StatefulWidget {
//   @override
//   _PageSelectorState createState() => _PageSelectorState();
// }

// class _PageSelectorState extends State<PageSelector> {
//   int selectedIndex = 0;
//   final List<String> pages = ['Friends', 'Memories', 'Statistics'];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 90.0,
//       color: Colors.white,
//       child: ListView(
//         padding: const EdgeInsets.all(8),
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           TextButton(
//             onPressed: () {},
//             style: ButtonStyle(
//               overlayColor: MaterialStateProperty.resolveWith<Color?>(
//                 (Set<MaterialState> states) {
//                   if (states.contains(MaterialState.pressed))
//                     return Color.fromARGB(255, 251, 187, 187); //<-- SEE HERE
//                   return null; // Defer to the widget's default.
//                 },
//               ),
//             ),
//             child: const Text(
//               'Friends',
//               style: TextStyle(fontSize: 20),
//               ),
//             ),
//             TextButton(
//             onPressed: () {},
//             style: ButtonStyle(
//               overlayColor: MaterialStateProperty.resolveWith<Color?>(
//                 (Set<MaterialState> states) {
//                   if (states.contains(MaterialState.pressed))
//                     return Color.fromARGB(255, 251, 187, 187); //<-- SEE HERE
//                   return null; // Defer to the widget's default.
//                 },
//               ),
//             ),
//             child: const Text(
//               'Memories',
//               style: TextStyle(fontSize: 20),
//             ),
//           )
//         ],
//       )
      
//       // ListView.builder(
//       //   scrollDirection: Axis.horizontal,
//       //   itemCount: pages.length,
//       //   itemBuilder: (BuildContext context, int index) {
//       //     return GestureDetector(
//       //       onTap: () {
//       //         setState(() {
//       //           selectedIndex = index;

//       //         });
//       //         // if(selectedIndex == 0){
//       //         //   Navigator.pushNamed(context, '/home');
//       //         // }
//       //         // if(selectedIndex == 1){
//       //         //   Navigator.pushNamed(context, '/memories');
//       //         // }
//       //         // if(selectedIndex == 2){
//       //         //   Navigator.pushNamed(context, '/statistics');
//       //         // }
//       //       },
//       //       child: Padding(
//       //         padding: EdgeInsets.symmetric(
//       //           horizontal: 20.0,
//       //           vertical: 30.0,
//       //         ),
//       //         child: Text(
//       //           pages[index],
//       //           style: TextStyle(
//       //             color: index == selectedIndex ? Color.fromARGB(255, 254, 143, 152) : Color.fromARGB(255, 253, 186, 192),
//       //             fontSize: 24.0,
//       //             fontWeight: FontWeight.bold,
//       //             letterSpacing: 1.2,
//       //           ),
//       //         ),
              
//       //       ),
            
//       //     );
//       //   },
//       // ),
//     );

//   }
// }