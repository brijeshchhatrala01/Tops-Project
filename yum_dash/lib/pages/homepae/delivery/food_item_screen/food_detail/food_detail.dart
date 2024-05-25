import 'package:flutter/material.dart';
import 'package:yum_dash/theme/colors.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: MediaQuery.of(context).size.height * 0.35,
      color: Theme.of(context).brightness == Brightness.dark
          ? kBlackColor
          : kWhiteColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const Row(
                children: [
                  Text(
                    'Ingredienta',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/rice-bowl.png', width: 24),
                              const Text('Rise'),
                            ],
                          ),
                        ),
                    separatorBuilder: (_, index) => const SizedBox(
                          width: 16,
                        ),
                    itemCount: 3),
              ),
              const SizedBox(height: 30),
              const Text(
                "Harmonius ncanclnakc nabdkcna c bcadncad cbkia bckadbcka ,c abkuck ucgauidbckabckaghoan iachabckasbckas ckasbc baibcaskbckasbcascbaskcbk",
                style: TextStyle(fontSize: 16, wordSpacing: 1.2, height: 1.5),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
