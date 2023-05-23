import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List AssetImages = [
    "assets/pic1.jpg",
    "assets/pic2.jpg",
    "assets/pic3.jpg",
    "assets/pic4.jpg",
    "assets/pic5.jpg",
  ];
  List NetWorkIMages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsqrWiHF6vm_5T5u3bGSzyvD0UHkd9Q5wTwdfMWHWgiaWJvKDXmb2XxWKs-sZLXQW7aw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdCJu8PjDRiRhU0icPaK_m3UU1FmcrDJVmuA&usqp=CAU",
    "https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRvrcBsKSh94yN0Pix3zD50u5wqZ8ZlbmXGw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTccgqMuQoLT1b4JGZnT8cfM2M5e3pmTdrDpg&usqp=CAU"
  ];
  bool scroll = false;
  double Hight = 400;
  double Width = double.infinity;

  List<Widget> AssetImagesWidget() {
    return AssetImages.map((e) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Image(
            fit: BoxFit.cover,
            height: Hight,
            width: Width,
            image: AssetImage(e),
          ));
    }).toList();
  }

  List<Widget> NetworkImagesWidget() {
    return NetWorkIMages.map((e) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Image(
            fit: BoxFit.cover,
            height: Hight,
            width: Width,
            image: NetworkImage(e),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              "GALLERY VIEWER",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  scroll = !scroll;
                  if (scroll == true) {
                    Hight = double.infinity;
                    Width = 300;
                  } else {
                    Width = double.infinity;
                    Hight = 400;
                  }
                });
              },
              child: const Icon(Icons.apps),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: (scroll == true) ? Axis.horizontal : Axis.vertical,
        child: (scroll == true)
            ? Row(
                children: AssetImagesWidget() + NetworkImagesWidget(),
              )
            : Column(
                children: AssetImagesWidget() + NetworkImagesWidget(),
              ),
      ),
    );
  }
}
