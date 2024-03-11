enum ReportType {
  account('account'),
  article('article'),
  none('');

  final String type;
  const ReportType(this.type);
}

extension ConvertReportType on String {
  ReportType toReportTypeEnum() {
    switch (this) {
      case 'account':
        return ReportType.account;

      case 'article':
        return ReportType.article;

      default:
        return ReportType.none;
    }
  }
}
