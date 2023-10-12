# Dart 3.2 Release Notes

## Private Field Promotion
- Private final fields can be promoted through null checks and is tests.
- Fields must be final, private, and not overridden in the library to be eligible.

## Breaking Change: Split Point for Refutable Patterns
- Improved type promotion behavior for if-case statements.
- May cause compile-time errors in dead code.

## Libraries

### dart:async
- Added `broadcast` parameter to `Stream.empty` constructor.

### dart:convert
- **Breaking Change:** Return types of `utf8.encode()` and `Utf8Codec.encode()` changed to `Uint8List`.

### dart:developer
- Deprecated `Service.getIsolateID`.
- Added `getIsolateId` and `getObjectId` methods.

### dart:ffi
- Introduced `NativeCallable.isolateLocal`.
- Added `NativeCallable.keepIsolateAlive`.
- All `NativeCallable` constructors can now accept closures.
- **Breaking Change:** `NativeCallable.nativeFunction` throws an error if called after closing.

### dart:io
- **Breaking Changes:** Headers no longer include trailing whitespace.
- Folded headers now have spaces inserted at fold points.

### dart:isolate
- Added `Isolate.packageConfigSync` and `Isolate.resolvePackageUriSync`.

### dart:js_interop
- **Breaking Changes:** Removed `JSNumber.toDart` in favor of `toDartDouble` and `toDartInt`.
- Removed `Object.toJS` in favor of `Object.toJSBox`.

## Type Parameters in External APIs
- Must be bound to a static interop type or a `dart:js_interop` type.

## Subtyping `dart:js_interop` Types
- `@staticInterop` types can now subtype only `JSObject` and `JSAny`.

## Global Context of `dart:js_interop` and `@staticInterop` APIs
- Updated to use the same global context as non-static interop.

## Breaking Change on Types of `dart:js_interop` External APIs
- Restricted to a set of allowed types.

In conclusion, Dart 3.2 enhances private field promotion and type promotion in refutable patterns. Library updates include changes to `dart:convert` methods, deprecations in `dart:developer`, improvements in `dart:ffi`, and header changes in `dart:io`. Type parameter rules in external APIs and subtyping of `dart:js_interop` types have been modified for better consistency.
