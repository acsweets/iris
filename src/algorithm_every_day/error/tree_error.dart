
class CustomError extends Error {
  final String message;
  @pragma("vm:entry-point")
  CustomError(this.message);
  @override
  String toString() => "CustomError: $message";
}


