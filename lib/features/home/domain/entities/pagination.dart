import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  const Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  @override
  List<Object?> get props => [page, pageSize, pageCount, total];
}
