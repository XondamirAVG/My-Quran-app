import 'package:flutter/material.dart';
import 'package:quranorginapp/models/size_config.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: getHeight(12.0),
          ),
          Row(
            children: [
              SizedBox(
                width: getWidth(9.0),
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.blue.shade300,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                child: Text(
                 LocaleKeys.bc_text.tr(),
                  style: TextStyle(
                    color: Colors.blue.shade300,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: getWidth(54.0),
              ),
              Text(
                LocaleKeys.srch_text.tr(),
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(18.0),
          ),
          Form(
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                icon: Icon(Icons.search),
                labelText:LocaleKeys.srch_text.tr(),
                suffixIcon: Icon(Icons.mic),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 3, color: Color(0xFFBB9D3E)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
