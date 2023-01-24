import 'package:flutter/material.dart';

import "package:music_player/models/models.dart";

void main() {
  // var x = File("xxx.m4a");
  // print(jsonDecode(x.readAsStringSync()));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SearchPage(),
  ));
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModels> main_movie_list = [
    MovieModels("Bloody Mary", "images/3.jpg"),
    MovieModels("Panda", "images/1.jpg"),
    MovieModels("Love Your Voice", "images/2.jpg"),
    MovieModels("bad guy", "images/4.jpg"),
    MovieModels("Close Eyes", "images/5.jpg"),
    MovieModels("Rave", "images/6.jpg"),
    MovieModels("Pepas", "images/7.jpg"),
    MovieModels("The Naxt Episode", "images/8.jpg"),
    MovieModels("Cradles", "images/9.jpg"),
    MovieModels("New Americana", "images/10.jpg"),
    MovieModels("Hislerim", "images/11.jpg"),
    MovieModels("Natural", "images/12.jpg"),
    MovieModels("Asaya", "images/13.jpg"),
    MovieModels("Get Low", "images/14.jpg"),
    MovieModels("Enemy", "images/15.jpg"),
    MovieModels("Blinding Lights", "images/16.jpg"),
    MovieModels("Somebody That I Used To Know", "images/17.jpg"),
  ];

  List<MovieModels> list_display = List.from(main_movie_list);
  void updateList(String value) {
    setState(() {
      list_display = main_movie_list
          .where((element) =>
              element.music_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Color _background = Color(0xFF1f1545);
  Color _TextField = Color(0xff302360);
  bool a = true;
  bool b = true;
  bool c = false;
  String music_name = "";
  Icon _icon = Icon(Icons.nightlight_rounded);
  Color _TextColor = Colors.white;
  Color _IconColor = Colors.white;
  Icon music_icon = Icon(Icons.play_arrow);
  double _height = 0;
  double _width = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _background,
        appBar: AppBar(
          backgroundColor: _background,
          title: Text(
            "Search for your Musics",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: _TextColor),
          ),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.4,
          elevation: 1,
          backgroundColor: _background,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                child: Text(
                  "A",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.width * 0.1,
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                  color: _IconColor,
                  onPressed: () {
                    setState(() {
                      if (a) {
                        _TextField = Colors.white;
                        _background = Color.fromARGB(255, 155, 255, 151);
                        a = false;
                        _icon = Icon(Icons.sunny);
                        _TextColor = Colors.black;

                        _IconColor = Colors.yellow;
                      } else {
                        _background = Color(0xFF1f1545);
                        _TextField = Color(0xff302360);
                        a = true;
                        _icon = Icon(Icons.nightlight);
                        _TextColor = Colors.white;
                        _IconColor = Colors.white;
                      }
                    });
                  },
                  icon: _icon)
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(color: _TextColor),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: _TextField,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none),
                    hintText: "",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.purple),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: list_display.length == 0
                    ? Center(
                        child: Text(
                          "No Results",
                          style: TextStyle(
                              color: _TextColor, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: list_display.length,
                        itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            setState(() {
                              music_name = list_display[index].music_title!;
                              music_icon = Icon(Icons.pause);
                              b = false;
                              c = true;
                              _height =
                                  MediaQuery.of(context).size.height * 0.1;
                            });
                          },
                          title: Text(
                            list_display[index].music_title!,
                            style: TextStyle(
                                color: _TextColor, fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage(list_display[index].music_img!),
                          ),
                        ),
                        //   separatorBuilder: (BuildContext context, int index) =>
                        // const Divider(),
                      ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: _height,
                  width: double.infinity,
                  child: c
                      ? Column(
                          children: [
                            Text(music_name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_back_ios),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (b) {
                                        music_icon = Icon(Icons.pause);
                                        b = false;
                                      } else {
                                        b = true;
                                        music_icon = Icon(Icons.play_arrow);
                                      }
                                    });
                                  },
                                  icon: music_icon,
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ],
                        )
                      : Container())
            ],
          ),
        ),
      ),
    );
  }
}
