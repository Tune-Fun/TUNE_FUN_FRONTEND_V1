enum OAuthType {
  email('email'),
  google('google'),
  apple('apple'),
  instagram('instagram'),
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

      case 'instagram':
        return OAuthType.instagram;

      default:
        return OAuthType.email;
    }
  }
}
