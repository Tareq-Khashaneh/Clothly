import 'package:clothly/features/home/data/repositories/category_repo.dart';

import '../models/category_model.dart';

class CategoryPro {
  final CategoryRepo _categoryRepo;

  CategoryPro({required CategoryRepo categoryRepo}) : _categoryRepo = categoryRepo;
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      List categoriesMaps = await _categoryRepo.getAllCategories();
      if (categoriesMaps != []) {
        List<CategoryModel> categories = [];
        for (var cm in categoriesMaps) {
          categories.add(CategoryModel.fromJson(cm));
        }
        return categories;
      }
    } catch (e) {
      print("Error in category pro ${e.toString()}");
    }
    return [];
  }

}