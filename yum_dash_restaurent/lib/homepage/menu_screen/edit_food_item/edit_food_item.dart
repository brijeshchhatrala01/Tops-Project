// ignore_for_file: unused_element, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yum_dash_restaurent/homepage/menu_screen/add_item/custom_textformfield/custom_textformfield.dart';
import 'package:yum_dash_restaurent/homepage/menu_screen/add_item/menu_model/menu_model.dart';
import 'package:yum_dash_restaurent/homepage/menu_screen/menu_screen.dart';
import 'package:yum_dash_restaurent/theme/colors.dart';
import 'package:http/http.dart' as http;

class EditFoodItem extends StatefulWidget {
  final String foodId;
  const EditFoodItem({super.key, required this.foodId});

  @override
  State<EditFoodItem> createState() => _EditFoodItemState();
}

class _EditFoodItemState extends State<EditFoodItem> {
  String imgUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS789NyUdpX3QENXM1a9d3367Dq5eU-EW_76A&s';

  @override
  void initState() {
    getFoodData();
    super.initState();
  }

  //veg-non veg switch value
  final _controllerSwitch = ValueNotifier<bool>(false);

  //controllers food
  final _controllerFoodName = TextEditingController();
  Set<String>? _ingridientSet = {};
  final _controllerFoodDiscription = TextEditingController();
  final _controllerFoodPrice = TextEditingController();

  //get image file
  File _file = File('');

  //global formstate key for validate form
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //get device height & width
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
                    //select image from gallary
                    onTap: () => pickImage(),
                    child: _file.path.isEmpty
                        ? Image.network(
                            width: width * 0.4,
                            height: height * 0.3,
                            imgUrl,
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
                //veg-nonveg switch
                AdvancedSwitch(
                  controller: _controllerSwitch,
                  width: width * 0.3,
                  activeChild: const Text('Non-Veg'),
                  activeColor: Colors.red,
                  inactiveChild: const Text('Veg'),
                  inactiveColor: Colors.green,
                  onChanged: (value) {
                    _controllerSwitch.value = value;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  controller: _controllerFoodName,
                  keyboardType: TextInputType.text,
                  hintText: 'Enter Item Name',
                  prefixIcon: Icons.local_dining_sharp,
                ),
                const SizedBox(
                  height: 12,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: MultiSelectChoiceChip(
                      title: "Ingridients",
                      options: const [
                        'Rice',
                        'Brocoli',
                      ],
                      selectedChoices: _ingridientSet!,
                      onSelectionChanged: (value) {
                        setState(() {
                          _ingridientSet = value;
                        });
                      },
                    )),

                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  controller: _controllerFoodDiscription,
                  hintText: 'Enter Discription',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.text_fields_outlined,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  controller: _controllerFoodPrice,
                  keyboardType: TextInputType.number,
                  hintText: 'Enter Price',
                  prefixIcon: Icons.currency_rupee,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      var data = MenuModel(
                        food_name: _controllerFoodName.text.trim(),
                        food_catagory:
                            !_controllerSwitch.value ? 'veg' : 'non-veg',
                        food_discription:
                            _controllerFoodDiscription.text.trim(),
                        food_indigrients:
                            _ingridientSet.toString().splitMapJoin(','),
                        food_price: int.parse(_controllerFoodPrice.text.trim()),
                        //initially true by default
                        food_in_stock: 1,
                        //initially true by default
                        food_is_recommanded: 1,
                      );
                      //  await _addFoodItemToMenu(data, _file);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightGreen,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'U P D A T E',
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

  //pick image from galary
  pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
    }
  }

  _addFoodItemToMenu(MenuModel menuModel, File image_file) async {
    var url = Uri.parse(
        'https://gleg-span.000webhostapp.com/yum_dash/menu/add_food_item.php');
    var req = http.MultipartRequest('POST', url)
      ..files.add(
        await http.MultipartFile.fromPath('food_image', image_file.path),
      )
      ..fields['food_catagory'] = menuModel.food_catagory.toString()
      ..fields['food_name'] = menuModel.food_name.toString()
      ..fields['food_ingridients'] = menuModel.food_indigrients.toString()
      ..fields['food_discription'] = menuModel.food_discription.toString()
      ..fields['food_price'] = menuModel.food_price.toString()
      ..fields['food_is_recommanded'] = menuModel.food_is_recommanded.toString()
      ..fields['food_in_stock'] = menuModel.food_in_stock.toString();

    var response = await req.send();
    debugPrint('Response : ${response.statusCode}');
  }

  getFoodData() async {
    var url = Uri.parse(
        'https://gleg-span.000webhostapp.com/yum_dash/menu/getFoodItemById.php');
    var resp = await http.post(url, body: {
      'id': widget.foodId,
    });
    var listData = jsonDecode(resp.body);
    setState(() {
      imgUrl = listData[0]['food_image'];
      _controllerSwitch.value = listData[0]['veg'] == 'veg' ? false : true;
      _controllerFoodName.text = listData[0]['food_name'];
      _controllerFoodDiscription.text = listData[0]['food_discription'];
      _controllerFoodPrice.text = listData[0]['food_price'];
    });
    debugPrint(resp.body);
  }
}

class MultiSelectChoiceChip extends StatefulWidget {
  final String title; // Title to display
  final List<String> options; // List of chip options
  final Set<String> selectedChoices; // Set to store selected values
  final void Function(Set<String>) onSelectionChanged; // Callback for changes

  const MultiSelectChoiceChip({
    super.key,
    required this.title,
    required this.options,
    required this.selectedChoices,
    required this.onSelectionChanged,
  });

  @override
  State<MultiSelectChoiceChip> createState() => _MultiSelectChoiceChipState();
}

class _MultiSelectChoiceChipState extends State<MultiSelectChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(widget.title),
          const SizedBox(width: 10.0), // Spacing between title and chips
          Expanded(
            child: Wrap(
              children: widget.options.map((option) {
                return Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: ChoiceChip(
                    label: Text(option),
                    selectedColor: lightGreen.withOpacity(0.4),
                    selected: widget.selectedChoices.contains(option),
                    backgroundColor: widget.selectedChoices.contains(option)
                        ? Colors.green
                        : null,
                    onSelected: (selected) {
                      setState(() {
                        final newSelectedChoices =
                            Set<String>.from(widget.selectedChoices);
                        if (selected) {
                          newSelectedChoices.add(option);
                        } else {
                          newSelectedChoices.remove(option);
                        }
                        widget.onSelectionChanged(newSelectedChoices);
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
