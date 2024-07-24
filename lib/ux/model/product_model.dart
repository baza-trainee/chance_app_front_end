import 'package:chance_app/ux/model/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';
@freezed
@HiveType(typeId: HiveTypeId.productModel)
class ProductModel with _$ProductModel {
  factory ProductModel({
    @HiveField(0) @Default("") String title,
    @HiveField(1) @Default("") String id,
    @HiveField(2) @Default("") String description,
    @HiveField(3) @Default("") String price,
    @HiveField(4) @Default(null) DateTime? validity,
    @HiveField(5) @Default(false) bool isRemoved,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}