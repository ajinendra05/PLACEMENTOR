import 'package:rive/rive.dart';

class RiveAsset {
  final String artboart, stateMachineName, title, src;
  SMIBool? input;

  RiveAsset(this.src,
      {required this.artboart,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavIcon = [
  RiveAsset('assets/animated-icon.riv',
      artboart: 'HOME', stateMachineName: 'HOME_interactivity', title: 'Home'),
  RiveAsset('assets/animated-icon.riv',
      artboart: 'BELL', stateMachineName: 'BELL_Interactivity', title: 'Bell'),
  RiveAsset('assets/animated-icon.riv',
      artboart: 'CHAT', stateMachineName: 'CHAT_Interactivity', title: 'Chat'),
  RiveAsset('assets/animated-icon.riv',
      artboart: 'USER', stateMachineName: 'USER_Interactivity', title: 'User')
];
