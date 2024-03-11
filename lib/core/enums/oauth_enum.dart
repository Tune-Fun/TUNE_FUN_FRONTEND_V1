enum OAuthType {
  email('email'),
  google('google'),
  apple('apple'),
  facebook('facebook'),
  ;

  final String type;
  const OAuthType(this.type);
}

extension ConvertOAuth on String {
  OAuthType toOAuthTypeEnum() {
    switch (this) {
      case 'google':
        return OAuthType.google;

      case 'apple':
        return OAuthType.google;

      case 'facebook':
        return OAuthType.facebook;

      default:
        return OAuthType.email;
    }
  }
}
