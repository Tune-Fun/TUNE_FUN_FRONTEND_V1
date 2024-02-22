enum SocialLoginType {
  google('google'),
  apple('apple'),
  facebook('facebook'),
  ;

  final String type;
  const SocialLoginType(this.type);
}

extension ConvertTweet on String {
  SocialLoginType toNotificationTypeEnum() {
    switch (this) {
      case 'google':
        return SocialLoginType.google;

      case 'apple':
        return SocialLoginType.apple;

      case 'facebook':
        return SocialLoginType.facebook;

      default:
        return SocialLoginType.google;
    }
  }
}
