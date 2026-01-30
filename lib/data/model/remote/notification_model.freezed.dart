// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  bool get hide => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  @JsonKey(name: "book_marked")
  bool get bookMarked => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
    NotificationModel value,
    $Res Function(NotificationModel) then,
  ) = _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call({
    int id,
    String title,
    String body,
    String sender,
    String emoji,
    String type,
    bool read,
    bool hide,
    bool archived,
    @JsonKey(name: "book_marked") bool bookMarked,
    @JsonKey(name: "created_at") String createdAt,
    @JsonKey(name: "updated_at") String updatedAt,
    Map<String, dynamic>? meta,
  });
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? sender = null,
    Object? emoji = null,
    Object? type = null,
    Object? read = null,
    Object? hide = null,
    Object? archived = null,
    Object? bookMarked = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? meta = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            sender: null == sender
                ? _value.sender
                : sender // ignore: cast_nullable_to_non_nullable
                      as String,
            emoji: null == emoji
                ? _value.emoji
                : emoji // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            read: null == read
                ? _value.read
                : read // ignore: cast_nullable_to_non_nullable
                      as bool,
            hide: null == hide
                ? _value.hide
                : hide // ignore: cast_nullable_to_non_nullable
                      as bool,
            archived: null == archived
                ? _value.archived
                : archived // ignore: cast_nullable_to_non_nullable
                      as bool,
            bookMarked: null == bookMarked
                ? _value.bookMarked
                : bookMarked // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(
    _$NotificationModelImpl value,
    $Res Function(_$NotificationModelImpl) then,
  ) = __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String body,
    String sender,
    String emoji,
    String type,
    bool read,
    bool hide,
    bool archived,
    @JsonKey(name: "book_marked") bool bookMarked,
    @JsonKey(name: "created_at") String createdAt,
    @JsonKey(name: "updated_at") String updatedAt,
    Map<String, dynamic>? meta,
  });
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(
    _$NotificationModelImpl _value,
    $Res Function(_$NotificationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? sender = null,
    Object? emoji = null,
    Object? type = null,
    Object? read = null,
    Object? hide = null,
    Object? archived = null,
    Object? bookMarked = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? meta = freezed,
  }) {
    return _then(
      _$NotificationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        sender: null == sender
            ? _value.sender
            : sender // ignore: cast_nullable_to_non_nullable
                  as String,
        emoji: null == emoji
            ? _value.emoji
            : emoji // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        read: null == read
            ? _value.read
            : read // ignore: cast_nullable_to_non_nullable
                  as bool,
        hide: null == hide
            ? _value.hide
            : hide // ignore: cast_nullable_to_non_nullable
                  as bool,
        archived: null == archived
            ? _value.archived
            : archived // ignore: cast_nullable_to_non_nullable
                  as bool,
        bookMarked: null == bookMarked
            ? _value.bookMarked
            : bookMarked // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        meta: freezed == meta
            ? _value._meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  const _$NotificationModelImpl({
    this.id = 0,
    this.title = "",
    this.body = "",
    this.sender = "",
    this.emoji = "",
    this.type = "",
    this.read = false,
    this.hide = false,
    this.archived = false,
    @JsonKey(name: "book_marked") this.bookMarked = false,
    @JsonKey(name: "created_at") this.createdAt = "",
    @JsonKey(name: "updated_at") this.updatedAt = "",
    final Map<String, dynamic>? meta,
  }) : _meta = meta;

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String body;
  @override
  @JsonKey()
  final String sender;
  @override
  @JsonKey()
  final String emoji;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final bool read;
  @override
  @JsonKey()
  final bool hide;
  @override
  @JsonKey()
  final bool archived;
  @override
  @JsonKey(name: "book_marked")
  final bool bookMarked;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  final Map<String, dynamic>? _meta;
  @override
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, sender: $sender, emoji: $emoji, type: $type, read: $read, hide: $hide, archived: $archived, bookMarked: $bookMarked, createdAt: $createdAt, updatedAt: $updatedAt, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.hide, hide) || other.hide == hide) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.bookMarked, bookMarked) ||
                other.bookMarked == bookMarked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    body,
    sender,
    emoji,
    type,
    read,
    hide,
    archived,
    bookMarked,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_meta),
  );

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(this);
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel({
    final int id,
    final String title,
    final String body,
    final String sender,
    final String emoji,
    final String type,
    final bool read,
    final bool hide,
    final bool archived,
    @JsonKey(name: "book_marked") final bool bookMarked,
    @JsonKey(name: "created_at") final String createdAt,
    @JsonKey(name: "updated_at") final String updatedAt,
    final Map<String, dynamic>? meta,
  }) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get sender;
  @override
  String get emoji;
  @override
  String get type;
  @override
  bool get read;
  @override
  bool get hide;
  @override
  bool get archived;
  @override
  @JsonKey(name: "book_marked")
  bool get bookMarked;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  Map<String, dynamic>? get meta;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
