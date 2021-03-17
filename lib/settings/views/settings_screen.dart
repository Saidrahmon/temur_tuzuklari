import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/settings/controllers/settings_screen_controller.dart';

class SettingsScreen extends GetView<SettingsScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sozlamalar'),
        backgroundColor: Color(0xFF937245),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tilni o\'zgartirish'),
                Obx(() {
                  return DropdownButton<String>(
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
                      //print(data);
                      controller.changeLang(data);
                    },
                    items: controller.spinnerItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }

                ),
                //Switch(value: null, onChanged: null)
              ],
            ),
          )
        ],
      ),
    );
  }
}
