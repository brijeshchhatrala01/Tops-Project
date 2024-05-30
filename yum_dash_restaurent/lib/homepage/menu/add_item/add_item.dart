import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:yum_dash_restaurent/homepage/menu/add_item/custom_textformfield/custom_textformfield.dart';
import 'package:yum_dash_restaurent/theme/colors.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _controller = ValueNotifier<bool>(false);

  File _file = File('');

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD ITEM'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => pickImage(),
                    child: _file.path.isEmpty
                        ? Image.asset(
                            width: width * 0.4,
                            height: height * 0.3,
                            'assets/blank_image.png',
                            fit: BoxFit.contain,
                          )
                        : Image.file(
                            _file,
                            width: width * 0.4,
                            height: height * 0.3,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                AdvancedSwitch(
                  controller: _controller,
                  width: width * 0.3,
                  activeChild: const Text('Non-Veg'),
                  activeColor: Colors.red,
                  inactiveChild: const Text('Veg'),
                  inactiveColor: Colors.green,
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextFormField(
                  hintText: 'Enter Item Name',
                  prefixIcon: Icons.local_dining_sharp,
                ),
                const SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: MultiSelectChipField(
                    title: const Text('Ingridients'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1),
                    ),
                    items: [
                      MultiSelectItem('Rise', 'Rice'),
                      MultiSelectItem('Carrot', 'Carrot'),
                      MultiSelectItem('Brocolli', 'Brocolli'),
                    ],
                    initialValue: const [],
                    onTap: (p0) {},
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextFormField(
                  hintText: 'Enter Discription',
                  prefixIcon: Icons.text_fields_outlined,
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextFormField(
                  hintText: 'Enter Price',
                  prefixIcon: Icons.currency_rupee,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    if (_key.currentState!.validate()) {}
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightGreen,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'A D D',
                        style: TextStyle(color: kWhiteColor, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
    }
  }
}
