import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/feed/feed_list/widgets/muti_level_Option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

enum FeedAddButtonFunc {
  addFromUrl,
  importFromOpml,
}

class FeedListPage extends GetView<FeedListController> {
  const FeedListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: MyMultiLevelOptions(options: controller.feedGroupedByGroup),
    );
  }

  Widget _buildFeedAddFromUrlForm() {
    return Form(
      key: controller.urlFromKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // url
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.url,
          controller: controller.urlController,
          labelText: LocaleKeys.feedAddDesc.tr,
        ).paddingBottom(30),

        // 添加按钮
        ButtonWidget.text(
          LocaleKeys.feedAddBtn.tr,
          onTap: controller.onAddFeed,
        ).paddingBottom(AppSpace.listRow.w),
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(200);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedListController>(
      init: FeedListController(),
      id: "feed_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 44.h,
            backgroundColor: AppColors.background,
            elevation: 0.1,
            title: TextWidget.title1(
              LocaleKeys.feedPageTitle.tr,
              color: AppColors.secondary,
            ),
            actions: [
              PopupMenuButton(
                icon: IconWidget.svg(
                  AssetsSvgs.plusLgSvg,
                  color: AppColors.secondary,
                ).paddingRight(AppSpace.listItem),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: FeedAddButtonFunc.addFromUrl,
                    child: TextWidget.body1(
                      LocaleKeys.feedAddFromUrl.tr,
                      color: AppColors.secondary,
                    ),
                  ),
                  PopupMenuItem(
                    value: FeedAddButtonFunc.importFromOpml,
                    child: TextWidget.body1(
                      LocaleKeys.feedAddFromOpml.tr,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case FeedAddButtonFunc.addFromUrl:
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return _buildFeedAddFromUrlForm();
                          });
                      break;
                    case FeedAddButtonFunc.importFromOpml:
                      controller.onImportFromOpml();
                  }
                },
              )
            ],
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
