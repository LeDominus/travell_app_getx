// ignore_for_file: file_names, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/models/custom_cards.dart';
import 'package:weather_app_getx/views/details_page.dart';
import 'package:weather_app_getx/views/explore_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue[50],
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
                      SizedBox(height: height * .03),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: PageView.builder(
                                    itemCount: images.length,
                                    physics: const ClampingScrollPhysics(),
                                    onPageChanged: (value) {
                                      setState(() {
                                        currentIndex = value;
                                      });
                                    },
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
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 25,
                              left: 25,
                              child: Text(
                                "Welcome to our tour",
                                style: TextStyle(
                                  fontFamily: 'Aclonica',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  images.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: currentIndex == index ? 20 : 10,
                                    height: 10,
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? Colors.deepPurple
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Top trips",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const ExplorePage()));
                                },
                                child: const Row(
                                  children: [
                                    Text(
                                      'Explore',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                    Icon(Icons.keyboard_arrow_right)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: height * .015),
                      SizedBox(
                        width: width,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(const DetailsPage()),
                                child: CustomCard(
                                    price: '230',
                                    location: "Lorem Ipsum",
                                    width: width,
                                    height: height,
                                    image: 'assets/images/5.jpg'),
                              ),
                              GestureDetector(
                                  onTap: () => Get.to(const DetailsPage()),
                                  child: CustomCard(
                                      price: '720',
                                      location: "Shri Lanka",
                                      width: width,
                                      height: height,
                                      image: 'assets/images/6.jpg')),
                              GestureDetector(
                                onTap: () => Get.to(const DetailsPage()),
                                child: CustomCard(
                                    price: '560',
                                    location: "Dubai",
                                    width: width,
                                    height: height,
                                    image: 'assets/images/7.jpg'),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
