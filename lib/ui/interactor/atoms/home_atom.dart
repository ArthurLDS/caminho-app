import 'dart:ui';

import 'package:asp/asp.dart';
import 'package:caminho_app/data/model/point_model.dart';

final pointState =
    Atom<PointModel>(PointModel(number: 123, content: "Carregando"));
