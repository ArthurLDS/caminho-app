import 'package:caminho_app/data/model/point_model.dart';

class ChapterModel {
  final int number;
  final String title;
  final List<PointModel> points;

  ChapterModel(
      {required this.number, required this.title, required this.points});

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
        number: map["number"],
        title: map["title"],
        points: List<PointModel>.from(
            (map["points"] as List).map((e) => PointModel.fromMap(e))));
  }
}
