import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String price;
  final String location;
  final double width;
  final double height;
  final String image;

  const CustomCard(
      {super.key,
      required this.price,
      required this.location,
      required this.width,
      required this.height,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      width: width * .5,
      margin: EdgeInsets.only(right: width * .03),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * .6,
              height: height * .25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Text(
              location,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                const Icon(CupertinoIcons.heart)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
