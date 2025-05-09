import 'package:asay_book_app/core/utils/assets_app.dart';
import 'package:asay_book_app/features/home/model/catgory_model.dart';
import 'package:asay_book_app/core/widgets/custm_catgory.dart';

import 'package:flutter/material.dart';

class CatgoryListView extends StatelessWidget {
  const CatgoryListView({super.key});
  final List<CatgoryModel> catgory = const [
    CatgoryModel(icon: AssetsApp.kEducationIcon, title: 'Education'),
    CatgoryModel(icon: AssetsApp.kMedicalIcon, title: 'Medical'),
    CatgoryModel(
        icon: AssetsApp.kComputerScienceIcon, title: 'Computer Science'),
    CatgoryModel(icon: AssetsApp.kGeometricalIcon, title: 'Geometry'),
    CatgoryModel(icon: AssetsApp.kEconomicIcon, title: 'Economic'),
    CatgoryModel(icon: AssetsApp.kHistorycalIcon, title: 'History'),
    CatgoryModel(icon: AssetsApp.kScienceIcon, title: 'Science'),
    CatgoryModel(icon: AssetsApp.kRomanceIcon, title: 'Romance'),
    CatgoryModel(icon: AssetsApp.kScifiIcon, title: 'Science fiction'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .043,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catgory.length,
        itemBuilder: (context, index) {
          return CustomCatgory(model: catgory[index]);
        },
      ),
    );
  }
}
