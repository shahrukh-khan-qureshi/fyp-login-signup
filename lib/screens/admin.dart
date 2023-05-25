// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/login.dart';
import '../Responsive/responisve.dart';
import "package:login_signup/Responsive/responisve.dart";
import "package:login_signup/Utlis/constant.dart";
import "package:login_signup/Widget/Sidebar.dart";
import "package:login_signup/Widget/drawerWidget.dart";
import "package:flutter/material.dart";

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String PopbuttonValue = "";

  late String DrawerSelector = "patient";
  void _updateSelectedUser(String user) {
    setState(() {
      DrawerSelector = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final cellWidth = screenWidth / 2 - 12; // subtracting padding
    final aspectRatio = cellWidth / 150; // 150 is the height of the cell
    return Scaffold(
      appBar: AppBar(
        shape: Responsive.isMobile(context)
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              )
            : null,
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        actions: [
          if (Responsive.isMobile(context))
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  // Navigate to the second page
                  context,
                  MaterialPageRoute(builder: (context) => Sidebar()),
                );
              },
            ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text("HT"),
          ),
          PopupMenuButton(
            onSelected: (value) => setState(() {
              PopbuttonValue = value;
            }),
            initialValue: PopbuttonValue,
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: LOGOUT,
                child: Text('LOGOUT'),
              ),
            ],
            offset: Offset(0, kToolbarHeight),
          ),
        ],
      ),
      drawer: Responsive.isMobile(context)
          ? drawerWidget(
              updateSelectedUser: _updateSelectedUser,
            )
          : null,
      body: Row(
        children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (Responsive.isDesktop(context)) {
              return drawerWidget(
                updateSelectedUser: _updateSelectedUser,
              );
            } else {
              return Container();
            }
          }),
          Expanded(
            flex: 2,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              AspectRatio(
                aspectRatio: Responsive.isMobile(context) ? 2 : 4,
                child: SizedBox(
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                      childAspectRatio: Responsive.isMobile(context) ? 2 : 1,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color.fromARGB(255, 216, 220, 221),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Patient",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text("TOTAL: 1233")
                                ],
                              ),
                              Stack(
                                alignment: Alignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 45,
                                  ),
                                  SizedBox(
                                    width: 55,
                                    height: 55,
                                    child: CircularProgressIndicator(
                                      value: 0.3,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                DrawerSelector.toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                      ),
                      title: Text(
                        'Haris',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.0),
                          Text(
                            'street 24',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 12.0,
                              ),
                              SizedBox(width: 1.0),
                              Text(
                                'Appointment scheduled',
                                style: TextStyle(
                                  fontSize:
                                      Responsive.isMobile(context) ? 12 : 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // handle reject appointment
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                'Reject',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              // handle approve appointment
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                'Approve',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (Responsive.isDesktop(context)) {
              return Sidebar();
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
