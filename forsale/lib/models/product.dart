part of 'models.dart';

class Products extends Equatable{
  
  final String productId;
  final String productCategory;
  final String productInfo;
  final String productPrice;
  final String productProfit;
  final String createdAt;
  final String updateAt;

  Products(
    this.productId,
    this.productCategory,
    this.productInfo,
    this.productPrice,
    this.productProfit,
    this.createdAt,
    this.updateAt,
  );

  @override
  List<Object> get props => [
    productId,
    productCategory,
    productInfo,
    productPrice,
    productProfit,
    createdAt,
    updateAt,
  ];

}