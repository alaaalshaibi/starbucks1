part of '../../../../../services/import/app_import.dart';

class AlertLang extends StatelessWidget {
  const AlertLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // * title Alert
      title: const Text(
        KeyLang.selectLanguage,
        textAlign: TextAlign.center,
      ).tr(),
      // * body Alert
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: Dimen.xxxlg.h,
        child: Row(
          children: [
            FlagLang(
              title: KeyLang.arabic,
              flag: PathImages.saudi,
              locale: ConfigLanguage.arLocale,
            ),
            FlagLang(
              title: KeyLang.english,
              flag: PathImages.unitedStates,
              locale: ConfigLanguage.enLocale,
            ),
          ],
        ),
      ),
      // * Button
      actions: [
        OutlinedBtn(title: KeyLang.cancel, onTap: () => Navigator.pop(context))
      ],
    );
  }
}
