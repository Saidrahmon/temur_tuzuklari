class TitleModel{
  int _id;
  int _categoryId;
  int _chapter;
  String _title;
  String _text;
  String _desc;

  int get id => _id;
  int get categoryId => _categoryId;
  int get chapter => _chapter;
  String get title => _title;
  String get text => _text;
  String get desc => _desc;

  void setText(String text) {
    _text = text;
  }

  TitleModel(
      {int id, int categoryId, int chapter, String title, String text, String desc}) {
    _id = id;
    _categoryId = categoryId;
    _chapter = chapter;
    _title = title;
    _text = text;
    _desc = desc;
  }
  factory TitleModel.fromMap(Map<String, dynamic> json) {
    return TitleModel(
        id: json["id"],
        categoryId: json["categoryId"],
        chapter: json["chapter"],
        title: json["title"],
        text: json["text"],
        desc: json["desc"]
    );
  }
}