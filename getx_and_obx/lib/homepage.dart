import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './NameModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List NameModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GetX and ObeX"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 500,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(names.length, (index) {
                    return Center(
                      child: SelectedCard(
                        // title: names['title'][index],
                        names: names[index],
                      ),
                    );
                  }),
                )),
            Center(
              child: Text("Getx Tutorial by The Growing Developer"),
            )
          ],
        ),
      ),
    );
  }
}

class SelectedCard extends StatelessWidget {
  const SelectedCard({Key key, this.names}) : super(key: key);
  final NameModel names;
  // const SelectedCard({
  //   Key key,
  //   this.color,
  //   this.title,
  //   this.press,
  // }) : super(key: key);
  // final Color color;
  // final String title;
  // final String press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => names.press));

        Get.to(names.press, arguments: "Hello From The Home Page");
        // Get.toNamed('/navigatePage', arguments: ["The", "Growing Developer"]);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.5,
        color: names.color,
        child: Center(
          child: Text(
            names.title,
            style:
                TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
