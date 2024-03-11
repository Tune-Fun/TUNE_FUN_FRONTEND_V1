enum StatusType {
  progress('progress'),
  answered('answered');

  final String type;
  const StatusType(this.type);
}

extension ConvertStatus on String {
  StatusType toStatusTypeEnum() {
    switch (this) {
      case 'progress':
        return StatusType.progress;

      case 'answered':
        return StatusType.answered;

      default:
        return StatusType.progress;
    }
  }
}
