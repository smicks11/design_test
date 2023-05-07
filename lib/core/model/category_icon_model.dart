class CategoryPlaceHolders {
  final String icon;
  final String iconPlaceHolder;

  CategoryPlaceHolders({required this.icon, required this.iconPlaceHolder});
}

class DetailImageView {
  final String previewImage;
  final String actualImage;

  DetailImageView({required this.previewImage, required this.actualImage});
}

class AboutContent {
  final String headerText;
  final String body;
  final String headerText2;
  final String body2;

  AboutContent(
      {required this.headerText2,
      required this.body2,
      required this.headerText,
      required this.body});
}

class BannerImages {
  final String images;
  final String hashTag;
  final String headerText;
  final String body;

  BannerImages(
      {required this.images,
      required this.hashTag,
      required this.headerText,
      required this.body});
}

class Product {
  final String image;
  final String category;
  final String productName;
  final String rating;
  final String numOfLikes;
  final String price;
  final bool likeStatus;

  Product(
      {required this.image,
      required this.category,
      required this.productName,
      required this.rating,
      required this.numOfLikes,
      required this.likeStatus,
      required this.price});
}
