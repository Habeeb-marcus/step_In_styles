import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_in_style/core/language/language.dart';

class LangageRepository {
  final Ref ref;

  LangageRepository(this.ref);

  static const String langaugeKeyCode = 'langauge_code';

  Future<void> setLanguage(Language languageCode) async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    await pref.setString(langaugeKeyCode, languageCode.code);
    ref.read(languageProvider.notifier).update((_) => languageCode);
  }


  Future <Language> getLanguage() async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    final languageCode = pref.getString(langaugeKeyCode);
    for (var language in Language.values) {
      if (language.code == languageCode) {
        return language;
      }
    }
    return Language.english;
  }


}


final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final languageRepositoryProvider = Provider<LangageRepository>((ref) {
  return LangageRepository(ref);
});