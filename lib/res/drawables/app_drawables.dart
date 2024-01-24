import 'drawables.dart';

class AppDrawables extends Drawables {
  @override
  String get appLogo => "${imageBasePath}appLogo.png";

  @override
  String get logoSmall => "${imageBasePath}logo_small.png";

  @override
  String get loginAnimation => "${jsonBasePath}login_anim.json";

  @override
  String get icGithub => "${iconBasePath}ic_github.png";

  @override
  String get icLinkedIn => "${iconBasePath}ic_linkedin.png";

  @override
  String get icMedium => "${iconBasePath}ic_medium.png";

  @override
  String get imgBgDrawerHeader => "${imageBasePath}nav_header_bg.png";

  @override
  String get okIcon => "${iconBasePath}like_icon.png";

  @override
  String get mapViewImage => "${imageBasePath}map_view.png";
}
