import 'package:flutter/material.dart';
import 'package:quranorginapp/components/url_adaptive.dart';
import 'package:quranorginapp/screens/filter_page.dart';
import 'package:quranorginapp/service/qurans_service.dart';
import 'home_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quranorginapp/models/size_config.dart';

class AudiuPlayerPage extends StatefulWidget {
  double size;
  double sizetr;
  bool onTaped;
  int? indTaped;
  int index1;
  AudiuPlayerPage(
      {Key? key,
      required this.size,
      required this.sizetr,
      required this.index1,
      this.onTaped = false,
      this.indTaped})
      : super(key: key);

  @override
  State<AudiuPlayerPage> createState() => _AudiuPlayerPageState();
}

class _AudiuPlayerPageState extends State<AudiuPlayerPage> {
  IconData btnIcon = Icons.play_arrow;

  String nameaudio = "";
  String currentQuran = "";

  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  bool isPlay = false;

  void playAudio(String url) async {
    if (isPlay && currentQuran != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentQuran = url;
        });
      }
    } else if (!isPlay) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlay = true;
          btnIcon = Icons.play_arrow;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: QuransService.getQurans(),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              print('data');
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (snap.hasError) {
              return Center(child: Text("Xato"));
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: getHeight(60.0),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: getWidth(9.0),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.blue.shade300,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageView(
                                        onTab: widget.onTaped,
                                        indTab: widget.indTaped,
                                      )));
                        },
                      ),
                      SizedBox(
                        width: getWidth(5.0),
                      ),
                      InkWell(
                        child: Text(
                          "Back",
                          style: TextStyle(
                              color: Colors.blue.shade300, fontSize: 17.0),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageView(
                                        indTab: widget.indTaped,
                                        onTab: widget.onTaped,
                                      )));
                        },
                      ),
                      SizedBox(
                        width: getWidth(90.0),
                      ),
                      Text(
                        "${snap.data.data[widget.index1].attributes.translate}",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ), //dio +
                      SizedBox(
                        width: getWidth(77.0),
                      ),
                      InkWell(
                        child: Text(
                          "Filter",
                          style: TextStyle(
                              color: Colors.blue.shade300, fontSize: 17.0),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => FilterPage(
                                        size: widget.size,
                                        sizetr: widget.sizetr,
                                        nameauthor: "Mishari Rashid Al-Afasi",
                                        index1: widget.index1,
                                      ))));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: getHeight(630.0),
                    child: ListView.builder(
                        itemCount: snap.data.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: getWidth(16.0),
                                  ),
                                  Text(
                                    "${snap.data.data[index].attributes.quranname}",
                                    style: TextStyle(
                                      fontSize: widget.size,
                                    ),
                                  ), //dio +
                                ],
                              ),
                              SizedBox(
                                height: getHeight(14.0),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: getWidth(16.0),
                                  ),
                                  Text(
                                    "${snap.data.data[index].attributes.namequrantrn}",
                                    style: TextStyle(fontSize: widget.sizetr),
                                  ) //dio +
                                ],
                              ),
                              SizedBox(
                                height: getHeight(16.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.grey.shade200,
                                  ),
                                  width: getWidth(343.0),
                                  height: getHeight(40.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: getWidth(12.0),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/images/Circle.png"),
                                          Text(
                                            "$index",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: getWidth(180.67),
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.play_circle_outline,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            nameaudio =
                                                '${snap.data.data[index].attributes.translate}'; //dio +
                                          });
                                          playAudio(
                                              "$ipAdress4${snap.data.data[index].attributes.quransaudio.data[widget.index1].attributes.url}"); //dio +//{snap.data.data[index].attributes.quransaudio.data[widget.index1].attributes.url}
                                        },
                                      ),
                                      SizedBox(
                                        width: getWidth(19.35),
                                      ),
                                      Icon(
                                        Icons.share,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: getWidth(21.86),
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.bookmark,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          if (widget.onTaped == false) {
                                            widget.onTaped = true;
                                            widget.indTaped = index;
                                          } else if (widget.onTaped == true) {
                                            widget.onTaped = false;
                                          }
                                          print(
                                            widget.onTaped,
                                          );
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePageView(
                                                        onTab: widget.onTaped,
                                                        indTab: widget.indTaped,
                                                      )));
                                        },
                                      ) //Color(0xFFBB9D3E),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: getHeight(66.0),
                      width: getWidth(343.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.black54.withOpacity(0.5)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: getWidth(16.0),
                          ),
                          Image.asset("assets/images/quranRasm.png"),
                          SizedBox(
                            width: getWidth(8.0),
                          ),
                          Text("$nameaudio"), //dio +
                          SizedBox(
                            width: getWidth(54.0),
                          ),
                          Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: getWidth(22.17),
                          ),
                          InkWell(
                              child: Icon(
                                btnIcon,
                                color: Colors.white,
                              ),
                              onTap: () {
                                if (isPlay) {
                                  audioPlayer.pause();
                                  setState(() {
                                    btnIcon = Icons.pause;
                                    isPlay = false;
                                  });
                                } else {
                                  audioPlayer.resume();
                                  setState(() {
                                    btnIcon = Icons.play_arrow;
                                    isPlay = true;
                                  });
                                }
                              }), //or stop
                          SizedBox(
                            width: getWidth(22.17),
                          ),
                          Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: getWidth(30.7),
                          ),
                          Icon(
                            Icons.cancel_outlined,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
