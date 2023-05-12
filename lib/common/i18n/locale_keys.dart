import 'package:flutter/widgets.dart';

/// 多语言 keys
class LocaleKeys {
  // 通用
  static const commonBottomSave = 'common_bottom_save';
  static const commonBottomRemove = 'common_bottom_remove';
  static const commonBottomCancel = 'common_bottom_cancel';
  static const commonBottomConfirm = 'common_bottom_confirm';
  static const commonBottomApply = 'common_bottom_apply';
  static const commonBottomBack = 'common_bottom_back';
  static const commonSearchInput = 'common_search_input';
  static const commonSelectTips = 'common_select_tips';
  static const commonMessageSuccess = 'common_message_success';
  static const commonMessageIncorrect = 'common_message_incorrect';

  // 欢迎页
  static const welcomeOneTitle = 'welcome_one_title';
  static const welcomeOneDesc = 'welcome_one_desc';
  static const welcomeTwoTitle = 'welcome_two_title';
  static const welcomeTwoDesc = 'welcome_two_desc';
  static const welcomeThreeTitle = 'welcome_three_title';
  static const welcomeThreeDesc = 'welcome_three_desc';
  static const welcomeSkip = 'welcome_skip';
  static const welcomeNext = 'welcome_next';
  static const welcomeStart = 'welcome_start';

  // 样式
  static const stylesTitle = 'styles_title';

  // 登录、注册 - 通用
  static const loginForgotPassword = 'login_forgot_password';
  static const loginSignIn = 'login_sign_in';
  static const loginOrText = 'login_or_text';
  static const loginSignUp = 'login_sign_up';
  static const loginEmail = 'login_email';
  static const loginUsername = 'login_username';
  static const loginPassword = 'login_password';

  // 注册 - register user
  static const registerTitle = 'register_title';
  static const registerDesc = 'register_desc';
  static const registerFormName = 'register_form_name';
  static const registerFormEmail = 'register_form_email';
  static const registerFormPhoneNumber = 'register_form_phone_number';
  static const registerFormPassword = 'register_form_password';
  static const registerFormFirstName = 'register_form_first_name';
  static const registerFormLastName = 'register_form_last_name';
  static const registerHaveAccount = 'register_have_account';

  // 验证提示
  static const validatorRequired = 'validator_required';
  static const validatorEmail = 'validator_email';
  static const validatorMin = 'validator_min';
  static const validatorMax = 'validator_max';
  static const validatorPassword = 'validator_password';

  // 注册PIN - register pin
  static const registerPinTitle = 'register_pin_title';
  static const registerEmailPinDesc = 'register_pin_desc';
  static const registerPinFormTip = 'register_pin_form_tip';
  static const registerPinButton = 'register_pin_button';

  // 登录 - back login
  static const loginBackTitle = 'login_back_title';
  static const loginBackDesc = 'login_back_desc';
  static const loginBackFieldEmail = 'login_back_field_email';
  static const loginBackFieldPassword = 'login_back_field_password';

  // APP 主导航
  static const tabBarFocus = 'tab_bar_focus';
  static const tabBarAll = 'tab_bar_all';
  static const tabBarSetting = 'tab_bar_setting';
  static const tabFeed = 'tab_feed';

  // 我的
  static const myBtnLogout = "my_btn_logout";
  static const myBtnLanguage = "my_btn_language";
  static const myBtnTheme = "my_btn_theme";
  static const myBtnStyles = 'my_btn_style';
  static const myBtnManageSource = 'my_btn_manage_source';
  static const myBtnAddSource = 'my_btn_add_source';
  static const myBtnRefresh = 'my_btn_Refresh';
  static const myBtnSourceManager = 'my_btn_source_manager';
  static const myThemePart = 'theme_part';
  static const myServicePart = 'service_part';
  static const myFeedPart = 'feed_part';
  static const myDartTheme = 'dart_theme';
  static const myIsNeedSync = 'is_need_sync';
  static const myAISetting = 'my_ai_setting';
  static const myAISettingEnableAI = 'my_ai_setting_enable_ai';
  static const myAIServiceSelect = 'my_ai_service_select';
  static const myAIServiceApiToken = 'my_ai_service_api_token';
  static const myAIServiceModel = 'my_ai_service_model';
  static const myAIServiceApiTokenAddDesc = 'my_ai_service_api_token_add_desc';
  static const myAIServiceProxyServer = 'my_ai_proxy';
  static const aiSummaryTitle = 'ai_summary_title';
  static const aiLoading = 'ai_loading';
  static const myRuleSetting = 'my_rule_setting';
  static const myLoginBtn = 'my_login_btn';
  static const myDestroyBth = 'my_destroy_btn';
  static const myDestroyAccountInfo = 'my_destroy_info';
  static const myAccountPart = 'my_account_part';
  static const mySystemSetting = 'my_system_setting';
  static const mySystemAutoReadmode = 'my_system_auto_readmode';
  static const mySystemAutoDeleteData = 'my_system_auto_clear_data';
  static const mySystemAutoDeleteDay = 'my_system_auto_delete_day';

  static const pageNotSupportAI = 'page_not_support_ai';
  static const aiServiceNotReady = 'ai_service_not_ready';
  static const pageTooLongNotSupportAI = 'page_too_long_not_support_ai';

  // Feed
  static const feedAddDesc = 'feed_add_desc';
  static const feedTitle = 'feed_title';
  static const addBtn = 'add_btn';
  static const feedAddFromUrl = 'feed_add_from_url';
  static const feedAddFromOpml = 'feed_add_from_opml';
  static const feedAddGroup = 'feed_add_group';
  static const feedDesc = 'feed_desc';
  static const feedAddGroupLabel = 'feed_add_group_label';
  static const feedAddGroupDescptionLabel = 'feed_add_group_desc_label';
  static const feedNoTitle = 'feed_no_title';
  static const focusTitle = 'feed_focus_title';
  static const exploreTitle = 'feed_explore_title';
  static const feedPageTitle = 'feed_page_title';
  static const feedAlreadyExists = 'feed_already_exists';
  static const registerUserAgreement = 'register_user_agreement';
  static const registerUserAgreementError = 'register_user_agreement_error';
  static const unnameFeedGroup = 'unname_feed_group';
  static const feedGroupDelete = 'feed_group_delete';
  static const feedDelete = 'feed_delete';

  // Read
  static const turnToFocusTip = 'turn_to_focus_tip';

  // Error
  static const syncPullError = 'sync_pull_error';
  static const syncPushError = 'sync_push_error';
  static const loginError = 'login_error';
  static const registerError = 'register_error';
  static const destoryAccoutError = 'destory_accout_error';
  static const importFromOpmlError = 'import_from_opml_error';

  // Time
  static const yesterday = 'yesterday';
  static const daysAgo = 'days_ago';
}
