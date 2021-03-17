class TitleModel{
  int _id;
  int _categoryId;
  int _chapter;
  String _title;
  String _text;
  String _desc;
  String _lang;

  int get id => _id;
  int get categoryId => _categoryId;
  int get chapter => _chapter;
  String get title => _title;
  String get text => _text;
  String get desc => _desc;
  String get lang => _lang;

  void setText(String text) {
    _text = text;
  }

  TitleModel(
      {int id, int categoryId, int chapter, String title, String text, String desc, String lang}) {
    _id = id;
    _categoryId = categoryId;
    _chapter = chapter;
    _title = title;
    _text = text;
    _desc = desc;
    _lang = lang;
  }
  factory TitleModel.fromMap(Map<String, dynamic> json) {
    return TitleModel(
        id: json["id"],
        categoryId: json["categoryId"],
        chapter: json["chapter"],
        title: json["title"],
        text: json["text"],
        desc: json["desc"],
        lang: json["lang"]
    );
  }
}