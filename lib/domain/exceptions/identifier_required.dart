class IdentifierRequired implements Exception {
  const IdentifierRequired();
  @override
  String toString() => '必須填寫身分證字號';
}
