import '../locale_keys.dart';

/// 多语言 中文
Map<String, String> localeZh = {
  // 通用
  LocaleKeys.commonSearchInput: '输入关键字',
  LocaleKeys.commonBottomSave: '保存',
  LocaleKeys.commonBottomRemove: '删除',
  LocaleKeys.commonBottomCancel: '取消',
  LocaleKeys.commonBottomConfirm: '确认',
  LocaleKeys.commonBottomApply: '修改',
  LocaleKeys.commonBottomBack: '返回',
  LocaleKeys.commonSelectTips: '请选择',
  LocaleKeys.commonMessageSuccess: '@method 成功',
  LocaleKeys.commonMessageIncorrect: '@method 不正确',

  // welcome 欢迎
  LocaleKeys.welcomeOneTitle: '选择您喜欢的产品',
  LocaleKeys.welcomeOneDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeTwoTitle: '完成您的购物',
  LocaleKeys.welcomeTwoDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeThreeTitle: '足不出户的购物体验',
  LocaleKeys.welcomeThreeDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeSkip: '跳过',
  LocaleKeys.welcomeNext: '下一页',
  LocaleKeys.welcomeStart: '立刻开始',

  // 样式
  LocaleKeys.stylesTitle: '样式 && 功能 && 调试',

  // 登录、注册 - 通用
  LocaleKeys.loginForgotPassword: '忘记密码',
  LocaleKeys.loginSignIn: '登 录',
  LocaleKeys.loginSignUp: '注 册',
  LocaleKeys.loginOrText: '- 或者 -',
  LocaleKeys.loginEmail: '电子邮箱',
  LocaleKeys.loginPassword: '密码',
  LocaleKeys.loginUsername: '用户名',

  // 注册 - register user
  LocaleKeys.registerTitle: '欢迎注册',
  LocaleKeys.registerDesc: '注册新账号',
  LocaleKeys.registerFormPhoneNumber: '电话号码',
  LocaleKeys.registerFormFirstName: '姓',
  LocaleKeys.registerFormLastName: '名',
  LocaleKeys.registerHaveAccount: '你有现成账号?',

  // 验证提示
  LocaleKeys.validatorRequired: '字段不能为空',
  LocaleKeys.validatorEmail: '请输入 email 格式',
  LocaleKeys.validatorMin: '长度不能小于 @size',
  LocaleKeys.validatorMax: '长度不能大于 @size',
  LocaleKeys.validatorPassword: '密码长度必须 大于 @min 小于 @max',

  // 注册PIN - register pin
  LocaleKeys.registerPinTitle: '账号验证',
  LocaleKeys.registerEmailPinDesc: '我们已向您的邮箱发送验证码',
  LocaleKeys.registerPinFormTip: '验证码',
  LocaleKeys.registerPinButton: '提交',

  // 登录 - back login
  LocaleKeys.loginBackTitle: '欢迎登录',
  LocaleKeys.loginBackDesc: '登录后继续',

  // APP 导航
  LocaleKeys.tabBarFocus: '聚焦',
  LocaleKeys.tabBarAll: '发现',
  LocaleKeys.tabFeed: '订阅',
  LocaleKeys.tabBarSetting: '设置',

  // 我的
  LocaleKeys.myBtnLogout: '注销',
  LocaleKeys.myBtnLanguage: '语言',
  LocaleKeys.myBtnTheme: '主题',
  LocaleKeys.myBtnStyles: '样式调试',
  LocaleKeys.myBtnManageSource: '管理订阅源',
  LocaleKeys.myBtnAddSource: '添加订阅源',
  LocaleKeys.myBtnRefresh: '刷新Token',
  LocaleKeys.myBtnSourceManager: '订阅源管理',
  LocaleKeys.myThemePart: '外观',
  LocaleKeys.myServicePart: '服务',
  LocaleKeys.myFeedPart: '信息流',
  LocaleKeys.myDartTheme: '夜间模式',
  LocaleKeys.myIsNeedSync: '内容同步',
  LocaleKeys.myAISetting: 'AI服务',
  LocaleKeys.myAISettingEnableAI: '开启AI服务',
  LocaleKeys.myAIServiceSelect: 'AI服务选择',
  LocaleKeys.myAISetttingAutoSummary: '聚焦内容自动摘要',
  LocaleKeys.myAIServiceApiToken: 'API Token',
  LocaleKeys.myAIServiceApiTokenAddDesc: '输入API Token',
  LocaleKeys.myAIServiceModel: '模型',
  LocaleKeys.myAIServiceProxyServer: '代理服务器',
  LocaleKeys.aiSummaryTitle: '摘要',
  LocaleKeys.aiLoading: 'AI服务正在处理中...',
  LocaleKeys.pageNotSupportAI: '暂时无法解析当前页面，不支持AI服务',
  LocaleKeys.aiServiceNotReady: 'AI服务没有配置',
  LocaleKeys.pageTooLongNotSupportAI: '当前页面内容过长，不支持AI服务',
  LocaleKeys.myRuleSetting: '规则管理',
  LocaleKeys.myLoginBtn: '登录',
  LocaleKeys.myDestroyBth: '销毁当前账户',
  LocaleKeys.myDestroyAccountInfo: '如果销毁当前账户，保存在服务器上的所有数据都将被删除。请输入YES并确认',
  LocaleKeys.myAccountPart: '账户',
  LocaleKeys.mySystemPart: '系统',
  LocaleKeys.mySystemAutoReadmode: '自动开启阅读模式',
  LocaleKeys.mySystemAutoDeleteData: '自动删除历史数据',
  LocaleKeys.mySystemAutoDeleteDay: '保留近期数据天数',

  LocaleKeys.myHelpDoc: '帮助文档',

  LocaleKeys.openAI: 'OpenAI',

  //Feed
  LocaleKeys.addBtn: '添加',
  LocaleKeys.feedTitle: '订阅源名称',
  LocaleKeys.feedAddDesc: '把url粘贴在这里',
  LocaleKeys.feedNoTitle: '无标题',
  LocaleKeys.focusTitle: '聚焦',
  LocaleKeys.exploreTitle: '发现',
  LocaleKeys.feedPageTitle: '订阅',
  LocaleKeys.feedDesc: '订阅源描述',
  LocaleKeys.feedAddGroup: '添加分组',
  LocaleKeys.feedAddGroupLabel: '请输入分组名称',
  LocaleKeys.feedAddGroupDescptionLabel: '请输入分组描述，非必须',
  LocaleKeys.feedAddFromUrl: '添加RSS链接',
  LocaleKeys.feedAddFromOpml: '从Opml导入',
  LocaleKeys.feedAlreadyExists: '订阅源已经存在',
  LocaleKeys.registerUserAgreement: '同意用户协议',
  LocaleKeys.registerUserAgreementError: '请同意用户协议',
  LocaleKeys.unnameFeedGroup: '未分组',
  LocaleKeys.feedDelete: '取消订阅',
  LocaleKeys.feedGroupDelete: '删除分组',
  LocaleKeys.addFeedError: '添加订阅源失败',
  LocaleKeys.summaryContent: '主要内容',
  LocaleKeys.groupExistError: '分组已经存在',

  LocaleKeys.inputNotRight: '输入不正确',

  // Read
  LocaleKeys.turnToFocusTip: '聚焦阅读',

  //Error
  LocaleKeys.syncPullError: '从服务器同步内容失败',
  LocaleKeys.syncPushError: '向服务器同步内容失败',
  LocaleKeys.loginError: '登录失败',
  LocaleKeys.registerError: '注册失败',
  LocaleKeys.destoryAccoutError: '销毁账户失败',
  LocaleKeys.importFromOpmlError: '从OPML导入失败',
  LocaleKeys.networkError: '请检查网络是否联通，或给应用网络权限',

  // Time
  LocaleKeys.yesterday: '昨天',
  LocaleKeys.daysAgo: '@day天前',
};
