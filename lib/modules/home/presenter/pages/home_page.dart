import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_routes.dart';
import '../../domain/entities/character_filter_entity.dart';
import '../controllers/home_controller.dart';
import '../widgets/character_card_widget.dart';
import '../widgets/search_text_field_widget.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late CharacterFilterEntity filterEntity;

  @override
  void initState() {
    super.initState();
    filterEntity = CharacterFilterEntity(
      limit: widget.controller.totalToFetch,
      offset: widget.controller.offset,
    );
    widget.controller.loadCharacters(filterEntity);
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger &&
          !widget.controller.isLoading.value) {
        filterEntity = filterEntity.copyWith(
          offset: widget.controller.offset,
        );
        await widget.controller.loadCharacters(filterEntity);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    double itemHeight = (size.height - kToolbarHeight - 64) / 3;
    double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                child: SearchTextFieldWidget(
                  hintText: 'Search',
                  onChanged: (value) {
                    nameStartsWith
                  },
                ),
              ),
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemCount: widget.controller.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final character = widget.controller.characters[index];
                      return CharacterCardWidget(
                        character: character,
                        onTap: () {
                          Get.toNamed(Routes.details, arguments: character);
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
