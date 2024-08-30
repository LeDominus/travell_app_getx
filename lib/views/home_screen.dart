// ignore_for_file: file_names, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List<String> images = [
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[50],
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.dashboard,
              size: 30,
              color: Colors.grey,
            ),
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                CupertinoIcons.bell,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: height,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .05,
                          ),
                          SizedBox(
                            width: width,
                            height: height * .3,
                            child: Stack(
                              children: [
                                Positioned(
                                    child: Container(
                                  width: width,
                                  height: height * .3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: PageView.builder(
                                    itemCount: images.length,
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          images[index],
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                )),
                                const Positioned(
                                    top: 25,
                                    left: 25,
                                    child: Text("Welcome to our tour",
                                        style: TextStyle(
                                          fontFamily: 'Aclonica',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        )))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    width: width,
                    color: Colors.blue[50],
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.home_filled,
                            size: 35,
                            color: Colors.deepPurple,
                          ),
                          const Icon(
                            Icons.search,
                            size: 35,
                            color: Colors.grey,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.explore,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(Icons.bookmark_outline,
                              size: 35, color: Colors.grey),
                          const Icon(Icons.person_outline,
                              size: 35, color: Colors.grey)
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
