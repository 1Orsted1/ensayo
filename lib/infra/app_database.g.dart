// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ThemeDataTable extends ThemeData
    with TableInfo<$ThemeDataTable, ThemeDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThemeDataTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumnWithTypeConverter<SelectedTheme, String>
  currentTheme = GeneratedColumn<String>(
    'current_theme',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<SelectedTheme>($ThemeDataTable.$convertercurrentTheme);
  @override
  List<GeneratedColumn> get $columns => [currentTheme];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'theme_data';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ThemeDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThemeDataData(
      currentTheme: $ThemeDataTable.$convertercurrentTheme.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}current_theme'],
        )!,
      ),
    );
  }

  @override
  $ThemeDataTable createAlias(String alias) {
    return $ThemeDataTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SelectedTheme, String, String>
  $convertercurrentTheme = const EnumNameConverter<SelectedTheme>(
    SelectedTheme.values,
  );
}

class ThemeDataData extends DataClass implements Insertable<ThemeDataData> {
  final SelectedTheme currentTheme;
  const ThemeDataData({required this.currentTheme});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['current_theme'] = Variable<String>(
        $ThemeDataTable.$convertercurrentTheme.toSql(currentTheme),
      );
    }
    return map;
  }

  ThemeDataCompanion toCompanion(bool nullToAbsent) {
    return ThemeDataCompanion(currentTheme: Value(currentTheme));
  }

  factory ThemeDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThemeDataData(
      currentTheme: $ThemeDataTable.$convertercurrentTheme.fromJson(
        serializer.fromJson<String>(json['currentTheme']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'currentTheme': serializer.toJson<String>(
        $ThemeDataTable.$convertercurrentTheme.toJson(currentTheme),
      ),
    };
  }

  ThemeDataData copyWith({SelectedTheme? currentTheme}) =>
      ThemeDataData(currentTheme: currentTheme ?? this.currentTheme);
  ThemeDataData copyWithCompanion(ThemeDataCompanion data) {
    return ThemeDataData(
      currentTheme: data.currentTheme.present
          ? data.currentTheme.value
          : this.currentTheme,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThemeDataData(')
          ..write('currentTheme: $currentTheme')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => currentTheme.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeDataData && other.currentTheme == this.currentTheme);
}

class ThemeDataCompanion extends UpdateCompanion<ThemeDataData> {
  final Value<SelectedTheme> currentTheme;
  final Value<int> rowid;
  const ThemeDataCompanion({
    this.currentTheme = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ThemeDataCompanion.insert({
    required SelectedTheme currentTheme,
    this.rowid = const Value.absent(),
  }) : currentTheme = Value(currentTheme);
  static Insertable<ThemeDataData> custom({
    Expression<String>? currentTheme,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (currentTheme != null) 'current_theme': currentTheme,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ThemeDataCompanion copyWith({
    Value<SelectedTheme>? currentTheme,
    Value<int>? rowid,
  }) {
    return ThemeDataCompanion(
      currentTheme: currentTheme ?? this.currentTheme,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (currentTheme.present) {
      map['current_theme'] = Variable<String>(
        $ThemeDataTable.$convertercurrentTheme.toSql(currentTheme.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThemeDataCompanion(')
          ..write('currentTheme: $currentTheme, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ThemeDataTable themeData = $ThemeDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [themeData];
}

typedef $$ThemeDataTableCreateCompanionBuilder =
    ThemeDataCompanion Function({
      required SelectedTheme currentTheme,
      Value<int> rowid,
    });
typedef $$ThemeDataTableUpdateCompanionBuilder =
    ThemeDataCompanion Function({
      Value<SelectedTheme> currentTheme,
      Value<int> rowid,
    });

class $$ThemeDataTableFilterComposer
    extends Composer<_$AppDatabase, $ThemeDataTable> {
  $$ThemeDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<SelectedTheme, SelectedTheme, String>
  get currentTheme => $composableBuilder(
    column: $table.currentTheme,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$ThemeDataTableOrderingComposer
    extends Composer<_$AppDatabase, $ThemeDataTable> {
  $$ThemeDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get currentTheme => $composableBuilder(
    column: $table.currentTheme,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ThemeDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $ThemeDataTable> {
  $$ThemeDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<SelectedTheme, String> get currentTheme =>
      $composableBuilder(
        column: $table.currentTheme,
        builder: (column) => column,
      );
}

class $$ThemeDataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ThemeDataTable,
          ThemeDataData,
          $$ThemeDataTableFilterComposer,
          $$ThemeDataTableOrderingComposer,
          $$ThemeDataTableAnnotationComposer,
          $$ThemeDataTableCreateCompanionBuilder,
          $$ThemeDataTableUpdateCompanionBuilder,
          (
            ThemeDataData,
            BaseReferences<_$AppDatabase, $ThemeDataTable, ThemeDataData>,
          ),
          ThemeDataData,
          PrefetchHooks Function()
        > {
  $$ThemeDataTableTableManager(_$AppDatabase db, $ThemeDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ThemeDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ThemeDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ThemeDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<SelectedTheme> currentTheme = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  ThemeDataCompanion(currentTheme: currentTheme, rowid: rowid),
          createCompanionCallback:
              ({
                required SelectedTheme currentTheme,
                Value<int> rowid = const Value.absent(),
              }) => ThemeDataCompanion.insert(
                currentTheme: currentTheme,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ThemeDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ThemeDataTable,
      ThemeDataData,
      $$ThemeDataTableFilterComposer,
      $$ThemeDataTableOrderingComposer,
      $$ThemeDataTableAnnotationComposer,
      $$ThemeDataTableCreateCompanionBuilder,
      $$ThemeDataTableUpdateCompanionBuilder,
      (
        ThemeDataData,
        BaseReferences<_$AppDatabase, $ThemeDataTable, ThemeDataData>,
      ),
      ThemeDataData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ThemeDataTableTableManager get themeData =>
      $$ThemeDataTableTableManager(_db, _db.themeData);
}
