import '../locale_keys.dart';

/// 多语言 英文
Map<String, String> localeEn = {
  // 通用
  LocaleKeys.commonSearchInput: 'Enter keyword',
  LocaleKeys.commonBottomSave: 'Save',
  LocaleKeys.commonBottomRemove: 'Remove',
  LocaleKeys.commonBottomCancel: 'Cancel',
  LocaleKeys.commonBottomConfirm: 'Confirm',
  LocaleKeys.commonBottomApply: 'Apply',
  LocaleKeys.commonBottomBack: 'Back',
  LocaleKeys.commonSelectTips: 'Please select',
  LocaleKeys.commonMessageSuccess: '@method successfully',
  LocaleKeys.commonMessageIncorrect: '@method incorrect',

  // welcome 欢迎
  LocaleKeys.welcomeOneTitle: 'Choose Your Desire Product',
  LocaleKeys.welcomeOneDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeTwoTitle: 'Complete your shopping',
  LocaleKeys.welcomeTwoDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeThreeTitle: 'Get product at your door',
  LocaleKeys.welcomeThreeDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeSkip: 'Skip',
  LocaleKeys.welcomeNext: 'Next',
  LocaleKeys.welcomeStart: 'Get Started',

  // 样式
  LocaleKeys.stylesTitle: 'Sytles && Function',

  // 登录、注册 - 通用
  LocaleKeys.loginForgotPassword: 'Forgot Password?',
  LocaleKeys.loginSignIn: 'Sign In',
  LocaleKeys.loginSignUp: 'Sign Up',
  LocaleKeys.loginOrText: '- OR -',
  LocaleKeys.loginEmail: 'Email',
  LocaleKeys.loginPassword: 'Password',
  LocaleKeys.loginUsername: 'Username',

  // 注册 - new user
  LocaleKeys.registerTitle: 'Register',
  LocaleKeys.registerDesc: 'Sign up to continue',
  LocaleKeys.registerFormName: 'User Name',
  LocaleKeys.registerFormEmail: 'Email',
  LocaleKeys.registerFormPhoneNumber: 'Phone number',
  LocaleKeys.registerFormPassword: 'Password',
  LocaleKeys.registerFormFirstName: 'First name',
  LocaleKeys.registerFormLastName: 'Last name',
  LocaleKeys.registerHaveAccount: 'Already have an account?',

  // 验证提示
  LocaleKeys.validatorRequired: 'The field is obligatory',
  LocaleKeys.validatorEmail: 'The field must be an email',
  LocaleKeys.validatorMin: 'Length cannot be less than @size',
  LocaleKeys.validatorMax: 'Length cannot be greater than @size',
  LocaleKeys.validatorPassword:
      'password must have between @min and @max digits',

  // 注册PIN - register pin
  LocaleKeys.registerPinTitle: 'Verification',
  LocaleKeys.registerEmailPinDesc:
      'we will send you a Pin to continue your account',
  LocaleKeys.registerPinFormTip: 'Pin',
  LocaleKeys.registerPinButton: 'Submit',
  LocaleKeys.registerError: 'Register Error',
  LocaleKeys.groupExistError: 'Group already exist',

  // 登录 - back login
  LocaleKeys.loginBackTitle: 'Welcome login!',
  LocaleKeys.loginBackDesc: 'Sign in to continue',
  LocaleKeys.loginBackFieldEmail: 'Name',
  LocaleKeys.loginBackFieldPassword: 'Password',

  // APP 导航
  LocaleKeys.tabBarFocus: 'Focus',
  LocaleKeys.tabBarAll: 'Explore',
  LocaleKeys.tabBarSetting: 'Setting',
  LocaleKeys.tabFeed: 'Source',

  // 我的
  LocaleKeys.myBtnLogout: 'Logout',
  LocaleKeys.myBtnLanguage: 'Language',
  LocaleKeys.myBtnTheme: 'Theme',
  LocaleKeys.myBtnStyles: 'Styles',
  LocaleKeys.myBtnManageSource: 'Manage Feed',
  LocaleKeys.myBtnAddSource: 'Add Feed',
  LocaleKeys.myBtnRefresh: 'Refresh Token',
  LocaleKeys.myBtnSourceManager: 'Feed Manage',
  LocaleKeys.myThemePart: 'Style',
  LocaleKeys.myServicePart: 'Service',
  LocaleKeys.myFeedPart: 'RSS',
  LocaleKeys.myDartTheme: 'Dart Mode',
  LocaleKeys.myIsNeedSync: 'Content Sync',
  LocaleKeys.myAISetting: 'AI Service',
  LocaleKeys.myAISetttingAutoSummary: 'Auto Summary Focus Content',
  LocaleKeys.myAISettingEnableAI: 'Enable AI Service',
  LocaleKeys.myAIServiceSelect: 'Select AI Service',
  LocaleKeys.myAIServiceApiToken: 'API Token',
  LocaleKeys.myAIServiceProxyServer: 'Proxy Server',
  LocaleKeys.myAIServiceApiTokenAddDesc: 'Input API Token',
  LocaleKeys.myAIServiceModel: 'Model',
  LocaleKeys.aiSummaryTitle: 'Summary',
  LocaleKeys.aiLoading: 'Analyzing...',
  LocaleKeys.myRuleSetting: 'Rule Setting',
  LocaleKeys.myLoginBtn: 'Login',
  LocaleKeys.myDestroyBth: 'Destroy account',
  LocaleKeys.myDestroyAccountInfo:
      'If you destroy your current account, all information will be deleted and cannot be restored. Please input YES and confirm',
  LocaleKeys.myAccountPart: 'Account',
  LocaleKeys.mySystemPart: 'System',
  LocaleKeys.mySystemAutoReadmode: 'Auto Open Read Mode',
  LocaleKeys.mySystemAutoDeleteData: 'Auto Deleta History Feed',
  LocaleKeys.mySystemAutoDeleteDay: 'Only Save Data in Recent Days',

  LocaleKeys.myHelpDoc: 'Help Doc',

  LocaleKeys.pageNotSupportAI: 'This page does not support AI service',
  LocaleKeys.aiServiceNotReady: 'AI service need to be configured first',
  LocaleKeys.pageTooLongNotSupportAI:
      'This page is too long, not supported by AI',

  LocaleKeys.openAI: 'OpenAI',

  // Feed
  LocaleKeys.addBtn: 'Add',
  LocaleKeys.feedTitle: 'Feed Name',
  LocaleKeys.feedAddDesc: 'Paste feed url here',
  LocaleKeys.feedNoTitle: 'Unkonwn Title',
  LocaleKeys.focusTitle: 'Focus',
  LocaleKeys.feedDesc: 'Feed Description',
  LocaleKeys.exploreTitle: 'Explore',
  LocaleKeys.feedAddGroup: 'Add Group',
  LocaleKeys.feedAddGroupLabel: 'Input Group Name',
  LocaleKeys.feedAddGroupDescptionLabel: 'Input Group Description, optional',
  LocaleKeys.feedPageTitle: 'Source',
  LocaleKeys.feedAddFromUrl: 'RSS Url',
  LocaleKeys.feedAddFromOpml: 'Import Opml',
  LocaleKeys.feedAlreadyExists: 'Feed already exists',
  LocaleKeys.feedDelete: 'Not Subscribe',
  LocaleKeys.feedGroupDelete: 'Delete Group',

  LocaleKeys.registerUserAgreement: 'Agree user agreement',
  LocaleKeys.registerUserAgreementError: 'Please confirm the user agreement',
  LocaleKeys.unnameFeedGroup: 'Not Group',
  LocaleKeys.addFeedError: 'Add Feed Failed',
  LocaleKeys.summaryContent: 'Summary',

  LocaleKeys.inputNotRight: 'Please input right content',

  // Read
  LocaleKeys.turnToFocusTip: 'Focus Read',

  // Error
  LocaleKeys.syncPullError: 'Error occurs when pull content from server',
  LocaleKeys.syncPushError: 'Error occurs when push content to server',
  LocaleKeys.loginError: 'Error occurs when login',
  LocaleKeys.destoryAccoutError: 'Error occurs when destory account',
  LocaleKeys.importFromOpmlError: 'Error occurs when import from opml',

  // time
  LocaleKeys.yesterday: 'Yesterday',
  LocaleKeys.daysAgo: '@day days ago',
};
