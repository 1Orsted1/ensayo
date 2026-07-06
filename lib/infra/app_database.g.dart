// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MetricsTable extends Metrics with TableInfo<$MetricsTable, MetricsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MetricsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _streakDaysMeta = const VerificationMeta(
    'streakDays',
  );
  @override
  late final GeneratedColumn<int> streakDays = GeneratedColumn<int>(
    'streak_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyGoalInMinutesMeta =
      const VerificationMeta('dailyGoalInMinutes');
  @override
  late final GeneratedColumn<double> dailyGoalInMinutes =
      GeneratedColumn<double>(
        'daily_goal_in_minutes',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [id, streakDays, dailyGoalInMinutes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'metrics';
  @override
  VerificationContext validateIntegrity(
    Insertable<MetricsData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('streak_days')) {
      context.handle(
        _streakDaysMeta,
        streakDays.isAcceptableOrUnknown(data['streak_days']!, _streakDaysMeta),
      );
    } else if (isInserting) {
      context.missing(_streakDaysMeta);
    }
    if (data.containsKey('daily_goal_in_minutes')) {
      context.handle(
        _dailyGoalInMinutesMeta,
        dailyGoalInMinutes.isAcceptableOrUnknown(
          data['daily_goal_in_minutes']!,
          _dailyGoalInMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyGoalInMinutesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MetricsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MetricsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      streakDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_days'],
      )!,
      dailyGoalInMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}daily_goal_in_minutes'],
      )!,
    );
  }

  @override
  $MetricsTable createAlias(String alias) {
    return $MetricsTable(attachedDatabase, alias);
  }
}

