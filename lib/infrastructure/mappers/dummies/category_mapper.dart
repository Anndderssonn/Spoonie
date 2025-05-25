import 'package:spoonie/config/helpers/helpers.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/infrastructure/models/models.dart';

class CategoryMapper {
  static Category localDummyCategoryToEntity(CategoryDatum category) =>
      Category(
        id: category.id,
        title: category.title,
        color: hexToColor(category.color),
      );
}
