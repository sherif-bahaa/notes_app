part of 'notescupit_cubit.dart';

@immutable
sealed class NotescupitState {}

final class NotescupitInitial extends NotescupitState {}
final class NotescupitSuccess extends NotescupitState {}
