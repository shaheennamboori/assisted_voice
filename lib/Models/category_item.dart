import 'package:hive/hive.dart';

// Include the generated part file
part 'category_item.g.dart';

@HiveType(typeId: 1)
class CategoryItem {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String categoryId;

  CategoryItem(this.id, this.name, this.categoryId);
}
