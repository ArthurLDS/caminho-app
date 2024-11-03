import 'dart:convert';
import 'dart:math';

import 'package:caminho_app/data/http/http_client.dart';
import 'package:caminho_app/data/model/chapter_model.dart';
import 'package:caminho_app/data/model/point_model.dart';

const URL_HOST = 'https://caminh-api-5a1e7fbb128f.herokuapp.com/';

abstract class IChapterRepository {
  Future<List<ChapterModel>> getChapters();
}

class ChapterRepository implements IChapterRepository {
  final IHttpClient client = HttpClient();

  @override
  Future<List<ChapterModel>> getChapters() async {
    final response = await client.get(url: '$URL_HOST/capters');

    if (response.statusCode == 200) {
      final List<ChapterModel> chapters = [];
      final body = jsonDecode(response.body);

      body.map((item) {
        final ChapterModel chapter = ChapterModel.fromMap(item);
        chapters.add(chapter);
      }).toList();

      return chapters;
    } else {
      throw Exception("Não foi possivel fazer a requisição");
    }
  }

  @override
  Future<PointModel> getRandomPoint() async {
    final response = await client.get(url: '${URL_HOST}capters');
    List<PointModel> points = [];

    if (response.statusCode == 200) {
      final List<ChapterModel> chapters = [];
      final body = jsonDecode(response.body);

      body.map((item) {
        final ChapterModel chapter = ChapterModel.fromMap(item);
        chapters.add(chapter);
      }).toList();

      chapters.map((e) => e.points).forEach((element) {
        points += element;
      });

      return points[generateRandomNumber(points.length)];
    } else {
      throw Exception("Não foi possivel fazer a requisição");
    }
  }

  int generateRandomNumber(int maxNumber) {
    Random random = Random();
    int newRandomNumber = random.nextInt(maxNumber + 1);
    return newRandomNumber;
  }
}
