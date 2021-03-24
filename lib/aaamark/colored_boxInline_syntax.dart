import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';

class ColoredBoxInlineSyntax extends  InlineSyntax{
  ColoredBoxInlineSyntax({
    String pattern = r'@@(.*?)@@',
  }) : super(pattern);

  @override
  bool onMatch(InlineParser parser, Match match) {
    /// This creates a new element with the tag name `coloredBox`
    /// The `textContent` of this new tag will be the
    /// pattern match _without_ the dashes.
    ///
    /// We can change how this looks by creating a custom
    /// [MarkdownElementBuilder] from the `flutter_markdown` package.
    final withoutDashes = match.group(0).replaceAll(RegExp(r'@@'), "");

    Element el = Element.text("coloredBox", withoutDashes.titleCase());

    parser.addNode(el);
    return true;
  }
}

class StringFormatError {
  String message;

  StringFormatError(this.message);
}

extension TitleCaseExtension on String {
  String titleCase() {
    try {
      if (this.contains(" ")) {
        return this
            .trim()
            .split(' ')
            .map((String word) =>
        "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}")
            .join(" ");
      } else {
        return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
      }
    } catch (e) {
      throw StringFormatError("Cannot format String: $this");
    }
  }
}