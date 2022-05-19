import 'dart:io';

const double windowMinWidth = 600;
const double windowMinHeight = 500;

final environment = Platform.environment;
String get home => environment['HOME'] ?? "";
String get config => "$home/.config";

const String autoStartDeskTop = '''[Desktop Entry]
Type=Application
Exec=run_cat &
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=run_cat
comment[en_US]=
comment=
''';
