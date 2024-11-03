class PointModel {
  final int number;
  final String content;

  PointModel({required this.number, required this.content});

  factory PointModel.fromMap(Map<String, dynamic> map) {
    return PointModel(number: map["number"], content: map["content"]);
  }
}
