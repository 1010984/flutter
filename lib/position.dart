class Position {
  String image;
  int value;

  Position(this.image, this.value);

  setImage(String image) {
    this.image = image;
  }

  getImage() {
    return this.image;
  }

  setValue(int value) {
    this.value = value;
  }

  getValue() {
    return this.value;
  }
}
