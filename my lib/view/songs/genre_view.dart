import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'genre_cell.dart';
import '../../view_model/genres_view_model.dart';

class GenreView extends StatefulWidget {
  const GenreView({super.key});

  @override
  State<GenreView> createState() => _GenreViewState();
}

class _GenreViewState extends State<GenreView> {
  final genVM = Get.put(GenresViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.4),
        itemCount: genVM.allList.length,
        itemBuilder: (context, index) {
          var cObj = genVM.allList[index];
          return GenreCell(cObj: cObj, onPressed: () {});
        },
      ),
    );
  }
}
