import 'package:equatable/equatable.dart';

class DefaultError extends Equatable {
  final String? code;
  final String message;

  DefaultError({this.code, required this.message});
  @override
  bool? get stringify => true;
  @override
  List<Object?> get props => [this.code, this.message];
}
