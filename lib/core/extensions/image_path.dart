extension ImagePath on String {
  String get svg => 'assets/svgs/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get gif => 'assets/images/$this.gif';

  // FOR ICONS
  String get isvg => 'assets/icons/$this.svg';
  String get ipng => 'assets/icons/$this.png';
  String get ijpg => 'assets/icons/$this.jpg';
  String get igif => 'assets/icons/$this.gif';
  /**
   * Usage- Image.asset("home".png);
   */
}