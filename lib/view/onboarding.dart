import 'package:doctor_app/models/onboarding_model.dart';
import 'package:doctor_app/view/home.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<OnBoardingModel> onBoardingModel = [
    OnBoardingModel(
      tilte: "DoctorApp is the first",
      subTitle:
          "patented system created to help general practitioners\n in the organization of their practice",
      image: "assets/images/details-4.png",
    ),
    OnBoardingModel(
      tilte: "DoctorApp is the Second",
      subTitle:
          "patented system created to help general practitioners\n in the organization of their practice",
      image: "assets/images/details-4.png",
    ),
    OnBoardingModel(
      tilte: "DoctorApp is the Third",
      subTitle:
          "patented system created to help general practitioners\n in the organization of their practice",
      image: "assets/images/details-4.png",
    ),
  ];

  late PageController pageController;

  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: pageController,
              itemCount: onBoardingModel.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      onBoardingModel[index].image,
                      width: 500,
                      height: 500,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      onBoardingModel[index].tilte,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      onBoardingModel[index].subTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onBoardingModel.length, (index) {
                
                return builDot(index);
              })
            ,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == onBoardingModel.length - 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeView();
                    },
                  ),
                );
              }
              pageController.nextPage(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeIn);
            },
            child: Container(
              width: 200,
              height: 45,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Center(
                child: Text(
                  currentIndex == onBoardingModel.length - 1
                      ? "Content"
                      : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Container builDot(int index) {
    return Container(
                margin: const EdgeInsets.only(right: 10),
                width: currentIndex == index ? 25 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
              );
  }
}
