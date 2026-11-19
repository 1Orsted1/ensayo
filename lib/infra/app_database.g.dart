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
  static const VerificationMeta _dailyGoalInMinutesMeta =
      const VerificationMeta('dailyGoalInMinutes');
  @override
  late final GeneratedColumn<int> dailyGoalInMinutes = GeneratedColumn<int>(
    'daily_goal_in_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, dailyGoalInMinutes];
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
      dailyGoalInMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
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
  final Value<int> dailyGoalInMinutes;
  const MetricsCompanion({
    this.id = const Value.absent(),
    this.dailyGoalInMinutes = const Value.absent(),
  });
  MetricsCompanion.insert({
    this.id = const Value.absent(),
    required int dailyGoalInMinutes,
  }) : dailyGoalInMinutes = Value(dailyGoalInMinutes);
  static Insertable<MetricsData> custom({
    Expression<int>? id,
    Expression<int>? dailyGoalInMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyGoalInMinutes != null)
        'daily_goal_in_minutes': dailyGoalInMinutes,
    });
  }

  MetricsCompanion copyWith({Value<int>? id, Value<int>? dailyGoalInMinutes}) {
    return MetricsCompanion(
      id: id ?? this.id,
      dailyGoalInMinutes: dailyGoalInMinutes ?? this.dailyGoalInMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyGoalInMinutes.present) {
      map['daily_goal_in_minutes'] = Variable<int>(dailyGoalInMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetricsCompanion(')
          ..write('id: $id, ')
          ..write('dailyGoalInMinutes: $dailyGoalInMinutes')
          ..write(')'))
        .toString();
  }
}

class $PracticeSessionsTable extends PracticeSessions
    with TableInfo<$PracticeSessionsTable, PracticeSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeSessionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, startedAt, endedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PracticeSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticeSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
    );
  }

  @override
  $PracticeSessionsTable createAlias(String alias) {
    return $PracticeSessionsTable(attachedDatabase, alias);
  }
}

class PracticeSession extends DataClass implements Insertable<PracticeSession> {
  final int id;
  final DateTime startedAt;
  final DateTime? endedAt;
  const PracticeSession({
    required this.id,
    required this.startedAt,
    this.endedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    return map;
  }

  PracticeSessionsCompanion toCompanion(bool nullToAbsent) {
    return PracticeSessionsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
    );
  }

  factory PracticeSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeSession(
      id: serializer.fromJson<int>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
    };
  }

  PracticeSession copyWith({
    int? id,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
  }) => PracticeSession(
    id: id ?? this.id,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
  );
  PracticeSession copyWithCompanion(PracticeSessionsCompanion data) {
    return PracticeSession(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeSession(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startedAt, endedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeSession &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt);
}

class PracticeSessionsCompanion extends UpdateCompanion<PracticeSession> {
  final Value<int> id;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  const PracticeSessionsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
  });
  PracticeSessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
  }) : startedAt = Value(startedAt);
  static Insertable<PracticeSession> custom({
    Expression<int>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
    });
  }

  PracticeSessionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
  }) {
    return PracticeSessionsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeSessionsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt')
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
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES practice_sessions (id)',
    ),
  );
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<int> songId = GeneratedColumn<int>(
    'song_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pieceTitleMeta = const VerificationMeta(
    'pieceTitle',
  );
  @override
  late final GeneratedColumn<String> pieceTitle = GeneratedColumn<String>(
    'piece_title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 160,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutesMeta = const VerificationMeta(
    'minutes',
  );
  @override
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
    'minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PieceMood?, String> mood =
      GeneratedColumn<String>(
        'mood',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<PieceMood?>($PracticeLogsTable.$convertermoodn);
  static const VerificationMeta _tempoBpmMeta = const VerificationMeta(
    'tempoBpm',
  );
  @override
  late final GeneratedColumn<int> tempoBpm = GeneratedColumn<int>(
    'tempo_bpm',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    songId,
    pieceTitle,
    minutes,
    mood,
    tempoBpm,
    note,
    loggedAt,
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
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(
        _songIdMeta,
        songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta),
      );
    }
    if (data.containsKey('piece_title')) {
      context.handle(
        _pieceTitleMeta,
        pieceTitle.isAcceptableOrUnknown(data['piece_title']!, _pieceTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_pieceTitleMeta);
    }
    if (data.containsKey('minutes')) {
      context.handle(
        _minutesMeta,
        minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta),
      );
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('tempo_bpm')) {
      context.handle(
        _tempoBpmMeta,
        tempoBpm.isAcceptableOrUnknown(data['tempo_bpm']!, _tempoBpmMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
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
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
      songId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}song_id'],
      ),
      pieceTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}piece_title'],
      )!,
      minutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes'],
      )!,
      mood: $PracticeLogsTable.$convertermoodn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}mood'],
        ),
      ),
      tempoBpm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tempo_bpm'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $PracticeLogsTable createAlias(String alias) {
    return $PracticeLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PieceMood, String, String> $convertermood =
      const EnumNameConverter<PieceMood>(PieceMood.values);
  static JsonTypeConverter2<PieceMood?, String?, String?> $convertermoodn =
      JsonTypeConverter2.asNullable($convertermood);
}

