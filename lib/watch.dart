import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './watch_bloc.dart';

class Watch extends StatefulWidget {
  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  final _bloc = WatchBloc();

  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BlocBuilder(
            bloc: _bloc,
            builder: (context, int snapshot) {
              return Container(
                color: _bloc.active() ? Colors.greenAccent[700] : Colors.red,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "${(snapshot / 1000).floor()}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "${snapshot % 1000}",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 75,
                            height: 75,
                            child: FloatingActionButton(
                              onPressed: () => _bloc.reset(),
                              shape: CircleBorder(
                                  side: BorderSide(
                                      width: 2, color: Colors.white)),
                              child: Icon(
                                Icons.restore,
                                size: 35,
                              ),
                              backgroundColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 75,
                            height: 75,
                            child: FloatingActionButton(
                              onPressed: () => _bloc.start(),
                              shape: CircleBorder(
                                  side: BorderSide(
                                      width: 2, color: Colors.white)),
                              child: Icon(
                                Icons.play_arrow,
                                size: 35,
                              ),
                              backgroundColor: Colors.greenAccent[700],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 75,
                            height: 75,
                            child: FloatingActionButton(
                              onPressed: () => _bloc.pause(),
                              shape: CircleBorder(
                                  side: BorderSide(
                                      width: 2, color: Colors.white)),
                              child: Icon(
                                Icons.pause,
                                size: 35,
                              ),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 30,
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_upward,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
