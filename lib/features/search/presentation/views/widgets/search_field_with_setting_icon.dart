import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/features/search/presentation/views_model/search_cubit/search_cubit.dart';

class SearchFieldWithSettingIcon extends StatelessWidget {
  const SearchFieldWithSettingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              cubit.filteredApartments(value: value);
            },
            decoration: InputDecoration(
              hintText: "Search....",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(72),
                borderSide: BorderSide(color: Color(0xffE3E3E7)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(72),
                borderSide: BorderSide(color: Color(0xffE3E3E7)),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            cubit.toggleFilters();
          },
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: cubit.showFilters ? Colors.transparent : ksecondaryColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: ksecondaryColor,
              ),
            ),
            child: Icon(
              FontAwesomeIcons.sliders,
              color: cubit.showFilters ? ksecondaryColor : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
