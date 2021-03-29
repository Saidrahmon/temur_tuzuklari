import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/screens/settings/controllers/settings_screen_controller.dart';

class BuildDropDownButton extends StatelessWidget {
  const BuildDropDownButton({this.controller,});

  final SettingsScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton<String>(
        dropdownColor: Colors.white,
        value: controller.dropDownValue.value,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black54, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.black87,
        ),
        onChanged: (String data) {
          controller.changeLang(data);
        },
        items: controller.spinnerItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
