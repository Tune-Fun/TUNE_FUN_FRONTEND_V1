enum SNSplatformType {
  instagram('instagram'),
  youtube('youtube'),
  tiktok('tiktok'),
  twitter('twitter'),
  ;

  final String type;
  const SNSplatformType(this.type);
}

extension ConvertPlatform on String {
  SNSplatformType toSNSplatformTypeEnum() {
    switch (this) {
      case 'instagram':
        return SNSplatformType.instagram;

      case 'youtube':
        return SNSplatformType.youtube;

      case 'tiktok':
        return SNSplatformType.tiktok;

      case 'twitter':
        return SNSplatformType.tiktok;

      default:
        return SNSplatformType.instagram;
    }
  }
}