class PracticeLog extends DataClass implements Insertable<PracticeLog> {
  final int id;
  final int sessionId;
  final int? songId;
  final String pieceTitle;
  final int minutes;
  final PieceMood? mood;
  final int? tempoBpm;
  final String? note;
  final DateTime loggedAt;
  const PracticeLog({
    required this.id,
    required this.sessionId,
    this.songId,
    required this.pieceTitle,
    required this.minutes,
    this.mood,
    this.tempoBpm,
    this.note,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    if (!nullToAbsent || songId != null) {
      map['song_id'] = Variable<int>(songId);
    }
    map['piece_title'] = Variable<String>(pieceTitle);
    map['minutes'] = Variable<int>(minutes);
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<String>(
        $PracticeLogsTable.$convertermoodn.toSql(mood),
      );
    }
    if (!nullToAbsent || tempoBpm != null) {
      map['tempo_bpm'] = Variable<int>(tempoBpm);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  PracticeLogsCompanion toCompanion(bool nullToAbsent) {
    return PracticeLogsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      songId: songId == null && nullToAbsent
          ? const Value.absent()
          : Value(songId),
      pieceTitle: Value(pieceTitle),
      minutes: Value(minutes),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      tempoBpm: tempoBpm == null && nullToAbsent
          ? const Value.absent()
          : Value(tempoBpm),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      loggedAt: Value(loggedAt),
    );
  }

  factory PracticeLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeLog(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      songId: serializer.fromJson<int?>(json['songId']),
      pieceTitle: serializer.fromJson<String>(json['pieceTitle']),
      minutes: serializer.fromJson<int>(json['minutes']),
      mood: $PracticeLogsTable.$convertermoodn.fromJson(
        serializer.fromJson<String?>(json['mood']),
      ),
      tempoBpm: serializer.fromJson<int?>(json['tempoBpm']),
      note: serializer.fromJson<String?>(json['note']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'songId': serializer.toJson<int?>(songId),
      'pieceTitle': serializer.toJson<String>(pieceTitle),
      'minutes': serializer.toJson<int>(minutes),
      'mood': serializer.toJson<String?>(
        $PracticeLogsTable.$convertermoodn.toJson(mood),
      ),
      'tempoBpm': serializer.toJson<int?>(tempoBpm),
      'note': serializer.toJson<String?>(note),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  PracticeLog copyWith({
    int? id,
    int? sessionId,
    Value<int?> songId = const Value.absent(),
    String? pieceTitle,
    int? minutes,
    Value<PieceMood?> mood = const Value.absent(),
    Value<int?> tempoBpm = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? loggedAt,
  }) => PracticeLog(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    songId: songId.present ? songId.value : this.songId,
    pieceTitle: pieceTitle ?? this.pieceTitle,
    minutes: minutes ?? this.minutes,
    mood: mood.present ? mood.value : this.mood,
    tempoBpm: tempoBpm.present ? tempoBpm.value : this.tempoBpm,
    note: note.present ? note.value : this.note,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  PracticeLog copyWithCompanion(PracticeLogsCompanion data) {
    return PracticeLog(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      songId: data.songId.present ? data.songId.value : this.songId,
      pieceTitle: data.pieceTitle.present
          ? data.pieceTitle.value
          : this.pieceTitle,
      minutes: data.minutes.present ? data.minutes.value : this.minutes,
      mood: data.mood.present ? data.mood.value : this.mood,
      tempoBpm: data.tempoBpm.present ? data.tempoBpm.value : this.tempoBpm,
      note: data.note.present ? data.note.value : this.note,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeLog(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('songId: $songId, ')
          ..write('pieceTitle: $pieceTitle, ')
          ..write('minutes: $minutes, ')
          ..write('mood: $mood, ')
          ..write('tempoBpm: $tempoBpm, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    songId,
    pieceTitle,
    minutes,
    mood,
    tempoBpm,
    note,
    loggedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeLog &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.songId == this.songId &&
          other.pieceTitle == this.pieceTitle &&
          other.minutes == this.minutes &&
          other.mood == this.mood &&
          other.tempoBpm == this.tempoBpm &&
          other.note == this.note &&
          other.loggedAt == this.loggedAt);
}

class PracticeLogsCompanion extends UpdateCompanion<PracticeLog> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<int?> songId;
  final Value<String> pieceTitle;
  final Value<int> minutes;
  final Value<PieceMood?> mood;
  final Value<int?> tempoBpm;
  final Value<String?> note;
  final Value<DateTime> loggedAt;
  const PracticeLogsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.songId = const Value.absent(),
    this.pieceTitle = const Value.absent(),
    this.minutes = const Value.absent(),
    this.mood = const Value.absent(),
    this.tempoBpm = const Value.absent(),
    this.note = const Value.absent(),
    this.loggedAt = const Value.absent(),
  });
  PracticeLogsCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    this.songId = const Value.absent(),
    required String pieceTitle,
    required int minutes,
    this.mood = const Value.absent(),
    this.tempoBpm = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime loggedAt,
  }) : sessionId = Value(sessionId),
       pieceTitle = Value(pieceTitle),
       minutes = Value(minutes),
       loggedAt = Value(loggedAt);
  static Insertable<PracticeLog> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<int>? songId,
    Expression<String>? pieceTitle,
    Expression<int>? minutes,
    Expression<String>? mood,
    Expression<int>? tempoBpm,
    Expression<String>? note,
    Expression<DateTime>? loggedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (songId != null) 'song_id': songId,
      if (pieceTitle != null) 'piece_title': pieceTitle,
      if (minutes != null) 'minutes': minutes,
      if (mood != null) 'mood': mood,
      if (tempoBpm != null) 'tempo_bpm': tempoBpm,
      if (note != null) 'note': note,
      if (loggedAt != null) 'logged_at': loggedAt,
    });
  }

  PracticeLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? sessionId,
    Value<int?>? songId,
    Value<String>? pieceTitle,
    Value<int>? minutes,
    Value<PieceMood?>? mood,
    Value<int?>? tempoBpm,
    Value<String?>? note,
    Value<DateTime>? loggedAt,
  }) {
    return PracticeLogsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      songId: songId ?? this.songId,
      pieceTitle: pieceTitle ?? this.pieceTitle,
      minutes: minutes ?? this.minutes,
      mood: mood ?? this.mood,
      tempoBpm: tempoBpm ?? this.tempoBpm,
      note: note ?? this.note,
      loggedAt: loggedAt ?? this.loggedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    if (pieceTitle.present) {
      map['piece_title'] = Variable<String>(pieceTitle.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(
        $PracticeLogsTable.$convertermoodn.toSql(mood.value),
      );
    }
    if (tempoBpm.present) {
      map['tempo_bpm'] = Variable<int>(tempoBpm.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeLogsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('songId: $songId, ')
          ..write('pieceTitle: $pieceTitle, ')
          ..write('minutes: $minutes, ')
          ..write('mood: $mood, ')
          ..write('tempoBpm: $tempoBpm, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt')
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
      minTextLength: 1,
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
      minTextLength: 1,
      maxTextLength: 160,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _composerMeta = const VerificationMeta(
    'composer',
  );
  @override
  late final GeneratedColumn<String> composer = GeneratedColumn<String>(
    'composer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PieceStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('learning'),
      ).withConverter<PieceStatus>($SongsTable.$converterstatus);
  static const VerificationMeta _targetBpmMeta = const VerificationMeta(
    'targetBpm',
  );
  @override
  late final GeneratedColumn<int> targetBpm = GeneratedColumn<int>(
    'target_bpm',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, composer, status, targetBpm];
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
    if (data.containsKey('composer')) {
      context.handle(
        _composerMeta,
        composer.isAcceptableOrUnknown(data['composer']!, _composerMeta),
      );
    }
    if (data.containsKey('target_bpm')) {
      context.handle(
        _targetBpmMeta,
        targetBpm.isAcceptableOrUnknown(data['target_bpm']!, _targetBpmMeta),
      );
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
      composer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}composer'],
      ),
      status: $SongsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      targetBpm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_bpm'],
      ),
    );
  }

  @override
  $SongsTable createAlias(String alias) {
    return $SongsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PieceStatus, String, String> $converterstatus =
      const EnumNameConverter<PieceStatus>(PieceStatus.values);
}

