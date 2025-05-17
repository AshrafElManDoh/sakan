import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakan/constants.dart';

class SearchFieldWithSettingIcon extends StatelessWidget {
  const SearchFieldWithSettingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "City",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(72),
                      borderSide: BorderSide(
                        color: Color(0xffE3E3E7)
                      ),
                    ),enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(72),
                      borderSide: BorderSide(
                        color: Color(0xffE3E3E7)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: ksecondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  FontAwesomeIcons.sliders,
                  color: Colors.white,
                ),
              )
            ],
          );
  }
}