class AssetsImagePath {
  AssetsImagePath._();
  static const String imageTayaarAssetsRoot = "assets/tayaar/";
  static const String imageTyasartClinetRoot = "assets/tyasart_clinet/";
  static const String imageTyasartComRoot = "assets/tyasart_com/";

  //!jsonPaTh
  static List<String> get getTayaarImages =>
      List.generate(7, (index) => _getTayaarImgePath("${index + 1}"));
  static List<String> get getTyasartClinetImages =>
      List.generate(9, (index) => _getTyasartClinetImgePath("${index + 1}"));
  static List<String> get getTyasartComImages =>
      List.generate(9, (index) => _getTyasartComImgePath("${index + 1}"));

  static String _getTayaarImgePath(String fileName) {
    return "$imageTayaarAssetsRoot$fileName.svg";
  }

  static String _getTyasartClinetImgePath(String fileName) {
    return "$imageTyasartClinetRoot$fileName.svg";
  }

  static String _getTyasartComImgePath(String fileName) {
    return "$imageTyasartComRoot$fileName.svg";
  }
}
