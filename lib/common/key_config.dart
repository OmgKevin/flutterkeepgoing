class Keys{

  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = const bool.fromEnvironment("dart.vm.product");

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';
  
  static const String key_guide = 'key_guide';
  static const String phone = 'phone';
  static const String access_Token = 'accessToken';
  static const String refresh_Token = 'refreshToken';

  static final String userid = "userid";
  static final String authorization = "authorization";
  static final String a = "a";
  
  static final String currentNavHeader = "current_nav_header";
  static final String appName = "app_name";
  static final String account = "account";
  static final String currentThemeType = "current_theme_type";
  static final String backgroundGradient = "background_gradient";
  static final String backgroundChangeWithCard = "background_change_with_card";
  static final String cardChangeWithBackground = "card_change_with_background";
  static final String taskIconBeans = "task_icon_beans";
  static final String themeBeans = "theme_beans";
  static final String currentThemeBean = "current_theme_bean";
  static final String enableInfiniteScroll = "enable_infinite_scroll";
  static final String localAvatarPath = "local_avatar_path";
  static final String netAvatarPath = "net_avatar_path";
  static final String currentAvatarType = "current_avatar_type";
  static final String currentNetPicUrl = "current_net_pic_url";
  static final String currentPosition = "currentPosition";
  static final String currentUserName = "current_user_name";


}