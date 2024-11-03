import 'dart:ffi';

import 'package:caminho_app/data/model/point_model.dart';
import 'package:caminho_app/data/repository/chapter_repository.dart';
import 'package:caminho_app/ui/interactor/atoms/home_atom.dart';

Future<void> fetchRandomPoint() async {
  PointModel point = await ChapterRepository().getRandomPoint();

  pointState.value = point;
}

Future<void> fetchFavoritePoint(Int id) async {
  //todo...
}