class Song extends DataClass implements Insertable<Song> {
  final int id;
  final String name;
  final String? composer;
  final PieceStatus status;
  final int? targetBpm;
  const Song({
    required this.id,
    required this.name,
    this.composer,
    required this.status,
    this.targetBpm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || composer != null) {
      map['composer'] = Variable<String>(composer);
    }
    {
      map['status'] = Variable<String>(
        $SongsTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || targetBpm != null) {
      map['target_bpm'] = Variable<int>(targetBpm);
    }
    return map;
  }

  SongsCompanion toCompanion(bool nullToAbsent) {
    return SongsCompanion(
      id: Value(id),
      name: Value(name),
      composer: composer == null && nullToAbsent
          ? const Value.absent()
          : Value(composer),
      status: Value(status),
      targetBpm: targetBpm == null && nullToAbsent
          ? const Value.absent()
          : Value(targetBpm),
    );
  }

  factory Song.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Song(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      composer: serializer.fromJson<String?>(json['composer']),
      status: $SongsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      targetBpm: serializer.fromJson<int?>(json['targetBpm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'composer': serializer.toJson<String?>(composer),
      'status': serializer.toJson<String>(
        $SongsTable.$converterstatus.toJson(status),
      ),
      'targetBpm': serializer.toJson<int?>(targetBpm),
    };
  }

  Song copyWith({
    int? id,
    String? name,
    Value<String?> composer = const Value.absent(),
    PieceStatus? status,
    Value<int?> targetBpm = const Value.absent(),
  }) => Song(
    id: id ?? this.id,
    name: name ?? this.name,
    composer: composer.present ? composer.value : this.composer,
    status: status ?? this.status,
    targetBpm: targetBpm.present ? targetBpm.value : this.targetBpm,
  );
  Song copyWithCompanion(SongsCompanion data) {
    return Song(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      composer: data.composer.present ? data.composer.value : this.composer,
      status: data.status.present ? data.status.value : this.status,
      targetBpm: data.targetBpm.present ? data.targetBpm.value : this.targetBpm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Song(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('composer: $composer, ')
          ..write('status: $status, ')
          ..write('targetBpm: $targetBpm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, composer, status, targetBpm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song &&
          other.id == this.id &&
          other.name == this.name &&
          other.composer == this.composer &&
          other.status == this.status &&
          other.targetBpm == this.targetBpm);
}

class SongsCompanion extends UpdateCompanion<Song> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> composer;
  final Value<PieceStatus> status;
  final Value<int?> targetBpm;
  const SongsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.composer = const Value.absent(),
    this.status = const Value.absent(),
    this.targetBpm = const Value.absent(),
  });
  SongsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.composer = const Value.absent(),
    this.status = const Value.absent(),
    this.targetBpm = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Song> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? composer,
    Expression<String>? status,
    Expression<int>? targetBpm,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (composer != null) 'composer': composer,
      if (status != null) 'status': status,
      if (targetBpm != null) 'target_bpm': targetBpm,
    });
  }

  SongsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? composer,
    Value<PieceStatus>? status,
    Value<int?>? targetBpm,
  }) {
    return SongsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      composer: composer ?? this.composer,
      status: status ?? this.status,
      targetBpm: targetBpm ?? this.targetBpm,
    );
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
    if (composer.present) {
      map['composer'] = Variable<String>(composer.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $SongsTable.$converterstatus.toSql(status.value),
      );
    }
    if (targetBpm.present) {
      map['target_bpm'] = Variable<int>(targetBpm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('composer: $composer, ')
          ..write('status: $status, ')
          ..write('targetBpm: $targetBpm')
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
  late final $PracticeSessionsTable practiceSessions = $PracticeSessionsTable(
    this,
  );
  late final $PracticeLogsTable practiceLogs = $PracticeLogsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $FeelingsTable feelings = $FeelingsTable(this);
  late final $SongsTable songs = $SongsTable(this);
  late final $TagsAssignedTable tagsAssigned = $TagsAssignedTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    metrics,
    practiceSessions,
    practiceLogs,
    tags,
    feelings,
    songs,
    tagsAssigned,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
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
    MetricsCompanion Function({Value<int> id, required int dailyGoalInMinutes});
typedef $$MetricsTableUpdateCompanionBuilder =
    MetricsCompanion Function({Value<int> id, Value<int> dailyGoalInMinutes});

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

  ColumnFilters<int> get dailyGoalInMinutes => $composableBuilder(
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

  ColumnOrderings<int> get dailyGoalInMinutes => $composableBuilder(
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

  GeneratedColumn<int> get dailyGoalInMinutes => $composableBuilder(
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
                Value<int> dailyGoalInMinutes = const Value.absent(),
              }) => MetricsCompanion(
                id: id,
                dailyGoalInMinutes: dailyGoalInMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dailyGoalInMinutes,
              }) => MetricsCompanion.insert(
                id: id,
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
typedef $$PracticeSessionsTableCreateCompanionBuilder =
    PracticeSessionsCompanion Function({
      Value<int> id,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
    });
typedef $$PracticeSessionsTableUpdateCompanionBuilder =
    PracticeSessionsCompanion Function({
      Value<int> id,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
    });

final class $$PracticeSessionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $PracticeSessionsTable, PracticeSession> {
  $$PracticeSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PracticeLogsTable, List<PracticeLog>>
  _practiceLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.practiceLogs,
    aliasName: $_aliasNameGenerator(
      db.practiceSessions.id,
      db.practiceLogs.sessionId,
    ),
  );

  $$PracticeLogsTableProcessedTableManager get practiceLogsRefs {
    final manager = $$PracticeLogsTableTableManager(
      $_db,
      $_db.practiceLogs,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_practiceLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PracticeSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableFilterComposer({
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

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> practiceLogsRefs(
    Expression<bool> Function($$PracticeLogsTableFilterComposer f) f,
  ) {
    final $$PracticeLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.practiceLogs,
      getReferencedColumn: (t) => t.sessionId,
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

class $$PracticeSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PracticeSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  Expression<T> practiceLogsRefs<T extends Object>(
    Expression<T> Function($$PracticeLogsTableAnnotationComposer a) f,
  ) {
    final $$PracticeLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.practiceLogs,
      getReferencedColumn: (t) => t.sessionId,
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

class $$PracticeSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PracticeSessionsTable,
          PracticeSession,
          $$PracticeSessionsTableFilterComposer,
          $$PracticeSessionsTableOrderingComposer,
          $$PracticeSessionsTableAnnotationComposer,
          $$PracticeSessionsTableCreateCompanionBuilder,
          $$PracticeSessionsTableUpdateCompanionBuilder,
          (PracticeSession, $$PracticeSessionsTableReferences),
          PracticeSession,
          PrefetchHooks Function({bool practiceLogsRefs})
        > {
  $$PracticeSessionsTableTableManager(
    _$AppDatabase db,
    $PracticeSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticeSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticeSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticeSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
              }) => PracticeSessionsCompanion(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
              }) => PracticeSessionsCompanion.insert(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PracticeSessionsTableReferences(db, table, e),
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
                      PracticeSession,
                      $PracticeSessionsTable,
                      PracticeLog
                    >(
                      currentTable: table,
                      referencedTable: $$PracticeSessionsTableReferences
                          ._practiceLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PracticeSessionsTableReferences(
                            db,
                            table,
                            p0,
                          ).practiceLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sessionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PracticeSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PracticeSessionsTable,
      PracticeSession,
      $$PracticeSessionsTableFilterComposer,
      $$PracticeSessionsTableOrderingComposer,
      $$PracticeSessionsTableAnnotationComposer,
      $$PracticeSessionsTableCreateCompanionBuilder,
      $$PracticeSessionsTableUpdateCompanionBuilder,
      (PracticeSession, $$PracticeSessionsTableReferences),
      PracticeSession,
      PrefetchHooks Function({bool practiceLogsRefs})
    >;
typedef $$PracticeLogsTableCreateCompanionBuilder =
    PracticeLogsCompanion Function({
      Value<int> id,
      required int sessionId,
      Value<int?> songId,
      required String pieceTitle,
      required int minutes,
      Value<PieceMood?> mood,
      Value<int?> tempoBpm,
      Value<String?> note,
      required DateTime loggedAt,
    });
typedef $$PracticeLogsTableUpdateCompanionBuilder =
    PracticeLogsCompanion Function({
      Value<int> id,
      Value<int> sessionId,
      Value<int?> songId,
      Value<String> pieceTitle,
      Value<int> minutes,
      Value<PieceMood?> mood,
      Value<int?> tempoBpm,
      Value<String?> note,
      Value<DateTime> loggedAt,
    });

final class $$PracticeLogsTableReferences
    extends BaseReferences<_$AppDatabase, $PracticeLogsTable, PracticeLog> {
  $$PracticeLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PracticeSessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.practiceSessions.createAlias(
        $_aliasNameGenerator(db.practiceLogs.sessionId, db.practiceSessions.id),
      );

  $$PracticeSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$PracticeSessionsTableTableManager(
      $_db,
      $_db.practiceSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
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

  ColumnFilters<int> get songId => $composableBuilder(
    column: $table.songId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pieceTitle => $composableBuilder(
    column: $table.pieceTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PieceMood?, PieceMood, String> get mood =>
      $composableBuilder(
        column: $table.mood,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get tempoBpm => $composableBuilder(
    column: $table.tempoBpm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PracticeSessionsTableFilterComposer get sessionId {
    final $$PracticeSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.practiceSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PracticeSessionsTableFilterComposer(
            $db: $db,
            $table: $db.practiceSessions,
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

  ColumnOrderings<int> get songId => $composableBuilder(
    column: $table.songId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pieceTitle => $composableBuilder(
    column: $table.pieceTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tempoBpm => $composableBuilder(
    column: $table.tempoBpm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PracticeSessionsTableOrderingComposer get sessionId {
    final $$PracticeSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.practiceSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PracticeSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.practiceSessions,
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

  GeneratedColumn<int> get songId =>
      $composableBuilder(column: $table.songId, builder: (column) => column);

  GeneratedColumn<String> get pieceTitle => $composableBuilder(
    column: $table.pieceTitle,
    builder: (column) => column,
  );

  GeneratedColumn<int> get minutes =>
      $composableBuilder(column: $table.minutes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PieceMood?, String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<int> get tempoBpm =>
      $composableBuilder(column: $table.tempoBpm, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  $$PracticeSessionsTableAnnotationComposer get sessionId {
    final $$PracticeSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.practiceSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PracticeSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.practiceSessions,
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
          PrefetchHooks Function({bool sessionId})
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
                Value<int> sessionId = const Value.absent(),
                Value<int?> songId = const Value.absent(),
                Value<String> pieceTitle = const Value.absent(),
                Value<int> minutes = const Value.absent(),
                Value<PieceMood?> mood = const Value.absent(),
                Value<int?> tempoBpm = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
              }) => PracticeLogsCompanion(
                id: id,
                sessionId: sessionId,
                songId: songId,
                pieceTitle: pieceTitle,
                minutes: minutes,
                mood: mood,
                tempoBpm: tempoBpm,
                note: note,
                loggedAt: loggedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sessionId,
                Value<int?> songId = const Value.absent(),
                required String pieceTitle,
                required int minutes,
                Value<PieceMood?> mood = const Value.absent(),
                Value<int?> tempoBpm = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime loggedAt,
              }) => PracticeLogsCompanion.insert(
                id: id,
                sessionId: sessionId,
                songId: songId,
                pieceTitle: pieceTitle,
                minutes: minutes,
                mood: mood,
                tempoBpm: tempoBpm,
                note: note,
                loggedAt: loggedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PracticeLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
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
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable: $$PracticeLogsTableReferences
                                    ._sessionIdTable(db),
                                referencedColumn: $$PracticeLogsTableReferences
                                    ._sessionIdTable(db)
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
      PrefetchHooks Function({bool sessionId})
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
typedef $$FeelingsTableCreateCompanionBuilder =
    FeelingsCompanion Function({Value<int> id, required String name});
typedef $$FeelingsTableUpdateCompanionBuilder =
    FeelingsCompanion Function({Value<int> id, Value<String> name});

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
          (Feeling, BaseReferences<_$AppDatabase, $FeelingsTable, Feeling>),
          Feeling,
          PrefetchHooks Function()
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (Feeling, BaseReferences<_$AppDatabase, $FeelingsTable, Feeling>),
      Feeling,
      PrefetchHooks Function()
    >;
typedef $$SongsTableCreateCompanionBuilder =
    SongsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> composer,
      Value<PieceStatus> status,
      Value<int?> targetBpm,
    });
typedef $$SongsTableUpdateCompanionBuilder =
    SongsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> composer,
      Value<PieceStatus> status,
      Value<int?> targetBpm,
    });

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

  ColumnFilters<String> get composer => $composableBuilder(
    column: $table.composer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PieceStatus, PieceStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get targetBpm => $composableBuilder(
    column: $table.targetBpm,
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

  ColumnOrderings<String> get composer => $composableBuilder(
    column: $table.composer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetBpm => $composableBuilder(
    column: $table.targetBpm,
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

  GeneratedColumn<String> get composer =>
      $composableBuilder(column: $table.composer, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PieceStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get targetBpm =>
      $composableBuilder(column: $table.targetBpm, builder: (column) => column);

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
                Value<String?> composer = const Value.absent(),
                Value<PieceStatus> status = const Value.absent(),
                Value<int?> targetBpm = const Value.absent(),
              }) => SongsCompanion(
                id: id,
                name: name,
                composer: composer,
                status: status,
                targetBpm: targetBpm,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> composer = const Value.absent(),
                Value<PieceStatus> status = const Value.absent(),
                Value<int?> targetBpm = const Value.absent(),
              }) => SongsCompanion.insert(
                id: id,
                name: name,
                composer: composer,
                status: status,
                targetBpm: targetBpm,
              ),
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
  $$PracticeSessionsTableTableManager get practiceSessions =>
      $$PracticeSessionsTableTableManager(_db, _db.practiceSessions);
  $$PracticeLogsTableTableManager get practiceLogs =>
      $$PracticeLogsTableTableManager(_db, _db.practiceLogs);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$FeelingsTableTableManager get feelings =>
      $$FeelingsTableTableManager(_db, _db.feelings);
  $$SongsTableTableManager get songs =>
      $$SongsTableTableManager(_db, _db.songs);
  $$TagsAssignedTableTableManager get tagsAssigned =>
      $$TagsAssignedTableTableManager(_db, _db.tagsAssigned);
}
