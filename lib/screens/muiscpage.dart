import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_player/main.dart';

class MusicPage extends StatefulWidget {
  final String music_name;
  final String music_title;
  final String music_img;
  final bool a;
  MusicPage(
      {super.key,
      required this.music_name,
      required this.music_img,
      required this.music_title,
      required this.a});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  AudioPlayer _player = AudioPlayer();

  Icon _icon = Icon(Icons.play_arrow);

  bool x = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _player.pause();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor:
            widget.a ? Color(0xFF1f1545) : Color.fromARGB(255, 155, 255, 151),
      ),
      backgroundColor:
          widget.a ? Color(0xFF1f1545) : Color.fromARGB(255, 155, 255, 151),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(widget.music_img),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              widget.music_title,
              style: TextStyle(
                  color: widget.a ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                iconSize: 50,
                onPressed: () {
                  setState(() {
                    if (x) {
                      x = false;
                      _player.pause();
                      _icon = Icon(Icons.play_arrow);
                    } else {
                      x = true;
                      _player.play(AssetSource("musics/${widget.music_name}"));
                      _icon = Icon(Icons.pause);
                    }
                  });
                },
                icon: _icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
