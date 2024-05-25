import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isPrepareChipSelected = false;
  bool isReadyChipSelected = false;
  bool isPickedUpChipSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(
                  label: const Text('Preparing (0)'),
                  selected: isPrepareChipSelected,
                  onSelected: (value) {
                    setState(() {
                      isPrepareChipSelected = !isPrepareChipSelected;
                      isReadyChipSelected = false;
                      isPickedUpChipSelected = false;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Ready (0)'),
                  selected: isReadyChipSelected,
                  onSelected: (value) {
                    setState(() {
                      isReadyChipSelected = !isReadyChipSelected;
                      isPrepareChipSelected = false;
                      isPickedUpChipSelected = false;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Picked up (0)'),
                  selected: isPickedUpChipSelected,
                  onSelected: (value) {
                    setState(() {
                      isPickedUpChipSelected = !isPickedUpChipSelected;
                      isPrepareChipSelected = false;
                      isReadyChipSelected = false;
                    });
                  },
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Center(
                  child: Image.asset('assets/no_order.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
