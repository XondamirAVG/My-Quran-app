import 'package:flutter/material.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:quranorginapp/screens/audioPlayer_page.dart';
import 'package:quranorginapp/screens/authors_page.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class FilterPage extends StatefulWidget {
  double size;
  double sizetr;
  String nameauthor;
  int index1;
  FilterPage(
      {Key? key,
      required this.size,
      required this.sizetr,
      required this.nameauthor,
      required this.index1})
      : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _value = 26.0;
  double _value1 = 16.0;
  bool _value2 = true;
  int group = 1;
  Color color1 = Colors.grey.shade400;
  Color color2 = Colors.blue.shade400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: getHeight(40.0),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(16.0),
              ),
              Text(
                  LocaleKeys.filter_text.tr(),
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getWidth(271.64),
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
            height: getHeight(24.0),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(16.0),
              ),
              Text(
                 "Arabic text size",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 15.0),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(26.0),
          ),
          SfSlider(
            activeColor: Colors.black,
            inactiveColor: Colors.grey.shade400,
            min: 0.0,
            max: 30.0,
            value: _value,
            interval: 5,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (dynamic value) {
              setState(() {
                _value = value;
                widget.size = value;
              });
            },
          ),
          SizedBox(
            height: getHeight(36.0),
          ),
          Row(
            children: [
              Text(
                  LocaleKeys.edit_text.tr(),
                style: TextStyle(color: Colors.grey.shade400, fontSize: 15.0),
              )
            ],
          ),
          SizedBox(
            height: getHeight(26.0),
          ),
          SfSlider(
            activeColor: Colors.black,
            inactiveColor: Colors.grey.shade400,
            min: 0.0,
            max: 30.0,
            value: _value1,
            interval: 5,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (dynamic value) {
              setState(() {
                _value1 = value;
                widget.sizetr = value;
              });
            },
          ),
          SizedBox(
            height: getHeight(42.0),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: getHeight(24.0),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(16.0),
              ),
              Text(
                 LocaleKeys.fil_text.tr(),
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getWidth(23.0),
              ),
              Switch.adaptive(
                value: _value2,
                onChanged: (value) {
                  setState(() {
                    _value2 = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: getHeight(21.67),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(17.67),
              ),
              Radio(
                  value: 1,
                  groupValue: group,
                  onChanged: (int? T) {
                    if (_value2 == false) {
                      print(T);
                      setState(() {
                        group = T!;
                      });
                    } else {
                      group = group;
                    }
                  }),
              SizedBox(
                width: getWidth(9.67),
              ),
              Text(
                """Translation of the
               meanings""",
                style: TextStyle(
                    fontSize: 16.0, color: group == 2 ? color1 : color2),
              ),
              SizedBox(
                width: getWidth(11.67),
              ),
              Radio(
                  value: 2,
                  groupValue: group,
                  onChanged: (int? T) {
                    if (_value2 == false) {
                      print(T);
                      setState(() {
                        group = T!;
                      });
                    } else {
                      group = group;
                    }
                  }),
              SizedBox(
                width: getWidth(9.67),
              ),
              Text(
                "Arabic text size",
                style: TextStyle(
                    fontSize: 16.0, color: group == 1 ? color1 : color2),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(47.67),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: getHeight(24.0),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(16.0),
              ),
              Text(
                LocaleKeys.chance_text.tr(),
                style: TextStyle(color: Colors.grey.shade400, fontSize: 15.0),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(6.0),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(16.0),
              ),
              Text(
                widget.nameauthor,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getWidth(142.22),
              ),
              InkWell(
                child: Icon(Icons.chevron_right_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Authorspage(
                        size: widget.size,
                        sizetr: widget.sizetr,
                        nameauthor: widget.nameauthor,
                        index1: widget.index1,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: getHeight(18.0),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AudiuPlayerPage(
                          index1: widget.index1,
                          size: widget.size,
                          sizetr: widget.sizetr)));
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
