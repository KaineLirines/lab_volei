import 'package:flutter/material.dart';
final class Messages {
  static void showError(String message, BuildContext context){
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message:message),
    );
  }
  static void showInfo(String message, BuildContext context){
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message:message),
    );
  }
  static void showSuccess(String message, BuildContext context){
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message:message),
    );
  }
}

// mixin de controle -- Para notificar
mixin MessageStateMixin {
  final Signal<String?>_errorMessage = signal(null);
  String? get _errorMessage => _errorMessage;
  final Signal<String?>_infoMessage = signal(null);
  String? get _infoMessage => _errorMessage;
  final Signal<String?>_successMessage = signal(null);
  String? get _successMessage => _errorMessage;

  void clearError() => _errorMessage.value = null;
  void clearInfo() => _infoMessage.value = null;
  void clearSuccess() => _successMessage.value = null;

  void showError(String message) {
    untracked(() => clearError());
    _errorMessage.value = message;
  }
  void showInfo(String message) {
      untracked(() => clearInfo());
      _infoMessage.value = message;
    }
  void showSuccess(String message) {
      untracked(() => clearSuccess());
      _successMessage.value = message;
    }

    void clearAllMessages(){
      untracked((){
        clearError();
        clearInfo();
        clearSuccess();
      });
    }

  
}

mixin MessageViewMixin<T extends StatefulWidget> on State<T>{
  void messageListener (MessageStateMixin State){
    effect((){
      switch(state){
        case MessageStateMixin(: final errorMessage?):
          Messages.showError(errorMessage, context);
        case MessageStateMixin(: final infoMessage?):
          Messages.showInfo(infoMessage, context);
        case MessageStateMixin(: final successMessage?):
          Messages.showSuccess(successMessage, context);
      }
    });
  }
}