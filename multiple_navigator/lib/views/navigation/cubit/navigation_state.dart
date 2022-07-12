part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final int selectedItem;

  const NavigationState({required this.selectedItem});
  @override
  List<Object?> get props => [selectedItem];
}
