// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swipe_tree_sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$swipeSearchDetailHash() => r'7c44dde061a7b2b497fdc2361c5ec4c3e13c95bd';

/// don't think that this is ideal solution, probaly splitted providers will be better in case if
/// we want to promt user to setup swipe tree. But now to reduce boilerplate approach is used
///
/// Copied from [swipeSearchDetail].
@ProviderFor(swipeSearchDetail)
final swipeSearchDetailProvider = AutoDisposeFutureProvider<
    Tuple2<TreeBranch<String>, List<TaskEntry>>>.internal(
  swipeSearchDetail,
  name: r'swipeSearchDetailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$swipeSearchDetailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SwipeSearchDetailRef
    = AutoDisposeFutureProviderRef<Tuple2<TreeBranch<String>, List<TaskEntry>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
