import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/constants/assets_constants.dart';
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
  late CharacterFilterEntity _filterEntity;
  late FocusNode _focusNode;
  Timer? _timerRequest;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focusNode = FocusNode();
    _filterEntity = CharacterFilterEntity(
      limit: widget.controller.totalToFetch,
      offset: widget.controller.offset,
    );
    widget.controller.loadCharacters(_filterEntity);
    _scrollController.addListener(() async {
      // var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      // if (_scrollController.position.pixels > nextPageTrigger &&
      var nextPageTrigger = _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels >= nextPageTrigger &&
          !widget.controller.isLoading.value) {
        _filterEntity = _filterEntity.copyWith(
          offset: widget.controller.offset,
        );
        await widget.controller.loadCharacters(_filterEntity);
      }
    });
  }

  @override
  void dispose() {
    _timerRequest?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void handleSearchRequest(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (_timerRequest != null) {
      _timerRequest!.cancel();
    }

    _timerRequest = Timer(duration, callback);
  }

  Future<void> searchCharacters(String value) async =>
      handleSearchRequest(() async {
        _filterEntity = _filterEntity.copyWith(
          nameStartsWith: value,
          offset: 0,
          limit: 10,
        );
        await widget.controller.searchCharacters(_filterEntity);
      });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight = (size.height - kToolbarHeight - 120) / 3;
    double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xFF8F0E00),
                expandedHeight: 150.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    MARVEL_LOGO,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverAppBar(
                floating: false,
                pinned: true,
                toolbarHeight: 80,
                backgroundColor: Colors.black,
                flexibleSpace: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: SearchTextFieldWidget(
                    hintText: 'Search',
                    onChanged: searchCharacters,
                    focusNode: _focusNode,
                  ),
                ),
              ),
              // SliverFillRemaining(
              //   hasScrollBody: true,
              //   fillOverscroll: true,
              //   child: Obx(
              //     () => widget.controller.isFirstLoading.value
              //         ? Center(
              //             child: SpinKitDoubleBounce(
              //               duration: const Duration(milliseconds: 1300),
              //               itemBuilder: (BuildContext context, int index) {
              //                 return DecoratedBox(
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(50),
              //                     color: index.isEven
              //                         ? const Color(0xFFF0141E).withOpacity(0.8)
              //                         : const Color(0xFFF0141E)
              //                             .withOpacity(0.5),
              //                   ),
              //                 );
              //               },
              //             ),
              //           )
              //         : GridView.builder(
              //             controller: _scrollController,
              //             scrollDirection: Axis.vertical,
              //             physics: const BouncingScrollPhysics(),
              //             // physics: const NeverScrollableScrollPhysics(),
              //             // shrinkWrap: true,
              //             shrinkWrap: false,
              //             addRepaintBoundaries: true,
              //             gridDelegate:
              //                 SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               childAspectRatio: (itemWidth / itemHeight),
              //             ),
              //             itemCount: widget.controller.characters.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               final character =
              //                   widget.controller.characters[index];
              //               return CharacterCardWidget(
              //                 character: character,
              //                 onTap: () {
              //                   _focusNode.unfocus();
              //                   Get.toNamed(Routes.details,
              //                       arguments: character);
              //                 },
              //               );
              //             },
              //           ),
              //   ),
              // ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Obx(
                    () => widget.controller.isFirstLoading.value
                        ? Container(
                            alignment: Alignment.center,
                            height: Get.height - 350,
                            child: const LoadingWidget(),
                          )
                        : widget.controller.characters.isEmpty
                            ? Container(
                                alignment: Alignment.center,
                                height: Get.height - 350,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Without connection",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await widget.controller
                                            .loadCharacters(_filterEntity);
                                      },
                                      child: const Text(
                                        "Try again...",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    addRepaintBoundaries: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio:
                                          (itemWidth / itemHeight),
                                    ),
                                    itemCount:
                                        widget.controller.characters.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final character =
                                          widget.controller.characters[index];
                                      return CharacterCardWidget(
                                        character: character,
                                        onTap: () {
                                          _focusNode.unfocus();
                                          Get.toNamed(Routes.details,
                                              arguments: character);
                                        },
                                      );
                                    },
                                  ),
                                  if (widget.controller.isLoading.value)
                                    const LoadingWidget(),
                                ],
                              ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        duration: const Duration(milliseconds: 1300),
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: index.isEven
                  ? const Color(0xFFF0141E).withOpacity(0.8)
                  : const Color(0xFFF0141E).withOpacity(0.5),
            ),
          );
        },
      ),
    );
  }
}
