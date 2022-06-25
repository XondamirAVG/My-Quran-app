import 'package:flutter/material.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:quranorginapp/screens/audioPlayer_page.dart';
import 'package:quranorginapp/screens/profile_page.dart';
import 'package:quranorginapp/screens/search_page.dart';
import 'package:quranorginapp/service/qurans_service.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class HomePageView extends StatelessWidget {
  int? indTab;
  bool onTab;
  HomePageView({Key? key, this.indTab, required this.onTab}) : super(key: key);
  String save =LocaleKeys.bar_text.tr();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: FutureBuilder(
              future: QuransService.getQurans(),
              builder: (context, AsyncSnapshot snap) {
                if (!snap.hasData) {
                  print(snap.data);
                  return Center(child: CircularProgressIndicator.adaptive());
                } else if (snap.hasError) {
                  return Center(child: Text("Xato"));
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: getHeight(64.0),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getWidth(16.0),
                          ),
                          InkWell(
                            child: CircleAvatar(
                              child: Image.network(
                                  "https://th.bing.com/th/id/R.87268fedb2e00fe4f1f86c13b85173c9?rik=iD71tTbmdyB5gw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_243887.png&ehk=%2bnbZwHeUR367MhgZ3EBB3OC1izT81pse1uNe%2bvi01EA%3d&risl=&pid=ImgRaw&r=0"),
                              radius: getWidth(15.0),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                            },
                          ),
                          SizedBox(
                            width: getWidth(104.0),
                          ),
                          Image.asset("assets/images/QK.png"),
                          SizedBox(
                            width: getWidth(121.67),
                          ),
                          InkWell(
                            child: Icon(Icons.search),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => SearchPage())));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(27.31),
                      ),
                      Container(
                        height: getHeight(40.0),
                        width: getWidth(343.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TabBar(
                              labelColor: Colors.black,
                              indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              tabs:  [
                                Tab(
                                  text: 'Sura',
                                ),
                                Tab(
                                  text: 'Juz',
                                ),
                                Tab(
                                  text: "$save",
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(22.0),
                      ),
                      SizedBox(
                        height: getHeight(560.0),
                        child: TabBarView(children: [
                          ListView.builder(
                              itemCount: snap.data.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    child: Column(
                                  children: [
                                    InkWell(
                                      child: ListTile(
                                        trailing: Text(
                                          "${snap.data.data[index].attributes.name}",
                                          style: TextStyle(
                                            color: Color(0xFFBB9D3E),
                                          ),
                                        ), //dio1+
                                        title: Text(
                                            '${snap.data.data[index].attributes.translate}'), //api
                                        subtitle: Text(
                                          "${snap.data.data[index].attributes.verce}",
                                          style: TextStyle(
                                              color: Colors.grey.shade300),
                                        ), //dio1+
                                        leading: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/images/Vector.png'),
                                            Text('$index'),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    AudiuPlayerPage(
                                                      size: 26.0,
                                                      sizetr: 16.0,
                                                      index1: index,
                                                      onTaped: onTab,
                                                      indTaped: indTab,
                                                    ))));
                                      },
                                    ),
                                  ],
                                ));
                              }),
                          ListView.builder(
                              itemCount: snap.data.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        '${snap.data.data[index].attributes.juz}',
                                        style: TextStyle(fontSize: 16),
                                      ), //api
                                      subtitle: Text(
                                        "${snap.data.data[index].attributes.subjuz}",
                                        style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontSize: 13),
                                      ), //dio1+
                                      leading: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/Vector.png'),
                                          Text('$index'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ));
                              }),
                          onTab == true ? lstbuild(snap, indTab) : conbuild(),
                        ]),
                      )
                    ],
                  );
                }
              })),
    );
  }

  ListView lstbuild(snap, onind) {
    print('${snap.data.data[onind].attributes.namequrantrn}');
    return ListView.builder(
        itemCount: onind + 1,
        itemBuilder: (context, index) {
          return Container(
              child: Column(
            children: [
              ListTile(
                title: Text(
                  '${snap.data.data[onind].attributes.namequrantrn}',
                  style: TextStyle(fontSize: 16),
                ), //api dio+
                leading: Icon(
                  Icons.bookmark,
                  color: Color.fromARGB(255, 106, 81, 0),
                ),
              ),
            ],
          ));
        });
  }

  Center conbuild() {
    return Center(
      child: Text("No Saved"),
    );
  }
}
