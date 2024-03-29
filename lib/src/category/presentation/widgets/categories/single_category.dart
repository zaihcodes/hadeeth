import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/src/category/domain/entities/category.dart';
import 'package:hadeeth/src/category/presentation/blocs/category_detail/category_detail_bloc.dart';
import 'package:hadeeth/src/category/presentation/screens/category_detail_screen.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CategoryDetailBloc>().add(GetCategoryDetail(
            lang: 'ar', categoryId: category.id, page: '1', perPage: '80'));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(
                      categoryId: category.id,
                      categoryTitle: category.title,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      width: 1),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 14,
                )),
            Expanded(
              child: Text(
                category.title,
                textAlign: TextAlign.end,
                style: GoogleFonts.changa(),
              ),
            ),
          ],
        ),
        // Add more category information as needed
      ),
    );
  }
}
