enum CategoryType {
  publicationvote('publicationvote'),
  participationvoting('participationvoting'),
  payment('payment'),
  account('account'),
  inconvienve('inconvience'),
  etc('etc'),
  none('');

  final String type;
  const CategoryType(this.type);
}

extension ConvertCategory on String {
  CategoryType toCategoryTypeEnum() {
    switch (this) {
      case 'publicationvote':
        return CategoryType.publicationvote;

      case 'participationvoting':
        return CategoryType.participationvoting;
      case 'payment':
        return CategoryType.payment;

      case 'account':
        return CategoryType.account;

      case 'inconvienve':
        return CategoryType.inconvienve;

      case 'etc':
        return CategoryType.etc;

      default:
        return CategoryType.none;
    }
  }
}
