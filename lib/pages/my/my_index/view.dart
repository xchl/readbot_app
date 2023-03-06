import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/index.dart';

class MyIndexPage extends GetView<MyIndexController> {
  const MyIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: <Widget>[
        // 顶部 APP 导航栏
        _buildAppBar(),
        // My Order
        // 按钮列表
        _buildButtonsList().sliverBox,

        // 注销
        ButtonWidget.primary(
          LocaleKeys.myBtnLogout.tr,
          height: 60,
          onTap: () => controller.onLogout(),
        )
            .padding(
              left: AppSpace.page,
              right: AppSpace.page,
              bottom: AppSpace.listRow * 2,
            )
            .sliverBox,

        // todo

        // TextWidget.body2(
        //   "v ${ConfigService.to.version}",
        // ).alignCenter().paddingBottom(200).sliverBox,
      ],
    );
  }

  // 按钮列表
  Widget _buildButtonsList() {
    return <Widget>[
      // Theme
      ButtonItemWidget(
        title: LocaleKeys.myBtnTheme.tr,
        svgPath: AssetsSvgs.pThemeSvg,
        color: "F89C52".toColor,
        onTap: () => ConfigService.to.switchThemeModel(),
      ),

      // 调试工具
      ButtonItemWidget(
        title: LocaleKeys.myBtnStyles.tr,
        svgPath: AssetsSvgs.pCurrencySvg,
        color: "4971FF".toColor,
        onTap: () => Get.toNamed(RouteNames.stylesStylesIndex),
      ),

      // end
    ].toColumn().card().padding(top: 30.h, bottom: 30.h);
  }

  // 顶部 APP 导航栏
  Widget _buildAppBar() {
    return SliverAppBar(
      // 背景色
      backgroundColor: Colors.transparent,
      // 固定在顶部
      pinned: true,
      // 浮动在顶部
      floating: true,
      // 自动弹性显示
      snap: true,
      // 是否应拉伸以填充过度滚动区域。
      stretch: true,
      // 高度
      expandedHeight: 280.h,
      // 此小组件堆叠在工具栏和选项卡栏后面。其高度将与应用栏的整体高度相同。
      flexibleSpace: FlexibleSpaceBar(
        // // 折叠模式
        // collapseMode: CollapseMode.parallax,
        // // 折叠动画
        // stretchModes: const [
        //   // 模糊
        //   StretchMode.blurBackground,
        //   // 尺寸
        //   StretchMode.zoomBackground,
        //   // 标题动画
        //   StretchMode.fadeTitle,
        // ],
        // 标题
        // title: const TextWidget.navigation(text: "Ducafecat"),
        // 背景
        background: <Widget>[
          // 背景图
          <Widget>[
            IconWidget.svg(
              AssetsSvgs.profileHeaderBackgroundSvg,
              color: AppColors.primaryContainer,
              fit: BoxFit.cover,
            ).expanded(),
            // const ImageWidget.(
            //   AssetsImages.profileBackgroundPng,
            //   fit: BoxFit.cover,
            // ).expanded(),
          ].toColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),

          // 内容
          <Widget>[
            // 用户信息
            <Widget>[
              // 头像
              ImageWidget.url(
                // 测试需要改成自定义头像
                "https://c-ssl.duitang.com/uploads/blog/202105/09/20210509012315_89541.jpeg",
                width: 100.w,
                height: 100.w,
                fit: BoxFit.fill,
                radius: 50.w,
              ).paddingRight(AppSpace.listItem),

              // 称呼
              TextWidget.title1(
                "${UserService.to.profile.basicProfile!.username}",
                color: AppColors.primary,
                size: 26.sp,
              ),
            ].toRow().paddingHorizontal(AppSpace.card),

            // 功能栏位
            <Widget>[
              // 1
              BarItemWidget(
                title: LocaleKeys.myBtnLogout.tr,
                svgPath: AssetsSvgs.iLikeSvg,
              ),
              // 2
              BarItemWidget(
                title: LocaleKeys.myBtnLogout.tr,
                svgPath: AssetsSvgs.iAddFriendSvg,
              ),
              // 3
              BarItemWidget(
                title: LocaleKeys.myBtnLogout.tr,
                svgPath: AssetsSvgs.iCouponSvg,
              ),
            ]
                .toRow(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                )
                .paddingAll(AppSpace.card)
                .card()
                .paddingHorizontal(AppSpace.page),
          ].toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ].toStack(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyIndexController>(
      init: Get.find<MyIndexController>(),
      id: "my_index",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }
}
