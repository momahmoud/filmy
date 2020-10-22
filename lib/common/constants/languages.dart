import 'package:filmy/common/constants/translation_constants.dart';
import 'package:filmy/domain/entities/language_entity.dart';

class Languages{
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: TranslationConstants.en),
    LanguageEntity(code: 'ar', value: TranslationConstants.ar),
  ];

}