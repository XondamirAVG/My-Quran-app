import 'package:flutter/material.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:quranorginapp/screens/filter_page.dart';
import 'package:quranorginapp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class Authorspage extends StatefulWidget {
  double size;
  double sizetr;
  String nameauthor;
  int index1;
  Authorspage(
      {Key? key,
      required this.size,
      required this.index1,
      required this.sizetr,
      required this.nameauthor})
      : super(key: key);

  @override
  State<Authorspage> createState() => _AuthorspageState();
}

class _AuthorspageState extends State<Authorspage> {
  @override
  int group = 0;

  bool _value2 = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: getHeight(35.0),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(9),
              ),
              InkWell(
                  child: Icon(Icons.arrow_left_outlined),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: getWidth(5.0),
              ),
              InkWell(
                child: Text(
                   LocaleKeys.bc_text.tr(),
                  style: TextStyle(color: Colors.blue.shade400, fontSize: 17.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: getWidth(74.0),
              ),
              Text(
                LocaleKeys.reciters_text.tr(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: getWidth(109.64),
              ),
              InkWell(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: getHeight(35.0),
          ),
          SizedBox(
            height: getHeight(660.0),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: getWidth(17.67),
                          ),
                          Radio(
                              activeColor: Colors.black,
                              value: index,
                              groupValue: group,
                              onChanged: (int? T) {
                                setState(() {
                                  group = T!;
                                });
                              }),
                          SizedBox(
                            width: getWidth(9.67),
                          ),
                          Text(
                            "Mishari Rashid Al-Afasi",
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ) //dio +
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 5.0, bottom: 5.0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ));
                }),
          ),
          SizedBox(
            height: getHeight(3.0),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilterPage(
                            index1: widget.index1,
                            nameauthor: widget.nameauthor,
                            size: widget.size,
                            sizetr: widget.sizetr,
                          )));
            },
            style: ElevatedButton.styleFrom(
              maximumSize: Size(getWidth(343.0), getHeight(50.0)),
              primary: Color(0xFFBB9D3E),
              minimumSize: Size(getWidth(343.0), getHeight(50.0)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
            ),
            child: Text(
              LocaleKeys.sumit_text.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
