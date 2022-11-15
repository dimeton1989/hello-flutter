class NameRequired implements Exception {
  const NameRequired();
  @override
  String toString() => '必須填寫姓名';
}
