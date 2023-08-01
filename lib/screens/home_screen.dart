import 'package:atg_task_1/api/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';
import '../widgets/custom_button.dart';
import '../widgets/title_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 246, 248, 255),
        leading: SvgPicture.asset(
          "assets/icons/Menu.svg",
        ),
        actions: [
          SvgPicture.asset("assets/icons/message.svg"),
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset("assets/icons/Notification.svg"),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.sizeOf(context).height * 0.33,
              width: double.infinity,
              color: Color.fromARGB(255, 246, 248, 255),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,Priya!",
                          style: GoogleFonts.lato(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "What do you wanna learn today?",
                          style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        imgPath: "assets/icons/Book-mark.png",
                        text: "Programs",
                      ),
                      CustomButton(
                        imgPath: "assets/icons/help-circle.png",
                        text: "Get help",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        imgPath: "assets/icons/Book-open.png",
                        text: "Learn",
                      ),
                      CustomButton(
                        imgPath: "assets/icons/trello.png",
                        text: "DD Tracker",
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              // height: 600,
              child: Column(
                children: [
                  //-------------------------------Program for you----------------------
                  TitleBar(title: "Program for you"),
                  FutureBuilder(
                    future: ApiService().fetchPrograms(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width - 10,
                          height: 300,
                          child: ListView.builder(
                            itemCount: snapshot.data!.items!.length,
                            itemBuilder: (context, index) => Card(
                              elevation: 1,
                              child: Column(
                                children: [
                                  index % 2 == 0
                                      ? Image.asset(lifestyleImg)
                                      : Image.asset(workingParentImg),
                                  Container(
                                    width: 250,
                                    height: 150,
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            snapshot
                                                .data!.items![index].category
                                                .toString(),
                                            style: GoogleFonts.inter(
                                                color: Color.fromARGB(
                                                    255, 89, 138, 237),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            snapshot.data!.items![index].name
                                                .toString(),
                                            style: GoogleFonts.inter(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            snapshot.data!.items![index].lesson
                                                    .toString() +
                                                " lesson",
                                            style: GoogleFonts.inter(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                  //--------------------------Events and Experience-----------------------------
                  TitleBar(
                    title: "Events and Experience",
                    fontSize: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 10,
                    height: 300,
                    child: ListView.builder(
                      itemCount: eventsExp.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        child: Column(
                          children: [
                            Image.asset(
                              eventsExp[index]["imageURL"],
                            ),
                            Container(
                              width: 250,
                              height: 150,
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      eventsExp[index]["title"],
                                      style: GoogleFonts.inter(
                                          color:
                                              Color.fromARGB(255, 89, 138, 237),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      eventsExp[index]["desc"],
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      eventsExp[index]["date"],
                                      style: GoogleFonts.inter(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    trailing: Container(
                                      width: 70,
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          "BOOK",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 89, 138, 237)),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 89, 138, 237)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  //--------------------------Lesson for you-------------------------------
                  TitleBar(title: "Lesson for you"),
                  FutureBuilder(
                    future: ApiService().fetchLessons(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width - 10,
                          height: 300,
                          child: ListView.builder(
                            itemCount: snapshot.data!.items!.length,
                            itemBuilder: (context, index) => Card(
                              elevation: 1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    yogaWomanImg,
                                  ),
                                  Container(
                                    width: 250,
                                    height: 150,
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            snapshot
                                                .data!.items![index].category
                                                .toString(),
                                            style: GoogleFonts.inter(
                                                color: Color.fromARGB(
                                                    255, 89, 138, 237),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            snapshot.data!.items![index].name
                                                .toString(),
                                            style: GoogleFonts.inter(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        ListTile(
                                            leading: Text(
                                              snapshot.data!.items![index]
                                                      .duration
                                                      .toString() +
                                                  " min",
                                              style: GoogleFonts.inter(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            trailing: ImageIcon(AssetImage(
                                                "assets/icons/lock.png"))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home-tab.png"), label: ""),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/learn-tab.png"), label: ""),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/hub-tab.png"), label: ""),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/chat-tab.png"), label: ""),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/profile-tab.png"), label: ""),
      ]),
    );
  }
}
