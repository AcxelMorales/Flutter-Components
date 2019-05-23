import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scroll = ScrollController();

  List<int> _lista = List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scroll.addListener(() {
      if (_scroll.position.pixels - 100 ==
          _scroll.position.maxScrollExtent - 100) {
        // _agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Builder'),
        ),
        body: Stack(children: <Widget>[_crearLista(), _crearLoading()]));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _getPagina1,
      child: ListView.builder(
        controller: _scroll,
        itemCount: _lista.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _lista[index];
          return Container(
            // Se uso por el margin
            child: FadeInImage(
              image:
                  NetworkImage('https://picsum.photos/500/300/?images=$image'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            ),
          );
        },
      ),
    );
  }

  Future<Null> _getPagina1() {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _lista.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i <= 10; i++) {
      _ultimoItem++;
      _lista.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final _duration = new Duration(seconds: 2);
    return new Timer(_duration, _respHttp);
  }

  void _respHttp() {
    _isLoading = false;
    _scroll.animateTo(_scroll.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: new Duration(milliseconds: 250));
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
