import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartments_list_view.dart';
import 'package:sakan/features/search/presentation/views/widgets/price_section.dart';
import 'package:sakan/features/search/presentation/views/widgets/rooms_and_beds_section.dart';
import 'package:sakan/features/search/presentation/views/widgets/search_field_with_setting_icon.dart';
import 'package:sakan/features/search/presentation/views_model/search_cubit/search_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<SearchCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    SearchFieldWithSettingIcon(),
                    SizedBox(height: 32),
                  ],
                ),
              ),
              if (cubit.showFilters)
                PriceAndRoomsAndPropertySections()
              else if (state is SearchSuccess)
                ApartmentsListView(apartments: state.apartments),
            ],
          ),
        );
      },
    );
  }
}

class PriceAndRoomsAndPropertySections extends StatelessWidget {
  const PriceAndRoomsAndPropertySections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PriceSection(),
          SizedBox(
            height: 16,
          ),
          RoomsAndBedsSection(),
          // SizedBox(
          //   height: 16,
          // ),
          // PropertyFacilitesSection(),
          SizedBox(
            height: 32,
          ),
          Align(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<SearchCubit>(context).toggleFilters();
                BlocProvider.of<SearchCubit>(context).applyFilters();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Text(
                  "Show result",
                  style: AppStyles.stylesSemiBold16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
