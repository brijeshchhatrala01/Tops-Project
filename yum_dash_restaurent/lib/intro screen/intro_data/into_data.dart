import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../login/login.dart';
import '../../theme/colors.dart';

//introduction display
class IntroData extends StatelessWidget {
  const IntroData({super.key});

  void goToLoginPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
              items: [
                Stack(children: [
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/intro1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 42,
                    left: 16,
                    child: Text(
                      'Yum Dash',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  const Positioned(
                    bottom: 12,
                    left: 16,
                    child: Text(
                      'Manage Order And Menu In Breeze',
                      style: TextStyle(color: kWhiteColor, fontSize: 18),
                    ),
                  )
                ]),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/intro2.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 72,
                      left: 16,
                      child: Text(
                        'Yum Dash',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        'Get Business Insights and \nImporovent Tips',
                        style: TextStyle(color: kWhiteColor, fontSize: 18),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/intro3.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 72,
                      left: 16,
                      child: Text(
                        'Yum Dash',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        'Create Promotion and Grow \nYour Business',
                        style: TextStyle(color: kWhiteColor, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
              options: CarouselOptions(
                height: height * 0.8,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 1,
                autoPlayCurve: Curves.easeOutBack,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(seconds: 24),
              )),
          const SizedBox(
            height: 22,
          ),
          GestureDetector(
            onTap: () => goToLoginPage(context),
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'L O G I N',
                  style: TextStyle(color: kWhiteColor, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
