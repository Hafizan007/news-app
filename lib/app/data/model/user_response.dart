import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserResponse extends Equatable {
  final List<Data>? data;
  final Meta? meta;

  const UserResponse({this.data, this.meta});

  factory UserResponse.fromMap(Map<String, dynamic> data) => UserResponse(
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Data.fromMap(e as Map<String, dynamic>))
            .toList(),
        meta: data['meta'] == null
            ? null
            : Meta.fromMap(data['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
        'meta': meta?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserResponse].
  factory UserResponse.fromJson(String data) {
    return UserResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  UserResponse copyWith({
    List<Data>? data,
    Meta? meta,
  }) {
    return UserResponse(
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, meta];
}

class Pagination extends Equatable {
  final int? total;
  final int? pages;
  final int? page;
  final int? limit;

  const Pagination({this.total, this.pages, this.page, this.limit});

  factory Pagination.fromMap(Map<String, dynamic> data) => Pagination(
        total: data['total'] as int?,
        pages: data['pages'] as int?,
        page: data['page'] as int?,
        limit: data['limit'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'pages': pages,
        'page': page,
        'limit': limit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pagination].
  factory Pagination.fromJson(String data) {
    return Pagination.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pagination] to a JSON string.
  String toJson() => json.encode(toMap());

  Pagination copyWith({
    int? total,
    int? pages,
    int? page,
    int? limit,
  }) {
    return Pagination(
      total: total ?? this.total,
      pages: pages ?? this.pages,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [total, pages, page, limit];
}

class Meta extends Equatable {
  final Pagination? pagination;

  const Meta({this.pagination});

  factory Meta.fromMap(Map<String, dynamic> data) => Meta(
        pagination: data['pagination'] == null
            ? null
            : Pagination.fromMap(data['pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'pagination': pagination?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meta].
  factory Meta.fromJson(String data) {
    return Meta.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Meta] to a JSON string.
  String toJson() => json.encode(toMap());

  Meta copyWith({
    Pagination? pagination,
  }) {
    return Meta(
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [pagination];
}

class Data extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? gender;
  final String? status;

  const Data({this.id, this.name, this.email, this.gender, this.status});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        id: data['id'] as int?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        gender: data['gender'] as String?,
        status: data['status'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'gender': gender,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    int? id,
    String? name,
    String? email,
    String? gender,
    String? status,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, email, gender, status];
}
