class CardModel {
  String imagePath;
  bool isClickable;
  bool isUncovered;

  CardModel({this.imagePath, this.isClickable, this.isUncovered});

  void setImagePath(String path) {
    this.imagePath = path;
  }

  void setIsClickable(bool val) {
    this.isClickable = val;
  }

  void setIsUncovered(bool val) {
    this.isUncovered = val;
  }

  String getImagePath() {
    return this.imagePath;
  }

  bool getIsClickable() {
    return this.isClickable;
  }

  bool getIsUncovered() {
    return this.isUncovered;
  }
}