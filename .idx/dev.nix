{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [
    pkgs.flutter
    pkgs.android-studio
  ];
  idx = {
    extensions = [
      "dart-code.flutter"
      "dart-code.dart-code"
    ];
  };
}
