//import 'dart:ui';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter/material.dart';


class ColoredBoxMarkdownElementBuilder extends MarkdownElementBuilder {
  /// Once again, purely for example purposes.
  Color _backgroundColorForElement(String text) {
    if (text.toLowerCase() == "new") {
      return Colors.green;
    } else if (text.toLowerCase() == "breaking") {
      return Colors.red;
    }

    return Colors.amber;
  }

  Color _textColorForBackground(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }

  @override
  Widget visitElementAfter(md.Element element, TextStyle preferredStyle) {
    return Text(element.textContent);
    // return GestureDetector(
    //   onTap: (){
    //     print('s');
    //   },
    //   child: Container(
    //     margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(6)),
    //       color: _backgroundColorForElement(element.textContent),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(4.0),
    //       child: Text(
    //         element.textContent,
    //         style: TextStyle(
    //             color: _textColorForBackground(
    //               _backgroundColorForElement(
    //                 element.textContent,
    //               ),
    //             ),
    //             fontWeight: FontWeight.normal),
    //       ),
    //     ),
    //   ),
    // );
  }
}