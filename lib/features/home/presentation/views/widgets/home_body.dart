import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartments_list_view.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
import 'package:sakan/features/home/presentation/views_model/get_apartments_cubit/get_apartments_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomChooseText(
                    text: "The best apartment for your college"),
                SizedBox(height: 32),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 16),
            sliver: BlocConsumer<GetApartmentsCubit, GetApartmentsState>(
              listener: (context, state) {
                if (state is GetApartmentsFailure) {
                  showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.error(message: state.errmsg));
                }
              },
              builder: (context, state) {
                if (state is GetApartmentsSuccess) {
                  return ApartmentsListView(
                    apartments: state.listOfApartment,
                  );
                } else if (state is GetApartmentsFailure) {
                  return Text("Error");
                } else {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
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
