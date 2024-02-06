// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202095504
// 02/02/2024 09:55
import 'package:equatable/equatable.dart';

/// A generic sealed class representing different states of a request.
///
/// This [StateTemplate] class extends the [Equatable] class, making it easier
/// to compare and identify state changes. It takes a generic type parameter [T]
/// to represent the data associated with each state, which can be nullable.

sealed class StateTemplate<T> extends Equatable {
  /// The data associated with this state. It is nullable.
  final T? data;

  /// Constructs a [StateTemplate] with an optional data parameter.
  const StateTemplate({this.data});

  /// Factory constructor to create an initial state.
  const factory StateTemplate.initial() = InitialRequestState<T>;

  /// Factory constructor to create an initialized state with optional data.
  const factory StateTemplate.initialized({T? data}) =
      InitializedRequestState<T>;

  /// Factory constructor to create a loading state with optional previous data.
  const factory StateTemplate.loading({T? previousData}) =
      LoadingRequestState<T>;

  /// Factory constructor to create a loaded state with required data.
  const factory StateTemplate.loaded({required T? data}) =
      LoadedRequestState<T>;

  /// Factory constructor to create an error state.
  const factory StateTemplate.error() = ErrorRequestState<T>;

  @override
  List<Object?> get props => [data];
}

/// Represents the initial state of a request with generic type [T].
class InitialRequestState<T> extends StateTemplate<T> {
  /// Constructs an [InitialRequestState] representing the initial state.
  const InitialRequestState();
}

/// Represents the initialized state of a request with generic type [T].
class InitializedRequestState<T> extends StateTemplate<T> {
  /// Constructs an [InitializedRequestState] with optional data.
  const InitializedRequestState({super.data});
}

/// Represents the loading state of a request with generic type [T].
class LoadingRequestState<T> extends StateTemplate<T> {
  /// Constructs a [LoadingRequestState] with optional previous data.
  const LoadingRequestState({T? previousData}) : super(data: previousData);
}

/// Represents the loaded state of a request with generic type [T].
class LoadedRequestState<T> extends StateTemplate<T> {
  /// Constructs a [LoadedRequestState] with optional data.
  const LoadedRequestState({super.data});
}

/// Represents the error state of a request with generic type [T].
class ErrorRequestState<T> extends StateTemplate<T> {
  /// Constructs an [ErrorRequestState] representing an error state.
  const ErrorRequestState() : super();
}
