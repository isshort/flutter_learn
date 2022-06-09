part of 'page_view_cubit.dart';

@immutable
class PageViewState extends Equatable {
  final int pageIndex;

  const PageViewState({required this.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}
