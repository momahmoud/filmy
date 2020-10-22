import 'package:filmy/presentation/app_localization.dart';
import 'package:flutter/cupertino.dart';

extension StringExtension on String{
  String toIntelliTrim(){
    return this.length > 15 ? '${this.substring(0,15)}...' : this;
  }

  String t(BuildContext context){
    return AppLocalizations.of(context).translate(this);
  }
}