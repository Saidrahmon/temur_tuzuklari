import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/constants.dart';
import 'package:temur_tuzuklari/settings/controllers/settings_screen_controller.dart';
import 'package:temur_tuzuklari/story/views/build_modal_bottom_sheet_for_settings.dart';
import 'build_drop_down_button.dart';

class SettingsScreen extends GetView<SettingsScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kTextSettings.tr),
        backgroundColor: Color(0xFF937245),
      ),
      body: Stack(
        children: [
          Obx(()=>Container(
            color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
          ),),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(kTextChangeLang.tr, style: TextStyle(fontSize: 18.0),),
                    BuildDropDownButton(controller: controller,),
                    //Switch(value: null, onChanged: null)
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                    children: [
                      BuildModalBotomSheetForSettings(controller: controller.service, )
                    ],
                  )
              ),
            ],
          ),
        ],
      )
    );
  }
}
