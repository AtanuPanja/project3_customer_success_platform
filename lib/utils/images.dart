// simple class to abstract the image strings, so as to avoid repetition of the same strings, which may cause spelling errors
class AppImages {
  AppImages._();

  static const _assetImage = 'assets/images';

  static const appLogo = '$_assetImage/logo.png';
  static const defaultProfileAvatar =  '$_assetImage/default_profile_32px.png';
}