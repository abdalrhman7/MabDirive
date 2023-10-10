import 'package:flutter/material.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/defult_text_form_field.dart';

class SearchBottomSheet extends StatelessWidget {
  SearchBottomSheet(
      {super.key, required this.scrollController, required this.searchText});
  final ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();
  final String searchText;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            color: ColorHelper.darkColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            defaultTextFormFelid(
                controller: searchController,
                text: searchText,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                fillColor: Colors.white),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                controller: scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
