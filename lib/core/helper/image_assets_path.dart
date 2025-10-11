class AssetsImagePath {
  AssetsImagePath._();
  static const String imageTayaarAssetsRoot = "assets/tayaar/";
  static const String imageTrygcAssetsRoot = "assets/trygc/";
  static const String imageEliteAssetsRoot = "assets/elite/";
  static const String imageIkharAssetsRoot = "assets/ikhar/";
  static const String imageLiteAssetsRoot = "assets/lite/";
  static const String imageTyasartClinetRoot = "assets/tyasart_clinet/";
  static const String imageTyasartComRoot = "assets/tyasart_com/";

  //!jsonPaTh
  static List<String> get getTayaarImages =>
      List.generate(7, (index) => _getTayaarImgePath("${index + 1}"));
  static List<String> get getIkharImages =>
      List.generate(7, (index) => _getIkharImgePath("${index + 1}"));
  static List<String> get getTrygcImages =>
      List.generate(7, (index) => _getTrygcImgePath("${index + 1}"));
  static List<String> get getEliteImages =>
      List.generate(7, (index) => _getEliteImgePath("${index + 1}"));
  static List<String> get getLiteImages =>
      List.generate(7, (index) => _getLiteImgePath("${index + 1}"));
  static List<String> get getTyasartClinetImages =>
      List.generate(9, (index) => _getTyasartClinetImgePath(index + 1));
  static List<String> get getTyasartComImages =>
      List.generate(9, (index) => _getTyasartComImgePath(index + 1));

  static String _getIkharImgePath(String fileName) {
    return "$imageIkharAssetsRoot$fileName.png";
  }

  static String _getTayaarImgePath(String fileName) {
    return "$imageTayaarAssetsRoot$fileName.svg";
  }

  static String _getTrygcImgePath(String fileName) {
    return "$imageTrygcAssetsRoot$fileName.svg";
  }

  static String _getEliteImgePath(String fileName) {
    return "$imageEliteAssetsRoot$fileName.svg";
  }

  static String _getLiteImgePath(String fileName) {
    return "$imageLiteAssetsRoot$fileName.svg";
  }

  static String _getTyasartClinetImgePath(int fileName) {
    switch (fileName) {
      case 1:
      case 2:
      case 3:
      case 8:
      case 9:
        return "$imageTyasartClinetRoot$fileName.png";

      default:
        return "$imageTyasartClinetRoot$fileName.svg";
    }
  }

  static String _getTyasartComImgePath(int fileName) {
    switch (fileName) {
      case 1:
      case 2:
      case 3:
        return "$imageTyasartComRoot$fileName.png";

      default:
        return "$imageTyasartComRoot$fileName.svg";
    }
  }
}
