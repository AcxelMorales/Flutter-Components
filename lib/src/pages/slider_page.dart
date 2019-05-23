import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockChek = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imágen',
      divisions: 20,
      onChanged: (_blockChek)
          ? null
          : (valor) {
              setState(() => _valueSlider = valor);
            },
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //   value: _blockChek,
    //   onChanged: (valor) {
    //     setState(() => _blockChek = valor);
    //   },
    // );

    return CheckboxListTile(
      value: _blockChek,
      onChanged: (valor) {
        setState(() => _blockChek = valor);
      },
      title: Text('Bloquear Slider'),
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      value: _blockChek,
      onChanged: (valor) {
        setState(() => _blockChek = valor);
      },
      title: Text('Bloquear Slider'),
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
        image: NetworkImage(
            'https://images.vexels.com/media/users/3/127840/isolated/preview/9cdda3332194ea993d34de42f1e63c96-l--nea-verde-de-android-icon-svg-by-vexels.png'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        width: _valueSlider,
        fit: BoxFit.contain);
  }
}
