import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Four Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      /*home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Center(
          child: buildRatings(),
        ),
      ),*/
      home: buildHomePage('Strawberry Pavlova Recipe'),
    );
  }

  ///横向排列 Expanded 扩充 flex:比例int类型1-100最好
  Widget buildRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              flex: 10,
              child: Image.asset(
                'images/long.jpg',
              )),
          Expanded(
              flex: 8,
              child: Image.asset(
                'images/android.jpg',
              )),
          Expanded(
              flex: 6,
              child: Image.asset(
                'images/ufo.jpg',
              )),
          Expanded(
              flex: 4,
              child: Image.asset(
                'images/soldier.jpg',
              )),
        ],
      );

  ///纵向排列
  Widget buildColumn() =>
      // #docregion Column
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Image.asset('images/long.jpg'),
          ),
          Expanded(
            child: Image.asset('images/android.jpg'),
          ),
          Expanded(child: Image.asset('images/ufo.jpg')),
          Expanded(
            child: Image.asset('images/soldier.jpg'),
          )
        ],
      );

  Widget buildStar() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: Icon(
            Icons.star,
            color: Colors.green[500],
          )),
          Expanded(
              child: Icon(
            Icons.star,
            color: Colors.green[500],
          )),
          Expanded(
              child: Icon(
            Icons.star,
            color: Colors.green[500],
          )),
          Expanded(child: Icon(Icons.star, color: Colors.black)),
          Expanded(child: Icon(Icons.star, color: Colors.black)),
        ],
      );

  ///一个界面
  Widget buildRatings() => Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(flex: 10, child: buildStar()),
            Expanded(
              flex: 100,
              child: Text(
                '170 Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      );

  Widget buildHomePage(String title) {
    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );
    final subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
          'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
          'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );

    ///字体大小:18,color:black,height:2
    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.kitchen,
                    color: Colors.green[500],
                  ),
                  Text('PREP:'),
                  Text('25 min'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.green[500],
                  ),
                  Text('COOK:'),
                  Text('1 hr')
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.restaurant,
                    color: Colors.green[500],
                  ),
                  Text('FEEDS:'),
                  Text('4-6'),
                ],
              )
            ],
          ),
        ));

    final leftColumn = ListView(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      children: <Widget>[titleText, subTitle, buildRatings(), iconList],
    );

    final mainImage = Image.asset(
      'images/long.jpg',
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 440,
                      child: leftColumn,
                    )),
                Expanded(flex: 1, child: mainImage)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
