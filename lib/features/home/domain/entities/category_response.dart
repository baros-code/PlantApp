import 'package:equatable/equatable.dart';

import 'category.dart';
import 'pagination.dart';

class CategoryResponse extends Equatable {
  const CategoryResponse({required this.data, required this.meta});

  final List<Category> data;
  final Pagination meta;

  @override
  List<Object?> get props => [data, meta];
}
