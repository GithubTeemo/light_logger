String stringify(dynamic exception) {
  if (exception == null) return 'null';
  if (exception is String) return exception;
  try {
    return exception.toString();
  } catch (e) {
    // intentionally left empty.
  }
  return 'Error';
}
