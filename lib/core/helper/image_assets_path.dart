class AssetsImagePath {
  AssetsImagePath._();
  static const String imageTayaarAssetsRoot = "assets/tayaar/";

  //!jsonPaTh
  static List<String> get getTayaarImages =>
      List.generate(7, (index) => _getTayaarImgePath("${index + 1}"));

  static String _getTayaarImgePath(String fileName) {
    return "$imageTayaarAssetsRoot$fileName.svg";
  }
}
