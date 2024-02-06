// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240202114207
// 02/02/2024 11:42
import 'package:flutter/material.dart';

import '../../state_management/states.dart';
import '../content_builder.dart';
import '../widgets/error_building_content.dart';
import '../widgets/loading_content.dart';

/// A mixin that provides a method for building content based on the state of a
/// [StateTemplate] with a specific data type [T].
mixin ContentBuilderMixin<T> {
  /// Builds content based on the state provided.
  ///
  /// Depending on the [StateTemplate] type, this method constructs and returns
  /// different widgets to represent the content.
  ///
  /// [state]: The [StateTemplate] representing the current state.
  ///
  /// [contentBuilder]: A [ContentBuilder] used to construct content based on
  /// the state's data.
  ///
  /// [widget]: A custom widget to be used if [contentBuilder] is not provided.
  ///
  /// Returns a widget representing the constructed content.
  Widget buildContent({
    required StateTemplate<T> state,
    ContentBuilder<T>? contentBuilder,
    Widget? widget,
  }) {
    switch (state) {
      case InitialRequestState():
        return _buildInitialContent();
      case LoadingRequestState():
        return _buildLoadingContent(state.data, contentBuilder, widget);
      case ErrorRequestState():
        return _buildErrorContent();
      default:
        return _buildDefaultContent(state.data, contentBuilder, widget);
    }
  }

  Widget _buildInitialContent() {
    return const LoadingBuildContent();
  }

  Widget _buildErrorContent() {
    return const ErrorBuildingContent();
  }

  Widget _buildDefaultContent(
    T? data,
    ContentBuilder<T>? contentBuilder,
    Widget? widget,
  ) {
    return _buildContent(data, contentBuilder, widget, false);
  }

  Widget _buildLoadingContent(
    T? data,
    ContentBuilder<T>? contentBuilder,
    Widget? widget,
  ) {
    return _buildContent(data, contentBuilder, widget, true);
  }

  Widget _buildContent(
    T? data,
    ContentBuilder<T>? contentBuilder,
    Widget? widget,
    bool isLoading,
  ) {
    if (isLoading) {
      return data != null
          ? (contentBuilder?.build(data: data) ?? widget ?? const Placeholder())
          : const LoadingBuildContent();
    } else {
      return data != null
          ? (contentBuilder?.build(data: data) ?? widget ?? const Placeholder())
          : const ErrorBuildingContent(errorMessage: 'No data available.');
    }
  }
}
