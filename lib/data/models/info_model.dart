class InfoModel{
  int _id;
  String _name;
  String _text;

  int get id => _id;
  String get name => _name;
  String get text => _text;

  void setText(String text) {
    _text = text;
  }

  InfoModel(
      {int id, String name, String text}) {
    _id = id;
    _name = name;
    _text = text;
  }
  factory InfoModel.fromMap(Map<String, dynamic> json) {
    return InfoModel(
        id: json["id"],
        name: json["title"],
        text: json["text"],
    );
  }
}