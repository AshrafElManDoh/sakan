import 'package:flutter/material.dart';
import 'package:sakan/features/home/presentation/views/widgets/apartments_list_view.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';

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
              CustomChooseText(text: "The nearest apartment to your University"),
              SizedBox(height: 32),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 16),
          sliver: ApartmentsListView(), 
        ),
      ],
    ),
  );
  }
}
