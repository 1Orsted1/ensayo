// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TestTableTable extends TestTable
    with TableInfo<$TestTableTable, TestTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _testNameMeta = const VerificationMeta(
    'testName',
  );
  @override
  late final GeneratedColumn<String> testName = GeneratedColumn<String>(
    'test_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [testName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('test_name')) {
      context.handle(
        _testNameMeta,
        testName.isAcceptableOrUnknown(data['test_name']!, _testNameMeta),
      );
    } else if (isInserting) {
      context.missing(_testNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TestTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestTableData(
      testName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_name'],
      )!,
    );
  }

  @override
  $TestTableTable createAlias(String alias) {
    return $TestTableTable(attachedDatabase, alias);
  }
}

class TestTableData extends DataClass implements Insertable<TestTableData> {
  final String testName;
  const TestTableData({required this.testName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['test_name'] = Variable<String>(testName);
    return map;
  }

  TestTableCompanion toCompanion(bool nullToAbsent) {
    return TestTableCompanion(testName: Value(testName));
  }

  factory TestTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestTableData(
      testName: serializer.fromJson<String>(json['testName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'testName': serializer.toJson<String>(testName)};
  }

  TestTableData copyWith({String? testName}) =>
      TestTableData(testName: testName ?? this.testName);
  TestTableData copyWithCompanion(TestTableCompanion data) {
    return TestTableData(
      testName: data.testName.present ? data.testName.value : this.testName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestTableData(')
          ..write('testName: $testName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => testName.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestTableData && other.testName == this.testName);
}

class TestTableCompanion extends UpdateCompanion<TestTableData> {
  final Value<String> testName;
  final Value<int> rowid;
  const TestTableCompanion({
    this.testName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestTableCompanion.insert({
    required String testName,
    this.rowid = const Value.absent(),
  }) : testName = Value(testName);
  static Insertable<TestTableData> custom({
    Expression<String>? testName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (testName != null) 'test_name': testName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestTableCompanion copyWith({Value<String>? testName, Value<int>? rowid}) {
    return TestTableCompanion(
      testName: testName ?? this.testName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (testName.present) {
      map['test_name'] = Variable<String>(testName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestTableCompanion(')
          ..write('testName: $testName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TestTableTable testTable = $TestTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [testTable];
}

typedef $$TestTableTableCreateCompanionBuilder =
    TestTableCompanion Function({required String testName, Value<int> rowid});
typedef $$TestTableTableUpdateCompanionBuilder =
    TestTableCompanion Function({Value<String> testName, Value<int> rowid});

class $$TestTableTableFilterComposer
    extends Composer<_$AppDatabase, $TestTableTable> {
  $$TestTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TestTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TestTableTable> {
  $$TestTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TestTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestTableTable> {
  $$TestTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get testName =>
      $composableBuilder(column: $table.testName, builder: (column) => column);
}

class $$TestTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestTableTable,
          TestTableData,
          $$TestTableTableFilterComposer,
          $$TestTableTableOrderingComposer,
          $$TestTableTableAnnotationComposer,
          $$TestTableTableCreateCompanionBuilder,
          $$TestTableTableUpdateCompanionBuilder,
          (
            TestTableData,
            BaseReferences<_$AppDatabase, $TestTableTable, TestTableData>,
          ),
          TestTableData,
          PrefetchHooks Function()
        > {
  $$TestTableTableTableManager(_$AppDatabase db, $TestTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> testName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestTableCompanion(testName: testName, rowid: rowid),
          createCompanionCallback:
              ({
                required String testName,
                Value<int> rowid = const Value.absent(),
              }) => TestTableCompanion.insert(testName: testName, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TestTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestTableTable,
      TestTableData,
      $$TestTableTableFilterComposer,
      $$TestTableTableOrderingComposer,
      $$TestTableTableAnnotationComposer,
      $$TestTableTableCreateCompanionBuilder,
      $$TestTableTableUpdateCompanionBuilder,
      (
        TestTableData,
        BaseReferences<_$AppDatabase, $TestTableTable, TestTableData>,
      ),
      TestTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TestTableTableTableManager get testTable =>
      $$TestTableTableTableManager(_db, _db.testTable);
}
