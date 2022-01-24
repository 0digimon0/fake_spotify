import 'package:flutter/material.dart';

class Loader {
  static final Loader appLoader = Loader();
  ValueNotifier<bool> tabbarShowingNotifier = ValueNotifier(false);
  ValueNotifier<bool> audioControlShowingNotifier = ValueNotifier(false);
  ValueNotifier<String> loaderTextNotifier = ValueNotifier('error message');

  void showAudioControl() {
    audioControlShowingNotifier.value = true;
  }

  void hideAudioControl() {
    audioControlShowingNotifier.value = false;
  }

  void showTabbar() {
    tabbarShowingNotifier.value = true;
  }

  void hideTabbar() {
    tabbarShowingNotifier.value = false;
  }

  void setText({required String errorMessage}) {
    loaderTextNotifier.value = errorMessage;
  }

  void setImage() {
    // same as that of setText //
  }
}
