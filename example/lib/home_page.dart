import 'package:flutter/material.dart';
import 'package:the_colors/the_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ColorModel> colors = [];
  var theColors = TheColors();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colors = theColors.getColors();
    colors.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('The Colors'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              colors.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: colors.elementAt(index).color,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              colors.elementAt(index).name,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  )).toList(),
        ));
  }
}
