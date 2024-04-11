import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Language {
  english(flag: '🇬🇧', name: 'English', code: 'en'),
  welsh(flag: '🏴󠁧󠁢󠁷󠁬󠁳󠁿', name: 'Welsh', code: 'cy'),;

  const Language({required this.flag, required this.name, required this.code});

  final String name;
  final String code;
  final String flag;
}

final languageProvider = StateProvider<Language>((ref) => Language.english);