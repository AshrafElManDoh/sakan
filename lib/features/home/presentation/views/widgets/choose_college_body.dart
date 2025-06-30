import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/home/presentation/views/widgets/colleges_grid_view.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_search_field.dart';
import 'package:sakan/features/home/presentation/views_model/get_colleges_cubit/get_colleges_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ChooseCollegeBody extends StatelessWidget {
  const ChooseCollegeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomChooseText(
            text: "Choose Your Destination City",
          ),
          SizedBox(
            height: 64,
          ),
          CustomSearchField(),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: BlocConsumer<GetCollegesCubit, GetCollegesState>(
              listener: (context, state) {
                if (state is GetCollegesLoading) {
                } else if (state is GetCollegesFailure) {
                  showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.error(message: state.errmsg));
                } else {}
              },
              builder: (context, state) {
                if (state is GetCollegesSuccess) {
                  return CollegesGridView(colleges: state.colleges,);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
