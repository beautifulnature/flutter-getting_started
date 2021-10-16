import 'package:flutter/material.dart';
import 'package:getting_started/data/weather.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('weather')),
        /* body: Column(
        children: [
          ElevatedButton(child: Text('Get data'), onPressed: getData,),
          Text(result.name)
        ]), */
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: txtPlace,
                  decoration: InputDecoration(
                    hintText: 'enter a city',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: getData),
                ))),
              weatherRow('place', result.name),
              weatherRow('description', result.description),
              weatherRow('temp', result.temperature.toStringAsFixed(2)),
              weatherRow('perceived', result.perceived.toStringAsFixed(2)),
              weatherRow('pressure', result.pressure.toString()),
              weatherRow('humidity', result.humidity.toString()),
            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value){
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Text(label, style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).hintColor
          ))
        ),
        Expanded(
          flex: 4,
          child: Text(value, style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor
          ))
        ),
      ]),
    );
    return row;
  }
}
