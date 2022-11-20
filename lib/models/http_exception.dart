class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  HttpException.firebase(String code)
      : message = _translateFirebaseErrorCode(code);

  static String _translateFirebaseErrorCode(code) {
    switch (code) {
      case 'EMAIL_EXISTS':
        return 'Địa chỉ email đã được sử dụng';
      case 'INVALID_EMAIL':
        return 'Địa chỉ email không hợp lệ';
      case 'WEAK_PASSWORD':
        return 'Mật khẩu quá ngắn';
      case 'EMAIL_NOT_FOUND':
        return 'Email không tồn tại';
      case 'INVALID_PASSWORD':
        return 'Mật khẩu không hợp lệ';
      default:
        return code;
    }
  }

  @override
  String toString() {
    return message;
  }
}
