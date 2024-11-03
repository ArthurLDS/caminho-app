import 'package:asp/asp.dart';
import 'package:caminho_app/data/model/point_model.dart';
import 'package:caminho_app/ui/interactor/actions/point_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../interactor/atoms/home_atom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    fetchRandomPoint();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      final PointModel randomPoint = pointState.value;

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(randomPoint.number.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: Text(randomPoint.content,
                                      style: const TextStyle(fontSize: 16))),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CupertinoButton.filled(
                  onPressed: () => fetchRandomPoint(),
                  child: const Text('Gerar ponto'),
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
