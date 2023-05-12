import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

enum PageType {
  focus,
  explore,
  feed,
  setting,
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    DateTime? lastPressedAt;
    return WillPopScope(
      // 防止连续点击两次退出
      onWillPop: () async {
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          lastPressedAt = DateTime.now();
          Loading.toast('Press again to exit');
          return false;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // 导航栏
        bottomNavigationBar: controller.showBottomBar
            ? GetBuilder<MainController>(
                id: 'navigation',
                builder: (controller) {
                  return BuildNavigation(
                    currentIndex: controller.currentIndex,
                    items: [
                      NavigationItemModel(
                        label: LocaleKeys.tabBarFocus.tr,
                        icon: AssetsSvgs.eyeSvg,
                      ),
                      NavigationItemModel(
                        label: LocaleKeys.tabBarAll.tr,
                        icon: AssetsSvgs.navHomeSvg,
                      ),
                      NavigationItemModel(
                        label: LocaleKeys.tabFeed.tr,
                        icon: AssetsSvgs.rssSvg,
                      ),
                      NavigationItemModel(
                        label: LocaleKeys.tabBarSetting.tr,
                        icon: AssetsSvgs.navProfileSvg,
                      ),
                    ],
                    onTap: controller.onJumpToPage, // 切换tab事件
                  );
                },
              )
            : null,
        // 内容页
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            // 加入空页面占位
            PostFocusPage(),
            PostAllPage(),
            FeedListPage(),
            MyIndexPage()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}
