// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteMealsTable extends FavoriteMeals
    with TableInfo<$FavoriteMealsTable, FavoriteMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealMeta = const VerificationMeta('meal');
  @override
  late final GeneratedColumn<String> meal = GeneratedColumn<String>(
    'meal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _drinkAlternateMeta = const VerificationMeta(
    'drinkAlternate',
  );
  @override
  late final GeneratedColumn<String> drinkAlternate = GeneratedColumn<String>(
    'drink_alternate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealThumbMeta = const VerificationMeta(
    'mealThumb',
  );
  @override
  late final GeneratedColumn<String> mealThumb = GeneratedColumn<String>(
    'meal_thumb',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _youtubeMeta = const VerificationMeta(
    'youtube',
  );
  @override
  late final GeneratedColumn<String> youtube = GeneratedColumn<String>(
    'youtube',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ingredientsMeta = const VerificationMeta(
    'ingredients',
  );
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    meal,
    drinkAlternate,
    category,
    area,
    instructions,
    mealThumb,
    tags,
    youtube,
    source,
    ingredients,
    categoryId,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteMeal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('meal')) {
      context.handle(
        _mealMeta,
        meal.isAcceptableOrUnknown(data['meal']!, _mealMeta),
      );
    } else if (isInserting) {
      context.missing(_mealMeta);
    }
    if (data.containsKey('drink_alternate')) {
      context.handle(
        _drinkAlternateMeta,
        drinkAlternate.isAcceptableOrUnknown(
          data['drink_alternate']!,
          _drinkAlternateMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instructionsMeta);
    }
    if (data.containsKey('meal_thumb')) {
      context.handle(
        _mealThumbMeta,
        mealThumb.isAcceptableOrUnknown(data['meal_thumb']!, _mealThumbMeta),
      );
    } else if (isInserting) {
      context.missing(_mealThumbMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('youtube')) {
      context.handle(
        _youtubeMeta,
        youtube.isAcceptableOrUnknown(data['youtube']!, _youtubeMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('ingredients')) {
      context.handle(
        _ingredientsMeta,
        ingredients.isAcceptableOrUnknown(
          data['ingredients']!,
          _ingredientsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientsMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteMeal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      meal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal'],
      )!,
      drinkAlternate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drink_alternate'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      )!,
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      mealThumb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_thumb'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      youtube: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}youtube'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      ingredients: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoriteMealsTable createAlias(String alias) {
    return $FavoriteMealsTable(attachedDatabase, alias);
  }
}

class FavoriteMeal extends DataClass implements Insertable<FavoriteMeal> {
  final String id;
  final String meal;
  final String? drinkAlternate;
  final String category;
  final String area;
  final String instructions;
  final String mealThumb;
  final String? tags;
  final String? youtube;
  final String? source;
  final String ingredients;
  final String categoryId;
  final DateTime addedAt;
  const FavoriteMeal({
    required this.id,
    required this.meal,
    this.drinkAlternate,
    required this.category,
    required this.area,
    required this.instructions,
    required this.mealThumb,
    this.tags,
    this.youtube,
    this.source,
    required this.ingredients,
    required this.categoryId,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['meal'] = Variable<String>(meal);
    if (!nullToAbsent || drinkAlternate != null) {
      map['drink_alternate'] = Variable<String>(drinkAlternate);
    }
    map['category'] = Variable<String>(category);
    map['area'] = Variable<String>(area);
    map['instructions'] = Variable<String>(instructions);
    map['meal_thumb'] = Variable<String>(mealThumb);
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || youtube != null) {
      map['youtube'] = Variable<String>(youtube);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    map['ingredients'] = Variable<String>(ingredients);
    map['category_id'] = Variable<String>(categoryId);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoriteMealsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMealsCompanion(
      id: Value(id),
      meal: Value(meal),
      drinkAlternate: drinkAlternate == null && nullToAbsent
          ? const Value.absent()
          : Value(drinkAlternate),
      category: Value(category),
      area: Value(area),
      instructions: Value(instructions),
      mealThumb: Value(mealThumb),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      youtube: youtube == null && nullToAbsent
          ? const Value.absent()
          : Value(youtube),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      ingredients: Value(ingredients),
      categoryId: Value(categoryId),
      addedAt: Value(addedAt),
    );
  }

  factory FavoriteMeal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteMeal(
      id: serializer.fromJson<String>(json['id']),
      meal: serializer.fromJson<String>(json['meal']),
      drinkAlternate: serializer.fromJson<String?>(json['drinkAlternate']),
      category: serializer.fromJson<String>(json['category']),
      area: serializer.fromJson<String>(json['area']),
      instructions: serializer.fromJson<String>(json['instructions']),
      mealThumb: serializer.fromJson<String>(json['mealThumb']),
      tags: serializer.fromJson<String?>(json['tags']),
      youtube: serializer.fromJson<String?>(json['youtube']),
      source: serializer.fromJson<String?>(json['source']),
      ingredients: serializer.fromJson<String>(json['ingredients']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'meal': serializer.toJson<String>(meal),
      'drinkAlternate': serializer.toJson<String?>(drinkAlternate),
      'category': serializer.toJson<String>(category),
      'area': serializer.toJson<String>(area),
      'instructions': serializer.toJson<String>(instructions),
      'mealThumb': serializer.toJson<String>(mealThumb),
      'tags': serializer.toJson<String?>(tags),
      'youtube': serializer.toJson<String?>(youtube),
      'source': serializer.toJson<String?>(source),
      'ingredients': serializer.toJson<String>(ingredients),
      'categoryId': serializer.toJson<String>(categoryId),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  FavoriteMeal copyWith({
    String? id,
    String? meal,
    Value<String?> drinkAlternate = const Value.absent(),
    String? category,
    String? area,
    String? instructions,
    String? mealThumb,
    Value<String?> tags = const Value.absent(),
    Value<String?> youtube = const Value.absent(),
    Value<String?> source = const Value.absent(),
    String? ingredients,
    String? categoryId,
    DateTime? addedAt,
  }) => FavoriteMeal(
    id: id ?? this.id,
    meal: meal ?? this.meal,
    drinkAlternate: drinkAlternate.present
        ? drinkAlternate.value
        : this.drinkAlternate,
    category: category ?? this.category,
    area: area ?? this.area,
    instructions: instructions ?? this.instructions,
    mealThumb: mealThumb ?? this.mealThumb,
    tags: tags.present ? tags.value : this.tags,
    youtube: youtube.present ? youtube.value : this.youtube,
    source: source.present ? source.value : this.source,
    ingredients: ingredients ?? this.ingredients,
    categoryId: categoryId ?? this.categoryId,
    addedAt: addedAt ?? this.addedAt,
  );
  FavoriteMeal copyWithCompanion(FavoriteMealsCompanion data) {
    return FavoriteMeal(
      id: data.id.present ? data.id.value : this.id,
      meal: data.meal.present ? data.meal.value : this.meal,
      drinkAlternate: data.drinkAlternate.present
          ? data.drinkAlternate.value
          : this.drinkAlternate,
      category: data.category.present ? data.category.value : this.category,
      area: data.area.present ? data.area.value : this.area,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      mealThumb: data.mealThumb.present ? data.mealThumb.value : this.mealThumb,
      tags: data.tags.present ? data.tags.value : this.tags,
      youtube: data.youtube.present ? data.youtube.value : this.youtube,
      source: data.source.present ? data.source.value : this.source,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMeal(')
          ..write('id: $id, ')
          ..write('meal: $meal, ')
          ..write('drinkAlternate: $drinkAlternate, ')
          ..write('category: $category, ')
          ..write('area: $area, ')
          ..write('instructions: $instructions, ')
          ..write('mealThumb: $mealThumb, ')
          ..write('tags: $tags, ')
          ..write('youtube: $youtube, ')
          ..write('source: $source, ')
          ..write('ingredients: $ingredients, ')
          ..write('categoryId: $categoryId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    meal,
    drinkAlternate,
    category,
    area,
    instructions,
    mealThumb,
    tags,
    youtube,
    source,
    ingredients,
    categoryId,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMeal &&
          other.id == this.id &&
          other.meal == this.meal &&
          other.drinkAlternate == this.drinkAlternate &&
          other.category == this.category &&
          other.area == this.area &&
          other.instructions == this.instructions &&
          other.mealThumb == this.mealThumb &&
          other.tags == this.tags &&
          other.youtube == this.youtube &&
          other.source == this.source &&
          other.ingredients == this.ingredients &&
          other.categoryId == this.categoryId &&
          other.addedAt == this.addedAt);
}

class FavoriteMealsCompanion extends UpdateCompanion<FavoriteMeal> {
  final Value<String> id;
  final Value<String> meal;
  final Value<String?> drinkAlternate;
  final Value<String> category;
  final Value<String> area;
  final Value<String> instructions;
  final Value<String> mealThumb;
  final Value<String?> tags;
  final Value<String?> youtube;
  final Value<String?> source;
  final Value<String> ingredients;
  final Value<String> categoryId;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const FavoriteMealsCompanion({
    this.id = const Value.absent(),
    this.meal = const Value.absent(),
    this.drinkAlternate = const Value.absent(),
    this.category = const Value.absent(),
    this.area = const Value.absent(),
    this.instructions = const Value.absent(),
    this.mealThumb = const Value.absent(),
    this.tags = const Value.absent(),
    this.youtube = const Value.absent(),
    this.source = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteMealsCompanion.insert({
    required String id,
    required String meal,
    this.drinkAlternate = const Value.absent(),
    required String category,
    required String area,
    required String instructions,
    required String mealThumb,
    this.tags = const Value.absent(),
    this.youtube = const Value.absent(),
    this.source = const Value.absent(),
    required String ingredients,
    required String categoryId,
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       meal = Value(meal),
       category = Value(category),
       area = Value(area),
       instructions = Value(instructions),
       mealThumb = Value(mealThumb),
       ingredients = Value(ingredients),
       categoryId = Value(categoryId);
  static Insertable<FavoriteMeal> custom({
    Expression<String>? id,
    Expression<String>? meal,
    Expression<String>? drinkAlternate,
    Expression<String>? category,
    Expression<String>? area,
    Expression<String>? instructions,
    Expression<String>? mealThumb,
    Expression<String>? tags,
    Expression<String>? youtube,
    Expression<String>? source,
    Expression<String>? ingredients,
    Expression<String>? categoryId,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (meal != null) 'meal': meal,
      if (drinkAlternate != null) 'drink_alternate': drinkAlternate,
      if (category != null) 'category': category,
      if (area != null) 'area': area,
      if (instructions != null) 'instructions': instructions,
      if (mealThumb != null) 'meal_thumb': mealThumb,
      if (tags != null) 'tags': tags,
      if (youtube != null) 'youtube': youtube,
      if (source != null) 'source': source,
      if (ingredients != null) 'ingredients': ingredients,
      if (categoryId != null) 'category_id': categoryId,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteMealsCompanion copyWith({
    Value<String>? id,
    Value<String>? meal,
    Value<String?>? drinkAlternate,
    Value<String>? category,
    Value<String>? area,
    Value<String>? instructions,
    Value<String>? mealThumb,
    Value<String?>? tags,
    Value<String?>? youtube,
    Value<String?>? source,
    Value<String>? ingredients,
    Value<String>? categoryId,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return FavoriteMealsCompanion(
      id: id ?? this.id,
      meal: meal ?? this.meal,
      drinkAlternate: drinkAlternate ?? this.drinkAlternate,
      category: category ?? this.category,
      area: area ?? this.area,
      instructions: instructions ?? this.instructions,
      mealThumb: mealThumb ?? this.mealThumb,
      tags: tags ?? this.tags,
      youtube: youtube ?? this.youtube,
      source: source ?? this.source,
      ingredients: ingredients ?? this.ingredients,
      categoryId: categoryId ?? this.categoryId,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (meal.present) {
      map['meal'] = Variable<String>(meal.value);
    }
    if (drinkAlternate.present) {
      map['drink_alternate'] = Variable<String>(drinkAlternate.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (mealThumb.present) {
      map['meal_thumb'] = Variable<String>(mealThumb.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (youtube.present) {
      map['youtube'] = Variable<String>(youtube.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMealsCompanion(')
          ..write('id: $id, ')
          ..write('meal: $meal, ')
          ..write('drinkAlternate: $drinkAlternate, ')
          ..write('category: $category, ')
          ..write('area: $area, ')
          ..write('instructions: $instructions, ')
          ..write('mealThumb: $mealThumb, ')
          ..write('tags: $tags, ')
          ..write('youtube: $youtube, ')
          ..write('source: $source, ')
          ..write('ingredients: $ingredients, ')
          ..write('categoryId: $categoryId, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteMealsTable favoriteMeals = $FavoriteMealsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteMeals];
}

typedef $$FavoriteMealsTableCreateCompanionBuilder =
    FavoriteMealsCompanion Function({
      required String id,
      required String meal,
      Value<String?> drinkAlternate,
      required String category,
      required String area,
      required String instructions,
      required String mealThumb,
      Value<String?> tags,
      Value<String?> youtube,
      Value<String?> source,
      required String ingredients,
      required String categoryId,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });
typedef $$FavoriteMealsTableUpdateCompanionBuilder =
    FavoriteMealsCompanion Function({
      Value<String> id,
      Value<String> meal,
      Value<String?> drinkAlternate,
      Value<String> category,
      Value<String> area,
      Value<String> instructions,
      Value<String> mealThumb,
      Value<String?> tags,
      Value<String?> youtube,
      Value<String?> source,
      Value<String> ingredients,
      Value<String> categoryId,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

class $$FavoriteMealsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteMealsTable> {
  $$FavoriteMealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meal => $composableBuilder(
    column: $table.meal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get drinkAlternate => $composableBuilder(
    column: $table.drinkAlternate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mealThumb => $composableBuilder(
    column: $table.mealThumb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get youtube => $composableBuilder(
    column: $table.youtube,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteMealsTable> {
  $$FavoriteMealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meal => $composableBuilder(
    column: $table.meal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get drinkAlternate => $composableBuilder(
    column: $table.drinkAlternate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mealThumb => $composableBuilder(
    column: $table.mealThumb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get youtube => $composableBuilder(
    column: $table.youtube,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteMealsTable> {
  $$FavoriteMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get meal =>
      $composableBuilder(column: $table.meal, builder: (column) => column);

  GeneratedColumn<String> get drinkAlternate => $composableBuilder(
    column: $table.drinkAlternate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mealThumb =>
      $composableBuilder(column: $table.mealThumb, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get youtube =>
      $composableBuilder(column: $table.youtube, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoriteMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteMealsTable,
          FavoriteMeal,
          $$FavoriteMealsTableFilterComposer,
          $$FavoriteMealsTableOrderingComposer,
          $$FavoriteMealsTableAnnotationComposer,
          $$FavoriteMealsTableCreateCompanionBuilder,
          $$FavoriteMealsTableUpdateCompanionBuilder,
          (
            FavoriteMeal,
            BaseReferences<_$AppDatabase, $FavoriteMealsTable, FavoriteMeal>,
          ),
          FavoriteMeal,
          PrefetchHooks Function()
        > {
  $$FavoriteMealsTableTableManager(_$AppDatabase db, $FavoriteMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> meal = const Value.absent(),
                Value<String?> drinkAlternate = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> area = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<String> mealThumb = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> youtube = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String> ingredients = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteMealsCompanion(
                id: id,
                meal: meal,
                drinkAlternate: drinkAlternate,
                category: category,
                area: area,
                instructions: instructions,
                mealThumb: mealThumb,
                tags: tags,
                youtube: youtube,
                source: source,
                ingredients: ingredients,
                categoryId: categoryId,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String meal,
                Value<String?> drinkAlternate = const Value.absent(),
                required String category,
                required String area,
                required String instructions,
                required String mealThumb,
                Value<String?> tags = const Value.absent(),
                Value<String?> youtube = const Value.absent(),
                Value<String?> source = const Value.absent(),
                required String ingredients,
                required String categoryId,
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteMealsCompanion.insert(
                id: id,
                meal: meal,
                drinkAlternate: drinkAlternate,
                category: category,
                area: area,
                instructions: instructions,
                mealThumb: mealThumb,
                tags: tags,
                youtube: youtube,
                source: source,
                ingredients: ingredients,
                categoryId: categoryId,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteMealsTable,
      FavoriteMeal,
      $$FavoriteMealsTableFilterComposer,
      $$FavoriteMealsTableOrderingComposer,
      $$FavoriteMealsTableAnnotationComposer,
      $$FavoriteMealsTableCreateCompanionBuilder,
      $$FavoriteMealsTableUpdateCompanionBuilder,
      (
        FavoriteMeal,
        BaseReferences<_$AppDatabase, $FavoriteMealsTable, FavoriteMeal>,
      ),
      FavoriteMeal,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteMealsTableTableManager get favoriteMeals =>
      $$FavoriteMealsTableTableManager(_db, _db.favoriteMeals);
}
