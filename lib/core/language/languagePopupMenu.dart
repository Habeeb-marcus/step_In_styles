import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/language/language.dart';
import 'package:step_in_style/core/repository/langauge_repository.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';

class LanguagePopupMenu extends ConsumerWidget {
  const LanguagePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return PopupMenuButton<Language>(
        // icon: Icon(Icons.language),
        onSelected: (value) {
          ref.read(languageRepositoryProvider).setLanguage(value);
          // ref.read(languageProvider.notifier).update((_) => value);
        },
        itemBuilder: (BuildContext context) => [
              for (var value in Language.values)
                PopupMenuItem<Language>(
                  value: value,
                  child: Row(
                    children: [
                      Text(value.flag),
                      HSpace.small,
                      Text(value.name),
                    ],
                  ),
                ),
            ],
            // language icon as a child
            child: Text(language.flag, style: TextStyle(fontSize: sizer(true, 20, context)),),
            // child: ,
            );
  }
}
