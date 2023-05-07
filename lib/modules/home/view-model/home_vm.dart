import 'dart:async';
import 'package:design_test/core/model/category_icon_model.dart';
import 'package:design_test/shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../core/base/base_vm.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({this.context});
  BuildContext? context;

  @override
  FutureOr<void> init() {
    collapsedTitle = '';
  }

  late String collapsedTitle;
  TextEditingController searchController = TextEditingController();

  int _currentPage = 0;
  int get currentPage => _currentPage;

  bool _likeState = false;
  bool? get likeState => _likeState;

  int _currentCategoryPage = 0;
  int get currentCategoryPage => _currentCategoryPage;

  String? _selectedImage;
  String? get selectedImage => _selectedImage;

  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  String? _selectedItem;
  String? get selectedItem => _selectedItem;

  final List<String> images = [
    ImageAssets.banner_three,
    ImageAssets.banner_one,
    ImageAssets.banner_two
  ];

  final List<AboutContent> body = [
    AboutContent(
        headerText: 'Brand:',
        body: 'chArmkpR',
        headerText2: 'Color:',
        body2: 'Aprikot'),
    AboutContent(
        headerText: 'Category:',
        body: 'Casual Shirt',
        headerText2: 'Material:',
        body2: 'Polyester'),
    AboutContent(
        headerText: 'Condition:',
        body: 'New',
        headerText2: 'Heavy:',
        body2: '200 g'),
  ];

  List<String> dropdownList = ['Popular', 'All', 'Recent'];

  final List<BannerImages> banners = [
    BannerImages(
        images: ImageAssets.banner_three,
        hashTag: '#FASHION DAY',
        headerText: '80% OFF',
        body: 'Discover fashion that suits to\nyour style'),
    BannerImages(
        images: ImageAssets.banner_two,
        hashTag: '#WOMEN DAY',
        headerText: '80% OFF',
        body: 'Discover fashion that suits to\nyour style'),
    BannerImages(
        images: ImageAssets.banner_three,
        hashTag: '#FASHION DAY',
        headerText: '80% OFF',
        body: 'Discover fashion that suits to\nyour style'),
  ];

  final List<CategoryPlaceHolders> categoryIcon = [
    CategoryPlaceHolders(icon: SvgAssets.wallet, iconPlaceHolder: 'Category'),
    CategoryPlaceHolders(icon: SvgAssets.voucher, iconPlaceHolder: 'Flight'),
    CategoryPlaceHolders(icon: SvgAssets.wallet, iconPlaceHolder: 'Bill'),
    CategoryPlaceHolders(icon: SvgAssets.wallet, iconPlaceHolder: 'Data plan'),
    CategoryPlaceHolders(icon: SvgAssets.wallet, iconPlaceHolder: 'Top up'),
  ];

  final List<DetailImageView> imageDetail = [
    DetailImageView(
      actualImage: ImageAssets.product_one_detail,
      previewImage: ImageAssets.product_one,
    ),
    DetailImageView(
      actualImage: ImageAssets.product_two_detail,
      previewImage: ImageAssets.product_two,
    ),
    DetailImageView(
      actualImage: ImageAssets.product_one_detail,
      previewImage: ImageAssets.product_one,
    ),
    DetailImageView(
      actualImage: ImageAssets.product_two_detail,
      previewImage: ImageAssets.product_two,
    ),
    DetailImageView(
      actualImage: ImageAssets.product_one_detail,
      previewImage: ImageAssets.product_one,
    ),
  ];
  final List<DetailImageView> imageDetails = [
    DetailImageView(
      actualImage: ImageAssets.product_one_detail,
      previewImage: ImageAssets.product_one,
    ),
    DetailImageView(
      actualImage: ImageAssets.product_two_detail,
      previewImage: ImageAssets.product_two,
    ),
    DetailImageView(
      actualImage: ImageAssets.product_one_detail,
      previewImage: ImageAssets.product_one,
    ),
    DetailImageView(
      actualImage: ImageAssets.product_two_detail,
      previewImage: ImageAssets.product_two,
    ),
  ];

  final List<Product> productList = [
    Product(
        image: ImageAssets.product_one,
        category: "Shirt",
        productName:
            "Essential Men's Short-Sleeve Crowneck T-Shirt Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "12.00"),
    Product(
        image: ImageAssets.product_two,
        category: "Shirt",
        productName: "Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "18.00"),
    Product(
        image: ImageAssets.product_one,
        category: "Shirt",
        productName: "Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "12.00"),
    Product(
        image: ImageAssets.product_two,
        category: "Shirt",
        productName: "Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "18.00"),
    Product(
        image: ImageAssets.product_one,
        category: "Shirt",
        productName: "Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "12.00"),
    Product(
        image: ImageAssets.product_two,
        category: "Shirt",
        productName: "Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "18.00"),
    Product(
        image: ImageAssets.product_one,
        category: "Shirt",
        productName: "Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "12.00"),
    Product(
        image: ImageAssets.product_two,
        category: "Shirt",
        productName: "Essential Men's Short-Sleeve Crowneck T-Shirt",
        rating: "4.9",
        numOfLikes: "2345",
        price: "18.00"),
  ];

  getCurrentIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }

  getCurrentCategoryIndex(int index) {
    _currentCategoryPage = index;
    notifyListeners();
  }

  likeProduct() {
    _likeState = !_likeState;
    notifyListeners();
  }

  getSelectedImage(String selectedImage, int index) {
    _selectedImage = selectedImage;
    _selectedIndex = index;
    notifyListeners();
  }

  setDropDownItem(String value) {
    _selectedItem = value;
    notifyListeners();
  }
}
