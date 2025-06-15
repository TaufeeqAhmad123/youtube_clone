import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:shimmer/shimmer.dart';

class shimmerScreen extends StatefulWidget {
  const shimmerScreen({super.key});

  @override
  State<shimmerScreen> createState() => _shimmerScreenState();
}

class _shimmerScreenState extends State<shimmerScreen> {
   @override
  void initState() {
   
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 100,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                
              ),
            ),
            const Spacer(),
            Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(width: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.builder(
        
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.grey[400]!,
                  child: Container(
                    
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[400]!,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                     
                      children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                        height: 20,
                        width: 150,
                        color: Colors.white,
                      ),
                      SizedBox(height: 5),
                       Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                        ],
                      )
                    ],),
                    
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
