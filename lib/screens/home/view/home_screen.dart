import 'dart:math';

import 'package:advanced_flutter_reexam/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Quiz app"),
          titleSpacing: 25,
          backgroundColor: Colors.black54,
        ),
        body: FutureBuilder(
          future: controller.QuizApi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              Animal? data = snapshot.data;
              List<Result>? results = data?.results;
              //
              List<String> l1 = [
                "${results![controller.index.value].incorrectAnswers[0]}",
                "${results![controller.index.value].incorrectAnswers[1]}",
                "${results![controller.index.value].incorrectAnswers[2]}",
                "${results[controller.index.value].correctAnswer}"
              ];

              List l2 = [];
              var answer;

              Random random = Random();
              int a =random.nextInt(4);
              l2.insert(a, "$l1");
              answer = l2;
              //
              // // int i;
              // //
              // // Random random =Random();
              // // int a = random.nextInt(4);
              // // l2.insert(a,"${results[controller.index.value].correctAnswer}");
              // // answer.value = l2;
              //
              // Random random = Random();
              // Random random1 = Random.secure();
              //
              // int a = random1.nextInt(l1.length);
              // l2.insert(a, "${results![controller.index.value].correctAnswer}");

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          "${controller.number.value}. ${results![controller.index.value].question}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Obx(
                              () => Text(
                                "A. ${results![controller.index.value].incorrectAnswers[0]}",
                                // "A. ${results![controller.index.value].incorrectAnswers[0]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 60),
                                backgroundColor: Colors.red.shade300),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Obx(
                              () => Text(
                                "B. ${results![controller.index.value].incorrectAnswers[1]}",
                                // "B. ${results![controller.index.value].incorrectAnswers[1]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 60),
                                backgroundColor: Colors.red.shade300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Obx(
                              () => Text(
                                "C. ${results![controller.index.value].incorrectAnswers[2]}",
                                // "C. ${results![controller.index.value].incorrectAnswers[2]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 60),
                                backgroundColor: Colors.red.shade300),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Obx(
                              () => Text(
                                "D. ${results![controller.index.value].correctAnswer}",
                                // "D. ${results![controller.index.value].correctAnswer}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 60),
                                backgroundColor: Colors.red.shade300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (controller.index.value != 0 &&
                                  controller.index.value < 10) {
                                controller.number.value--;
                                controller.index.value--;
                              }
                            },
                            child: Text(
                              "Previous",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              fixedSize: Size(100, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.number.value++;
                              controller.index.value++;
                              if(controller.index.value == 10)
                                {
                                  Get.toNamed('/last');
                                }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              fixedSize: Size(100, 50),
                            ),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
