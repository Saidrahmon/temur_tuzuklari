class KeyValue {
  String key;
  String value;

  KeyValue(this.key, this.value);

  Map toJson() => {
        'key': key,
        'value': value,
      };

  factory KeyValue.fromJson(dynamic json) {
    return KeyValue(json['key'] as String, json['value'] as String);
  }
}
