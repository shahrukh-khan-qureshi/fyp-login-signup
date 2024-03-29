import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/login.dart';
import '../Responsive/responisve.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      body: Column(
        children: [
          // Header section
          Container(
            width: Responsive.isDesktop(context) ? 345 : double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                Icon(Icons.notifications),
                SizedBox(width: 8),
                Text('Notifications'),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          // Notification items section
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10, // Replace with actual item count
              itemBuilder: (BuildContext context, int index) {
                // Replace with actual notification item widget
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Time section
                      Container(
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('10:30 AM',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: 16),
                      // Notification content section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Notification item ${index + 1}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// Container(
//       width: 345,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           // Header section
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.notifications),
//                 SizedBox(width: 8),
//                 Text('Notifications'),
//                 Spacer(),
//                 IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () {
//                     // Handle close button action
//                   },
//                 ),
//               ],
//             ),
//           ),
//           // Notification items section
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               itemCount: 10, // Replace with actual item count
//               itemBuilder: (BuildContext context, int index) {
//                 // Replace with actual notification item widget
//                 return Container(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Time section
//                       Container(
//                         width: 70,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: Colors.blue[200],
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text('10:30 AM',
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                       ),
//                       SizedBox(width: 16),
//                       // Notification content section
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Notification item ${index + 1}',
//                                 style: TextStyle(fontWeight: FontWeight.bold)),
//                             SizedBox(height: 4),
//                             Text(
//                                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet.'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