class MetricsCompanion extends UpdateCompanion<MetricsData> {
  final Value<int> id;
  final Value<int> streakDays;
  final Value<double> dailyGoalInMinutes;
  const MetricsCompanion({
    this.id = const Value.absent(),
    this.streakDays = const Value.absent(),
    this.dailyGoalInMinutes = const Value.absent(),
  });
  MetricsCompanion.insert({
    this.id = const Value.absent(),
    required int streakDays,
    required double dailyGoalInMinutes,
  }) : streakDays = Value(streakDays),
       dailyGoalInMinutes = Value(dailyGoalInMinutes);
  static Insertable<MetricsData> custom({
    Expression<int>? id,
    Expression<int>? streakDays,
    Expression<double>? dailyGoalInMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (streakDays != null) 'streak_days': streakDays,
      if (dailyGoalInMinutes != null)
        'daily_goal_in_minutes': dailyGoalInMinutes,
    });
  }

  MetricsCompanion copyWith({
    Value<int>? id,
    Value<int>? streakDays,
    Value<double>? dailyGoalInMinutes,
  }) {
    return MetricsCompanion(
      id: id ?? this.id,
      streakDays: streakDays ?? this.streakDays,
      dailyGoalInMinutes: dailyGoalInMinutes ?? this.dailyGoalInMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (streakDays.present) {
      map['streak_days'] = Variable<int>(streakDays.value);
    }
    if (dailyGoalInMinutes.present) {
      map['daily_goal_in_minutes'] = Variable<double>(dailyGoalInMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetricsCompanion(')
          ..write('id: $id, ')
          ..write('streakDays: $streakDays, ')
          ..write('dailyGoalInMinutes: $dailyGoalInMinutes')
          ..write(')'))
        .toString();
  }
}

class $FeelingsTable extends Feelings with TableInfo<$FeelingsTable, Feeling> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeelingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feelings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Feeling> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Feeling map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feeling(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $FeelingsTable createAlias(String alias) {
    return $FeelingsTable(attachedDatabase, alias);
  }
}

class Feeling extends DataClass implements Insertable<Feeling> {
  final int id;
  final String name;
  const Feeling({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  FeelingsCompanion toCompanion(bool nullToAbsent) {
    return FeelingsCompanion(id: Value(id), name: Value(name));
  }

  factory Feeling.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feeling(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Feeling copyWith({int? id, String? name}) =>
      Feeling(id: id ?? this.id, name: name ?? this.name);
  Feeling copyWithCompanion(FeelingsCompanion data) {
    return Feeling(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Feeling(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feeling && other.id == this.id && other.name == this.name);
}

class FeelingsCompanion extends UpdateCompanion<Feeling> {
  final Value<int> id;
  final Value<String> name;
  const FeelingsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FeelingsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Feeling> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FeelingsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return FeelingsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeelingsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PracticeLogsTable extends PracticeLogs
    with TableInfo<$PracticeLogsTable, PracticeLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutesPracticedMeta = const VerificationMeta(
    'minutesPracticed',
  );
  @override
  late final GeneratedColumn<double> minutesPracticed = GeneratedColumn<double>(
    'minutes_practiced',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feelingIdMeta = const VerificationMeta(
    'feelingId',
  );
  @override
  late final GeneratedColumn<int> feelingId = GeneratedColumn<int>(
    'feeling_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES feelings (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    title,
    note,
    minutesPracticed,
    feelingId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<PracticeLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('minutes_practiced')) {
      context.handle(
        _minutesPracticedMeta,
        minutesPracticed.isAcceptableOrUnknown(
          data['minutes_practiced']!,
          _minutesPracticedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minutesPracticedMeta);
    }
    if (data.containsKey('feeling_id')) {
      context.handle(
        _feelingIdMeta,
        feelingId.isAcceptableOrUnknown(data['feeling_id']!, _feelingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_feelingIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticeLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
      minutesPracticed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}minutes_practiced'],
      )!,
      feelingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}feeling_id'],
      )!,
    );
  }

  @override
  $PracticeLogsTable createAlias(String alias) {
    return $PracticeLogsTable(attachedDatabase, alias);
  }
}

class PracticeLog extends DataClass implements Insertable<PracticeLog> {
  final int id;
  final DateTime? createdAt;
  final String title;
  final String note;
  final double minutesPracticed;
  final int feelingId;
  const PracticeLog({
    required this.id,
    this.createdAt,
    required this.title,
    required this.note,
    required this.minutesPracticed,
    required this.feelingId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['title'] = Variable<String>(title);
    map['note'] = Variable<String>(note);
    map['minutes_practiced'] = Variable<double>(minutesPracticed);
    map['feeling_id'] = Variable<int>(feelingId);
    return map;
  }

  PracticeLogsCompanion toCompanion(bool nullToAbsent) {
    return PracticeLogsCompanion(
      id: Value(id),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      title: Value(title),
      note: Value(note),
      minutesPracticed: Value(minutesPracticed),
      feelingId: Value(feelingId),
    );
  }

  factory PracticeLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeLog(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String>(json['note']),
      minutesPracticed: serializer.fromJson<double>(json['minutesPracticed']),
      feelingId: serializer.fromJson<int>(json['feelingId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String>(note),
      'minutesPracticed': serializer.toJson<double>(minutesPracticed),
      'feelingId': serializer.toJson<int>(feelingId),
    };
  }

  PracticeLog copyWith({
    int? id,
    Value<DateTime?> createdAt = const Value.absent(),
    String? title,
    String? note,
    double? minutesPracticed,
    int? feelingId,
  }) => PracticeLog(
    id: id ?? this.id,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    title: title ?? this.title,
    note: note ?? this.note,
    minutesPracticed: minutesPracticed ?? this.minutesPracticed,
    feelingId: feelingId ?? this.feelingId,
  );
  PracticeLog copyWithCompanion(PracticeLogsCompanion data) {
    return PracticeLog(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      title: data.title.present ? data.title.value : this.title,
      note: data.note.present ? data.note.value : this.note,
      minutesPracticed: data.minutesPracticed.present
          ? data.minutesPracticed.value
          : this.minutesPracticed,
      feelingId: data.feelingId.present ? data.feelingId.value : this.feelingId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeLog(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('minutesPracticed: $minutesPracticed, ')
          ..write('feelingId: $feelingId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, title, note, minutesPracticed, feelingId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeLog &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.note == this.note &&
          other.minutesPracticed == this.minutesPracticed &&
          other.feelingId == this.feelingId);
}

class PracticeLogsCompanion extends UpdateCompanion<PracticeLog> {
  final Value<int> id;
  final Value<DateTime?> createdAt;
  final Value<String> title;
  final Value<String> note;
  final Value<double> minutesPracticed;
  final Value<int> feelingId;
  const PracticeLogsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.minutesPracticed = const Value.absent(),
    this.feelingId = const Value.absent(),
  });
  PracticeLogsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String title,
    required String note,
    required double minutesPracticed,
    required int feelingId,
  }) : title = Value(title),
       note = Value(note),
       minutesPracticed = Value(minutesPracticed),
       feelingId = Value(feelingId);
  static Insertable<PracticeLog> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? title,
    Expression<String>? note,
    Expression<double>? minutesPracticed,
    Expression<int>? feelingId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (minutesPracticed != null) 'minutes_practiced': minutesPracticed,
      if (feelingId != null) 'feeling_id': feelingId,
    });
  }

  PracticeLogsCompanion copyWith({
    Value<int>? id,
    Value<DateTime?>? createdAt,
    Value<String>? title,
    Value<String>? note,
    Value<double>? minutesPracticed,
    Value<int>? feelingId,
  }) {
    return PracticeLogsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      note: note ?? this.note,
      minutesPracticed: minutesPracticed ?? this.minutesPracticed,
      feelingId: feelingId ?? this.feelingId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (minutesPracticed.present) {
      map['minutes_practiced'] = Variable<double>(minutesPracticed.value);
    }
    if (feelingId.present) {
      map['feeling_id'] = Variable<int>(feelingId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeLogsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('minutesPracticed: $minutesPracticed, ')
          ..write('feelingId: $feelingId')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String name;
  const Tag({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(id: Value(id), name: Value(name));
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Tag copyWith({int? id, String? name}) =>
      Tag(id: id ?? this.id, name: name ?? this.name);
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag && other.id == this.id && other.name == this.name);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> name;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagsCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TagsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TagsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SongsTable extends Songs with TableInfo<$SongsTable, Song> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'songs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Song> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Song map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Song(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $SongsTable createAlias(String alias) {
    return $SongsTable(attachedDatabase, alias);
  }
}

class Song extends DataClass implements Insertable<Song> {
  final int id;
  final String name;
  const Song({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SongsCompanion toCompanion(bool nullToAbsent) {
    return SongsCompanion(id: Value(id), name: Value(name));
  }

  factory Song.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Song(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Song copyWith({int? id, String? name}) =>
      Song(id: id ?? this.id, name: name ?? this.name);
  Song copyWithCompanion(SongsCompanion data) {
    return Song(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Song(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song && other.id == this.id && other.name == this.name);
}

class SongsCompanion extends UpdateCompanion<Song> {
  final Value<int> id;
  final Value<String> name;
  const SongsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SongsCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<Song> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SongsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SongsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TagsAssignedTable extends TagsAssigned
    with TableInfo<$TagsAssignedTable, TagsAssignedData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsAssignedTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tagsIdMeta = const VerificationMeta('tagsId');
  @override
  late final GeneratedColumn<int> tagsId = GeneratedColumn<int>(
    'tags_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<int> songId = GeneratedColumn<int>(
    'song_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES songs (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, tagsId, songId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags_assigned';
  @override
  VerificationContext validateIntegrity(
    Insertable<TagsAssignedData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tags_id')) {
      context.handle(
        _tagsIdMeta,
        tagsId.isAcceptableOrUnknown(data['tags_id']!, _tagsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagsIdMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(
        _songIdMeta,
        songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta),
      );
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagsAssignedData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagsAssignedData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tagsId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tags_id'],
      )!,
      songId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}song_id'],
      )!,
    );
  }

  @override
  $TagsAssignedTable createAlias(String alias) {
    return $TagsAssignedTable(attachedDatabase, alias);
  }
}

class TagsAssignedData extends DataClass
    implements Insertable<TagsAssignedData> {
  final int id;
  final int tagsId;
  final int songId;
  const TagsAssignedData({
    required this.id,
    required this.tagsId,
    required this.songId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tags_id'] = Variable<int>(tagsId);
    map['song_id'] = Variable<int>(songId);
    return map;
  }

  TagsAssignedCompanion toCompanion(bool nullToAbsent) {
    return TagsAssignedCompanion(
      id: Value(id),
      tagsId: Value(tagsId),
      songId: Value(songId),
    );
  }

  factory TagsAssignedData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagsAssignedData(
      id: serializer.fromJson<int>(json['id']),
      tagsId: serializer.fromJson<int>(json['tagsId']),
      songId: serializer.fromJson<int>(json['songId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tagsId': serializer.toJson<int>(tagsId),
      'songId': serializer.toJson<int>(songId),
    };
  }

  TagsAssignedData copyWith({int? id, int? tagsId, int? songId}) =>
      TagsAssignedData(
        id: id ?? this.id,
        tagsId: tagsId ?? this.tagsId,
        songId: songId ?? this.songId,
      );
  TagsAssignedData copyWithCompanion(TagsAssignedCompanion data) {
    return TagsAssignedData(
      id: data.id.present ? data.id.value : this.id,
      tagsId: data.tagsId.present ? data.tagsId.value : this.tagsId,
      songId: data.songId.present ? data.songId.value : this.songId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagsAssignedData(')
          ..write('id: $id, ')
          ..write('tagsId: $tagsId, ')
          ..write('songId: $songId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tagsId, songId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagsAssignedData &&
          other.id == this.id &&
          other.tagsId == this.tagsId &&
          other.songId == this.songId);
}

class TagsAssignedCompanion extends UpdateCompanion<TagsAssignedData> {
  final Value<int> id;
  final Value<int> tagsId;
  final Value<int> songId;
  const TagsAssignedCompanion({
    this.id = const Value.absent(),
    this.tagsId = const Value.absent(),
    this.songId = const Value.absent(),
  });
  TagsAssignedCompanion.insert({
    this.id = const Value.absent(),
    required int tagsId,
    required int songId,
  }) : tagsId = Value(tagsId),
       songId = Value(songId);
  static Insertable<TagsAssignedData> custom({
    Expression<int>? id,
    Expression<int>? tagsId,
    Expression<int>? songId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tagsId != null) 'tags_id': tagsId,
      if (songId != null) 'song_id': songId,
    });
  }

  TagsAssignedCompanion copyWith({
    Value<int>? id,
    Value<int>? tagsId,
    Value<int>? songId,
  }) {
    return TagsAssignedCompanion(
      id: id ?? this.id,
      tagsId: tagsId ?? this.tagsId,
      songId: songId ?? this.songId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tagsId.present) {
      map['tags_id'] = Variable<int>(tagsId.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsAssignedCompanion(')
          ..write('id: $id, ')
          ..write('tagsId: $tagsId, ')
          ..write('songId: $songId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MetricsTable metrics = $MetricsTable(this);
  late final $FeelingsTable feelings = $FeelingsTable(this);
  late final $PracticeLogsTable practiceLogs = $PracticeLogsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $SongsTable songs = $SongsTable(this);
  late final $TagsAssignedTable tagsAssigned = $TagsAssignedTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    metrics,
    feelings,
    practiceLogs,
    tags,
    songs,
    tagsAssigned,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'feelings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('practice_logs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tags',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tags_assigned', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'songs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tags_assigned', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$MetricsTableCreateCompanionBuilder =
    MetricsCompanion Function({
      Value<int> id,
      required int streakDays,
      required double dailyGoalInMinutes,
    });
typedef $$MetricsTableUpdateCompanionBuilder =
    MetricsCompanion Function({
      Value<int> id,
      Value<int> streakDays,
      Value<double> dailyGoalInMinutes,
    });

class $$MetricsTableFilterComposer
    extends Composer<_$AppDatabase, $MetricsTable> {
  $$MetricsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dailyGoalInMinutes => $composableBuilder(
    column: $table.dailyGoalInMinutes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MetricsTableOrderingComposer
    extends Composer<_$AppDatabase, $MetricsTable> {
  $$MetricsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dailyGoalInMinutes => $composableBuilder(
    column: $table.dailyGoalInMinutes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MetricsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MetricsTable> {
  $$MetricsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => column,
  );

  GeneratedColumn<double> get dailyGoalInMinutes => $composableBuilder(
    column: $table.dailyGoalInMinutes,
    builder: (column) => column,
  );
}

class $$MetricsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MetricsTable,
          MetricsData,
          $$MetricsTableFilterComposer,
          $$MetricsTableOrderingComposer,
          $$MetricsTableAnnotationComposer,
          $$MetricsTableCreateCompanionBuilder,
          $$MetricsTableUpdateCompanionBuilder,
          (
            MetricsData,
            BaseReferences<_$AppDatabase, $MetricsTable, MetricsData>,
          ),
          MetricsData,
          PrefetchHooks Function()
        > {
  $$MetricsTableTableManager(_$AppDatabase db, $MetricsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MetricsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MetricsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MetricsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> streakDays = const Value.absent(),
                Value<double> dailyGoalInMinutes = const Value.absent(),
              }) => MetricsCompanion(
                id: id,
                streakDays: streakDays,
                dailyGoalInMinutes: dailyGoalInMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int streakDays,
                required double dailyGoalInMinutes,
              }) => MetricsCompanion.insert(
                id: id,
                streakDays: streakDays,
                dailyGoalInMinutes: dailyGoalInMinutes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MetricsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MetricsTable,
      MetricsData,
      $$MetricsTableFilterComposer,
      $$MetricsTableOrderingComposer,
      $$MetricsTableAnnotationComposer,
      $$MetricsTableCreateCompanionBuilder,
      $$MetricsTableUpdateCompanionBuilder,
      (MetricsData, BaseReferences<_$AppDatabase, $MetricsTable, MetricsData>),
      MetricsData,
      PrefetchHooks Function()
    >;
typedef $$FeelingsTableCreateCompanionBuilder =
    FeelingsCompanion Function({Value<int> id, required String name});
typedef $$FeelingsTableUpdateCompanionBuilder =
    FeelingsCompanion Function({Value<int> id, Value<String> name});

final class $$FeelingsTableReferences
    extends BaseReferences<_$AppDatabase, $FeelingsTable, Feeling> {
  $$FeelingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PracticeLogsTable, List<PracticeLog>>
  _practiceLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.practiceLogs,
    aliasName: $_aliasNameGenerator(db.feelings.id, db.practiceLogs.feelingId),
  );

  $$PracticeLogsTableProcessedTableManager get practiceLogsRefs {
    final manager = $$PracticeLogsTableTableManager(
      $_db,
      $_db.practiceLogs,
    ).filter((f) => f.feelingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_practiceLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FeelingsTableFilterComposer
    extends Composer<_$AppDatabase, $FeelingsTable> {
  $$FeelingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> practiceLogsRefs(
    Expression<bool> Function($$PracticeLogsTableFilterComposer f) f,
  ) {
    final $$PracticeLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.practiceLogs,
      getReferencedColumn: (t) => t.feelingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PracticeLogsTableFilterComposer(
            $db: $db,
            $table: $db.practiceLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FeelingsTableOrderingComposer
    extends Composer<_$AppDatabase, $FeelingsTable> {
  $$FeelingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FeelingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeelingsTable> {
  $$FeelingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> practiceLogsRefs<T extends Object>(
    Expression<T> Function($$PracticeLogsTableAnnotationComposer a) f,
  ) {
    final $$PracticeLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.practiceLogs,
      getReferencedColumn: (t) => t.feelingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PracticeLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.practiceLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FeelingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FeelingsTable,
          Feeling,
          $$FeelingsTableFilterComposer,
          $$FeelingsTableOrderingComposer,
          $$FeelingsTableAnnotationComposer,
          $$FeelingsTableCreateCompanionBuilder,
          $$FeelingsTableUpdateCompanionBuilder,
          (Feeling, $$FeelingsTableReferences),
          Feeling,
          PrefetchHooks Function({bool practiceLogsRefs})
        > {
  $$FeelingsTableTableManager(_$AppDatabase db, $FeelingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeelingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeelingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeelingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => FeelingsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  FeelingsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FeelingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({practiceLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (practiceLogsRefs) db.practiceLogs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (practiceLogsRefs)
                    await $_getPrefetchedData<
                      Feeling,
                      $FeelingsTable,
                      PracticeLog
                    >(
                      currentTable: table,
                      referencedTable: $$FeelingsTableReferences
                          ._practiceLogsRefsTable(db),
                      managerFromTypedResult: (p0) => $$FeelingsTableReferences(
                        db,
                        table,
                        p0,
                      ).practiceLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.feelingId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FeelingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FeelingsTable,
      Feeling,
      $$FeelingsTableFilterComposer,
      $$FeelingsTableOrderingComposer,
      $$FeelingsTableAnnotationComposer,
      $$FeelingsTableCreateCompanionBuilder,
      $$FeelingsTableUpdateCompanionBuilder,
      (Feeling, $$FeelingsTableReferences),
      Feeling,
      PrefetchHooks Function({bool practiceLogsRefs})
    >;
typedef $$PracticeLogsTableCreateCompanionBuilder =
    PracticeLogsCompanion Function({
      Value<int> id,
      Value<DateTime?> createdAt,
      required String title,
      required String note,
      required double minutesPracticed,
      required int feelingId,
    });
typedef $$PracticeLogsTableUpdateCompanionBuilder =
    PracticeLogsCompanion Function({
      Value<int> id,
      Value<DateTime?> createdAt,
      Value<String> title,
      Value<String> note,
      Value<double> minutesPracticed,
      Value<int> feelingId,
    });

final class $$PracticeLogsTableReferences
    extends BaseReferences<_$AppDatabase, $PracticeLogsTable, PracticeLog> {
  $$PracticeLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FeelingsTable _feelingIdTable(_$AppDatabase db) =>
      db.feelings.createAlias(
        $_aliasNameGenerator(db.practiceLogs.feelingId, db.feelings.id),
      );

  $$FeelingsTableProcessedTableManager get feelingId {
    final $_column = $_itemColumn<int>('feeling_id')!;

    final manager = $$FeelingsTableTableManager(
      $_db,
      $_db.feelings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_feelingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PracticeLogsTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeLogsTable> {
  $$PracticeLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minutesPracticed => $composableBuilder(
    column: $table.minutesPracticed,
    builder: (column) => ColumnFilters(column),
  );

  $$FeelingsTableFilterComposer get feelingId {
    final $$FeelingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.feelingId,
      referencedTable: $db.feelings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FeelingsTableFilterComposer(
            $db: $db,
            $table: $db.feelings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PracticeLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeLogsTable> {
  $$PracticeLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minutesPracticed => $composableBuilder(
    column: $table.minutesPracticed,
    builder: (column) => ColumnOrderings(column),
  );

  $$FeelingsTableOrderingComposer get feelingId {
    final $$FeelingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.feelingId,
      referencedTable: $db.feelings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FeelingsTableOrderingComposer(
            $db: $db,
            $table: $db.feelings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PracticeLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeLogsTable> {
  $$PracticeLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<double> get minutesPracticed => $composableBuilder(
    column: $table.minutesPracticed,
    builder: (column) => column,
  );

  $$FeelingsTableAnnotationComposer get feelingId {
    final $$FeelingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.feelingId,
      referencedTable: $db.feelings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FeelingsTableAnnotationComposer(
            $db: $db,
            $table: $db.feelings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PracticeLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PracticeLogsTable,
          PracticeLog,
          $$PracticeLogsTableFilterComposer,
          $$PracticeLogsTableOrderingComposer,
          $$PracticeLogsTableAnnotationComposer,
          $$PracticeLogsTableCreateCompanionBuilder,
          $$PracticeLogsTableUpdateCompanionBuilder,
          (PracticeLog, $$PracticeLogsTableReferences),
          PracticeLog,
          PrefetchHooks Function({bool feelingId})
        > {
  $$PracticeLogsTableTableManager(_$AppDatabase db, $PracticeLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticeLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticeLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticeLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<double> minutesPracticed = const Value.absent(),
                Value<int> feelingId = const Value.absent(),
              }) => PracticeLogsCompanion(
                id: id,
                createdAt: createdAt,
                title: title,
                note: note,
                minutesPracticed: minutesPracticed,
                feelingId: feelingId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                required String title,
                required String note,
                required double minutesPracticed,
                required int feelingId,
              }) => PracticeLogsCompanion.insert(
                id: id,
                createdAt: createdAt,
                title: title,
                note: note,
                minutesPracticed: minutesPracticed,
                feelingId: feelingId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PracticeLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({feelingId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (feelingId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.feelingId,
                                referencedTable: $$PracticeLogsTableReferences
                                    ._feelingIdTable(db),
                                referencedColumn: $$PracticeLogsTableReferences
                                    ._feelingIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PracticeLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PracticeLogsTable,
      PracticeLog,
      $$PracticeLogsTableFilterComposer,
      $$PracticeLogsTableOrderingComposer,
      $$PracticeLogsTableAnnotationComposer,
      $$PracticeLogsTableCreateCompanionBuilder,
      $$PracticeLogsTableUpdateCompanionBuilder,
      (PracticeLog, $$PracticeLogsTableReferences),
      PracticeLog,
      PrefetchHooks Function({bool feelingId})
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({Value<int> id, required String name});
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({Value<int> id, Value<String> name});

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TagsAssignedTable, List<TagsAssignedData>>
  _tagsAssignedRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tagsAssigned,
    aliasName: $_aliasNameGenerator(db.tags.id, db.tagsAssigned.tagsId),
  );

  $$TagsAssignedTableProcessedTableManager get tagsAssignedRefs {
    final manager = $$TagsAssignedTableTableManager(
      $_db,
      $_db.tagsAssigned,
    ).filter((f) => f.tagsId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tagsAssignedRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tagsAssignedRefs(
    Expression<bool> Function($$TagsAssignedTableFilterComposer f) f,
  ) {
    final $$TagsAssignedTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tagsAssigned,
      getReferencedColumn: (t) => t.tagsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsAssignedTableFilterComposer(
            $db: $db,
            $table: $db.tagsAssigned,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> tagsAssignedRefs<T extends Object>(
    Expression<T> Function($$TagsAssignedTableAnnotationComposer a) f,
  ) {
    final $$TagsAssignedTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tagsAssigned,
      getReferencedColumn: (t) => t.tagsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsAssignedTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsAssigned,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, $$TagsTableReferences),
          Tag,
          PrefetchHooks Function({bool tagsAssignedRefs})
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => TagsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  TagsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TagsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({tagsAssignedRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tagsAssignedRefs) db.tagsAssigned],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tagsAssignedRefs)
                    await $_getPrefetchedData<
                      Tag,
                      $TagsTable,
                      TagsAssignedData
                    >(
                      currentTable: table,
                      referencedTable: $$TagsTableReferences
                          ._tagsAssignedRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TagsTableReferences(db, table, p0).tagsAssignedRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagsId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, $$TagsTableReferences),
      Tag,
      PrefetchHooks Function({bool tagsAssignedRefs})
    >;
typedef $$SongsTableCreateCompanionBuilder =
    SongsCompanion Function({Value<int> id, required String name});
typedef $$SongsTableUpdateCompanionBuilder =
    SongsCompanion Function({Value<int> id, Value<String> name});

final class $$SongsTableReferences
    extends BaseReferences<_$AppDatabase, $SongsTable, Song> {
  $$SongsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TagsAssignedTable, List<TagsAssignedData>>
  _tagsAssignedRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tagsAssigned,
    aliasName: $_aliasNameGenerator(db.songs.id, db.tagsAssigned.songId),
  );

  $$TagsAssignedTableProcessedTableManager get tagsAssignedRefs {
    final manager = $$TagsAssignedTableTableManager(
      $_db,
      $_db.tagsAssigned,
    ).filter((f) => f.songId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tagsAssignedRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SongsTableFilterComposer extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tagsAssignedRefs(
    Expression<bool> Function($$TagsAssignedTableFilterComposer f) f,
  ) {
    final $$TagsAssignedTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tagsAssigned,
      getReferencedColumn: (t) => t.songId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsAssignedTableFilterComposer(
            $db: $db,
            $table: $db.tagsAssigned,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SongsTableOrderingComposer
    extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SongsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> tagsAssignedRefs<T extends Object>(
    Expression<T> Function($$TagsAssignedTableAnnotationComposer a) f,
  ) {
    final $$TagsAssignedTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tagsAssigned,
      getReferencedColumn: (t) => t.songId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsAssignedTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsAssigned,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SongsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SongsTable,
          Song,
          $$SongsTableFilterComposer,
          $$SongsTableOrderingComposer,
          $$SongsTableAnnotationComposer,
          $$SongsTableCreateCompanionBuilder,
          $$SongsTableUpdateCompanionBuilder,
          (Song, $$SongsTableReferences),
          Song,
          PrefetchHooks Function({bool tagsAssignedRefs})
        > {
  $$SongsTableTableManager(_$AppDatabase db, $SongsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SongsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SongsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SongsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => SongsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  SongsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SongsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({tagsAssignedRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tagsAssignedRefs) db.tagsAssigned],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tagsAssignedRefs)
                    await $_getPrefetchedData<
                      Song,
                      $SongsTable,
                      TagsAssignedData
                    >(
                      currentTable: table,
                      referencedTable: $$SongsTableReferences
                          ._tagsAssignedRefsTable(db),
                      managerFromTypedResult: (p0) => $$SongsTableReferences(
                        db,
                        table,
                        p0,
                      ).tagsAssignedRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.songId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SongsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SongsTable,
      Song,
      $$SongsTableFilterComposer,
      $$SongsTableOrderingComposer,
      $$SongsTableAnnotationComposer,
      $$SongsTableCreateCompanionBuilder,
      $$SongsTableUpdateCompanionBuilder,
      (Song, $$SongsTableReferences),
      Song,
      PrefetchHooks Function({bool tagsAssignedRefs})
    >;
typedef $$TagsAssignedTableCreateCompanionBuilder =
    TagsAssignedCompanion Function({
      Value<int> id,
      required int tagsId,
      required int songId,
    });
typedef $$TagsAssignedTableUpdateCompanionBuilder =
    TagsAssignedCompanion Function({
      Value<int> id,
      Value<int> tagsId,
      Value<int> songId,
    });

final class $$TagsAssignedTableReferences
    extends
        BaseReferences<_$AppDatabase, $TagsAssignedTable, TagsAssignedData> {
  $$TagsAssignedTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TagsTable _tagsIdTable(_$AppDatabase db) => db.tags.createAlias(
    $_aliasNameGenerator(db.tagsAssigned.tagsId, db.tags.id),
  );

  $$TagsTableProcessedTableManager get tagsId {
    final $_column = $_itemColumn<int>('tags_id')!;

    final manager = $$TagsTableTableManager(
      $_db,
      $_db.tags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SongsTable _songIdTable(_$AppDatabase db) => db.songs.createAlias(
    $_aliasNameGenerator(db.tagsAssigned.songId, db.songs.id),
  );

  $$SongsTableProcessedTableManager get songId {
    final $_column = $_itemColumn<int>('song_id')!;

    final manager = $$SongsTableTableManager(
      $_db,
      $_db.songs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_songIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TagsAssignedTableFilterComposer
    extends Composer<_$AppDatabase, $TagsAssignedTable> {
  $$TagsAssignedTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$TagsTableFilterComposer get tagsId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagsId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableFilterComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SongsTableFilterComposer get songId {
    final $$SongsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableFilterComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TagsAssignedTableOrderingComposer
    extends Composer<_$AppDatabase, $TagsAssignedTable> {
  $$TagsAssignedTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$TagsTableOrderingComposer get tagsId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagsId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableOrderingComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SongsTableOrderingComposer get songId {
    final $$SongsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableOrderingComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TagsAssignedTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsAssignedTable> {
  $$TagsAssignedTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TagsTableAnnotationComposer get tagsId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagsId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableAnnotationComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SongsTableAnnotationComposer get songId {
    final $$SongsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableAnnotationComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TagsAssignedTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsAssignedTable,
          TagsAssignedData,
          $$TagsAssignedTableFilterComposer,
          $$TagsAssignedTableOrderingComposer,
          $$TagsAssignedTableAnnotationComposer,
          $$TagsAssignedTableCreateCompanionBuilder,
          $$TagsAssignedTableUpdateCompanionBuilder,
          (TagsAssignedData, $$TagsAssignedTableReferences),
          TagsAssignedData,
          PrefetchHooks Function({bool tagsId, bool songId})
        > {
  $$TagsAssignedTableTableManager(_$AppDatabase db, $TagsAssignedTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsAssignedTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsAssignedTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsAssignedTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tagsId = const Value.absent(),
                Value<int> songId = const Value.absent(),
              }) =>
                  TagsAssignedCompanion(id: id, tagsId: tagsId, songId: songId),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tagsId,
                required int songId,
              }) => TagsAssignedCompanion.insert(
                id: id,
                tagsId: tagsId,
                songId: songId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TagsAssignedTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tagsId = false, songId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tagsId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagsId,
                                referencedTable: $$TagsAssignedTableReferences
                                    ._tagsIdTable(db),
                                referencedColumn: $$TagsAssignedTableReferences
                                    ._tagsIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (songId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.songId,
                                referencedTable: $$TagsAssignedTableReferences
                                    ._songIdTable(db),
                                referencedColumn: $$TagsAssignedTableReferences
                                    ._songIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TagsAssignedTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsAssignedTable,
      TagsAssignedData,
      $$TagsAssignedTableFilterComposer,
      $$TagsAssignedTableOrderingComposer,
      $$TagsAssignedTableAnnotationComposer,
      $$TagsAssignedTableCreateCompanionBuilder,
      $$TagsAssignedTableUpdateCompanionBuilder,
      (TagsAssignedData, $$TagsAssignedTableReferences),
      TagsAssignedData,
      PrefetchHooks Function({bool tagsId, bool songId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MetricsTableTableManager get metrics =>
      $$MetricsTableTableManager(_db, _db.metrics);
  $$FeelingsTableTableManager get feelings =>
      $$FeelingsTableTableManager(_db, _db.feelings);
  $$PracticeLogsTableTableManager get practiceLogs =>
      $$PracticeLogsTableTableManager(_db, _db.practiceLogs);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$SongsTableTableManager get songs =>
      $$SongsTableTableManager(_db, _db.songs);
  $$TagsAssignedTableTableManager get tagsAssigned =>
      $$TagsAssignedTableTableManager(_db, _db.tagsAssigned);
}
