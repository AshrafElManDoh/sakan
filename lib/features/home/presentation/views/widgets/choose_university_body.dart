import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_search_field.dart';
import 'package:sakan/features/home/presentation/views/widgets/universities_grid_view.dart';
import 'package:sakan/features/home/presentation/views_model/get_universities_cubit/get_universities_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ChooseUniversityBody extends StatelessWidget {
  const ChooseUniversityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomChooseText(text: "Choose the name of your University"),
          SizedBox(
            height: 64,
          ),
          CustomSearchField(
            hintText: "Enter your university",
            onChanged: (value) {
              BlocProvider.of<GetUniversitiesCubit>(context)
                  .filterUniversities(query: value);
            },
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: BlocConsumer<GetUniversitiesCubit, GetUniversitiesState>(
              listener: (context, state) {
                if (state is GetUniversitiesLoading) {
                } else if (state is GetUniversitiesFailure) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(message: state.errmsg),
                  );
                } else if (state is GetUniversitiesSuccess) {}
              },
              builder: (context, state) {
                if (state is GetUniversitiesSuccess) {
                  return UniversitiesGridView(
                    universities: state.universities,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
