// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otic_database.dart';

// ignore_for_file: type=lint
class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
      'grade', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('en'));
  static const VerificationMeta _interestsJsonMeta =
      const VerificationMeta('interestsJson');
  @override
  late final GeneratedColumn<String> interestsJson = GeneratedColumn<String>(
      'interests_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _learningStyleMeta =
      const VerificationMeta('learningStyle');
  @override
  late final GeneratedColumn<String> learningStyle = GeneratedColumn<String>(
      'learning_style', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unknown'));
  static const VerificationMeta _strengthsJsonMeta =
      const VerificationMeta('strengthsJson');
  @override
  late final GeneratedColumn<String> strengthsJson = GeneratedColumn<String>(
      'strengths_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _weaknessesJsonMeta =
      const VerificationMeta('weaknessesJson');
  @override
  late final GeneratedColumn<String> weaknessesJson = GeneratedColumn<String>(
      'weaknesses_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _goalsJsonMeta =
      const VerificationMeta('goalsJson');
  @override
  late final GeneratedColumn<String> goalsJson = GeneratedColumn<String>(
      'goals_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastActiveAtMeta =
      const VerificationMeta('lastActiveAt');
  @override
  late final GeneratedColumn<DateTime> lastActiveAt = GeneratedColumn<DateTime>(
      'last_active_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        age,
        grade,
        language,
        interestsJson,
        learningStyle,
        strengthsJson,
        weaknessesJson,
        goalsJson,
        createdAt,
        lastActiveAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(Insertable<Student> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('interests_json')) {
      context.handle(
          _interestsJsonMeta,
          interestsJson.isAcceptableOrUnknown(
              data['interests_json']!, _interestsJsonMeta));
    }
    if (data.containsKey('learning_style')) {
      context.handle(
          _learningStyleMeta,
          learningStyle.isAcceptableOrUnknown(
              data['learning_style']!, _learningStyleMeta));
    }
    if (data.containsKey('strengths_json')) {
      context.handle(
          _strengthsJsonMeta,
          strengthsJson.isAcceptableOrUnknown(
              data['strengths_json']!, _strengthsJsonMeta));
    }
    if (data.containsKey('weaknesses_json')) {
      context.handle(
          _weaknessesJsonMeta,
          weaknessesJson.isAcceptableOrUnknown(
              data['weaknesses_json']!, _weaknessesJsonMeta));
    }
    if (data.containsKey('goals_json')) {
      context.handle(_goalsJsonMeta,
          goalsJson.isAcceptableOrUnknown(data['goals_json']!, _goalsJsonMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_active_at')) {
      context.handle(
          _lastActiveAtMeta,
          lastActiveAt.isAcceptableOrUnknown(
              data['last_active_at']!, _lastActiveAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grade']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      interestsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}interests_json'])!,
      learningStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}learning_style'])!,
      strengthsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}strengths_json'])!,
      weaknessesJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}weaknesses_json'])!,
      goalsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goals_json'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastActiveAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_active_at'])!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String name;
  final int? age;
  final String? grade;
  final String language;
  final String interestsJson;
  final String learningStyle;
  final String strengthsJson;
  final String weaknessesJson;
  final String goalsJson;
  final DateTime createdAt;
  final DateTime lastActiveAt;
  const Student(
      {required this.id,
      required this.name,
      this.age,
      this.grade,
      required this.language,
      required this.interestsJson,
      required this.learningStyle,
      required this.strengthsJson,
      required this.weaknessesJson,
      required this.goalsJson,
      required this.createdAt,
      required this.lastActiveAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || grade != null) {
      map['grade'] = Variable<String>(grade);
    }
    map['language'] = Variable<String>(language);
    map['interests_json'] = Variable<String>(interestsJson);
    map['learning_style'] = Variable<String>(learningStyle);
    map['strengths_json'] = Variable<String>(strengthsJson);
    map['weaknesses_json'] = Variable<String>(weaknessesJson);
    map['goals_json'] = Variable<String>(goalsJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['last_active_at'] = Variable<DateTime>(lastActiveAt);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      name: Value(name),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      grade:
          grade == null && nullToAbsent ? const Value.absent() : Value(grade),
      language: Value(language),
      interestsJson: Value(interestsJson),
      learningStyle: Value(learningStyle),
      strengthsJson: Value(strengthsJson),
      weaknessesJson: Value(weaknessesJson),
      goalsJson: Value(goalsJson),
      createdAt: Value(createdAt),
      lastActiveAt: Value(lastActiveAt),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int?>(json['age']),
      grade: serializer.fromJson<String?>(json['grade']),
      language: serializer.fromJson<String>(json['language']),
      interestsJson: serializer.fromJson<String>(json['interestsJson']),
      learningStyle: serializer.fromJson<String>(json['learningStyle']),
      strengthsJson: serializer.fromJson<String>(json['strengthsJson']),
      weaknessesJson: serializer.fromJson<String>(json['weaknessesJson']),
      goalsJson: serializer.fromJson<String>(json['goalsJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastActiveAt: serializer.fromJson<DateTime>(json['lastActiveAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int?>(age),
      'grade': serializer.toJson<String?>(grade),
      'language': serializer.toJson<String>(language),
      'interestsJson': serializer.toJson<String>(interestsJson),
      'learningStyle': serializer.toJson<String>(learningStyle),
      'strengthsJson': serializer.toJson<String>(strengthsJson),
      'weaknessesJson': serializer.toJson<String>(weaknessesJson),
      'goalsJson': serializer.toJson<String>(goalsJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastActiveAt': serializer.toJson<DateTime>(lastActiveAt),
    };
  }

  Student copyWith(
          {int? id,
          String? name,
          Value<int?> age = const Value.absent(),
          Value<String?> grade = const Value.absent(),
          String? language,
          String? interestsJson,
          String? learningStyle,
          String? strengthsJson,
          String? weaknessesJson,
          String? goalsJson,
          DateTime? createdAt,
          DateTime? lastActiveAt}) =>
      Student(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age.present ? age.value : this.age,
        grade: grade.present ? grade.value : this.grade,
        language: language ?? this.language,
        interestsJson: interestsJson ?? this.interestsJson,
        learningStyle: learningStyle ?? this.learningStyle,
        strengthsJson: strengthsJson ?? this.strengthsJson,
        weaknessesJson: weaknessesJson ?? this.weaknessesJson,
        goalsJson: goalsJson ?? this.goalsJson,
        createdAt: createdAt ?? this.createdAt,
        lastActiveAt: lastActiveAt ?? this.lastActiveAt,
      );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      grade: data.grade.present ? data.grade.value : this.grade,
      language: data.language.present ? data.language.value : this.language,
      interestsJson: data.interestsJson.present
          ? data.interestsJson.value
          : this.interestsJson,
      learningStyle: data.learningStyle.present
          ? data.learningStyle.value
          : this.learningStyle,
      strengthsJson: data.strengthsJson.present
          ? data.strengthsJson.value
          : this.strengthsJson,
      weaknessesJson: data.weaknessesJson.present
          ? data.weaknessesJson.value
          : this.weaknessesJson,
      goalsJson: data.goalsJson.present ? data.goalsJson.value : this.goalsJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastActiveAt: data.lastActiveAt.present
          ? data.lastActiveAt.value
          : this.lastActiveAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('grade: $grade, ')
          ..write('language: $language, ')
          ..write('interestsJson: $interestsJson, ')
          ..write('learningStyle: $learningStyle, ')
          ..write('strengthsJson: $strengthsJson, ')
          ..write('weaknessesJson: $weaknessesJson, ')
          ..write('goalsJson: $goalsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastActiveAt: $lastActiveAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      age,
      grade,
      language,
      interestsJson,
      learningStyle,
      strengthsJson,
      weaknessesJson,
      goalsJson,
      createdAt,
      lastActiveAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.grade == this.grade &&
          other.language == this.language &&
          other.interestsJson == this.interestsJson &&
          other.learningStyle == this.learningStyle &&
          other.strengthsJson == this.strengthsJson &&
          other.weaknessesJson == this.weaknessesJson &&
          other.goalsJson == this.goalsJson &&
          other.createdAt == this.createdAt &&
          other.lastActiveAt == this.lastActiveAt);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> age;
  final Value<String?> grade;
  final Value<String> language;
  final Value<String> interestsJson;
  final Value<String> learningStyle;
  final Value<String> strengthsJson;
  final Value<String> weaknessesJson;
  final Value<String> goalsJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastActiveAt;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.grade = const Value.absent(),
    this.language = const Value.absent(),
    this.interestsJson = const Value.absent(),
    this.learningStyle = const Value.absent(),
    this.strengthsJson = const Value.absent(),
    this.weaknessesJson = const Value.absent(),
    this.goalsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastActiveAt = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.age = const Value.absent(),
    this.grade = const Value.absent(),
    this.language = const Value.absent(),
    this.interestsJson = const Value.absent(),
    this.learningStyle = const Value.absent(),
    this.strengthsJson = const Value.absent(),
    this.weaknessesJson = const Value.absent(),
    this.goalsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastActiveAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? grade,
    Expression<String>? language,
    Expression<String>? interestsJson,
    Expression<String>? learningStyle,
    Expression<String>? strengthsJson,
    Expression<String>? weaknessesJson,
    Expression<String>? goalsJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastActiveAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (grade != null) 'grade': grade,
      if (language != null) 'language': language,
      if (interestsJson != null) 'interests_json': interestsJson,
      if (learningStyle != null) 'learning_style': learningStyle,
      if (strengthsJson != null) 'strengths_json': strengthsJson,
      if (weaknessesJson != null) 'weaknesses_json': weaknessesJson,
      if (goalsJson != null) 'goals_json': goalsJson,
      if (createdAt != null) 'created_at': createdAt,
      if (lastActiveAt != null) 'last_active_at': lastActiveAt,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? age,
      Value<String?>? grade,
      Value<String>? language,
      Value<String>? interestsJson,
      Value<String>? learningStyle,
      Value<String>? strengthsJson,
      Value<String>? weaknessesJson,
      Value<String>? goalsJson,
      Value<DateTime>? createdAt,
      Value<DateTime>? lastActiveAt}) {
    return StudentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      grade: grade ?? this.grade,
      language: language ?? this.language,
      interestsJson: interestsJson ?? this.interestsJson,
      learningStyle: learningStyle ?? this.learningStyle,
      strengthsJson: strengthsJson ?? this.strengthsJson,
      weaknessesJson: weaknessesJson ?? this.weaknessesJson,
      goalsJson: goalsJson ?? this.goalsJson,
      createdAt: createdAt ?? this.createdAt,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
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
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (interestsJson.present) {
      map['interests_json'] = Variable<String>(interestsJson.value);
    }
    if (learningStyle.present) {
      map['learning_style'] = Variable<String>(learningStyle.value);
    }
    if (strengthsJson.present) {
      map['strengths_json'] = Variable<String>(strengthsJson.value);
    }
    if (weaknessesJson.present) {
      map['weaknesses_json'] = Variable<String>(weaknessesJson.value);
    }
    if (goalsJson.present) {
      map['goals_json'] = Variable<String>(goalsJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastActiveAt.present) {
      map['last_active_at'] = Variable<DateTime>(lastActiveAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('grade: $grade, ')
          ..write('language: $language, ')
          ..write('interestsJson: $interestsJson, ')
          ..write('learningStyle: $learningStyle, ')
          ..write('strengthsJson: $strengthsJson, ')
          ..write('weaknessesJson: $weaknessesJson, ')
          ..write('goalsJson: $goalsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastActiveAt: $lastActiveAt')
          ..write(')'))
        .toString();
  }
}

class $SessionSummariesTable extends SessionSummaries
    with TableInfo<$SessionSummariesTable, SessionSummary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionSummariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES students (id) ON DELETE CASCADE'));
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strengthsJsonMeta =
      const VerificationMeta('strengthsJson');
  @override
  late final GeneratedColumn<String> strengthsJson = GeneratedColumn<String>(
      'strengths_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _weaknessesJsonMeta =
      const VerificationMeta('weaknessesJson');
  @override
  late final GeneratedColumn<String> weaknessesJson = GeneratedColumn<String>(
      'weaknesses_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _highestStageMeta =
      const VerificationMeta('highestStage');
  @override
  late final GeneratedColumn<String> highestStage = GeneratedColumn<String>(
      'highest_stage', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('answer'));
  static const VerificationMeta _messageCountMeta =
      const VerificationMeta('messageCount');
  @override
  late final GeneratedColumn<int> messageCount = GeneratedColumn<int>(
      'message_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sessionAtMeta =
      const VerificationMeta('sessionAt');
  @override
  late final GeneratedColumn<DateTime> sessionAt = GeneratedColumn<DateTime>(
      'session_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        studentId,
        topic,
        summary,
        strengthsJson,
        weaknessesJson,
        highestStage,
        messageCount,
        sessionAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_summaries';
  @override
  VerificationContext validateIntegrity(Insertable<SessionSummary> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('strengths_json')) {
      context.handle(
          _strengthsJsonMeta,
          strengthsJson.isAcceptableOrUnknown(
              data['strengths_json']!, _strengthsJsonMeta));
    }
    if (data.containsKey('weaknesses_json')) {
      context.handle(
          _weaknessesJsonMeta,
          weaknessesJson.isAcceptableOrUnknown(
              data['weaknesses_json']!, _weaknessesJsonMeta));
    }
    if (data.containsKey('highest_stage')) {
      context.handle(
          _highestStageMeta,
          highestStage.isAcceptableOrUnknown(
              data['highest_stage']!, _highestStageMeta));
    }
    if (data.containsKey('message_count')) {
      context.handle(
          _messageCountMeta,
          messageCount.isAcceptableOrUnknown(
              data['message_count']!, _messageCountMeta));
    }
    if (data.containsKey('session_at')) {
      context.handle(_sessionAtMeta,
          sessionAt.isAcceptableOrUnknown(data['session_at']!, _sessionAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionSummary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionSummary(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
      strengthsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}strengths_json'])!,
      weaknessesJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}weaknesses_json'])!,
      highestStage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}highest_stage'])!,
      messageCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}message_count'])!,
      sessionAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}session_at'])!,
    );
  }

  @override
  $SessionSummariesTable createAlias(String alias) {
    return $SessionSummariesTable(attachedDatabase, alias);
  }
}

class SessionSummary extends DataClass implements Insertable<SessionSummary> {
  final int id;
  final int studentId;
  final String topic;
  final String summary;
  final String strengthsJson;
  final String weaknessesJson;
  final String highestStage;
  final int messageCount;
  final DateTime sessionAt;
  const SessionSummary(
      {required this.id,
      required this.studentId,
      required this.topic,
      required this.summary,
      required this.strengthsJson,
      required this.weaknessesJson,
      required this.highestStage,
      required this.messageCount,
      required this.sessionAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['topic'] = Variable<String>(topic);
    map['summary'] = Variable<String>(summary);
    map['strengths_json'] = Variable<String>(strengthsJson);
    map['weaknesses_json'] = Variable<String>(weaknessesJson);
    map['highest_stage'] = Variable<String>(highestStage);
    map['message_count'] = Variable<int>(messageCount);
    map['session_at'] = Variable<DateTime>(sessionAt);
    return map;
  }

  SessionSummariesCompanion toCompanion(bool nullToAbsent) {
    return SessionSummariesCompanion(
      id: Value(id),
      studentId: Value(studentId),
      topic: Value(topic),
      summary: Value(summary),
      strengthsJson: Value(strengthsJson),
      weaknessesJson: Value(weaknessesJson),
      highestStage: Value(highestStage),
      messageCount: Value(messageCount),
      sessionAt: Value(sessionAt),
    );
  }

  factory SessionSummary.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionSummary(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      topic: serializer.fromJson<String>(json['topic']),
      summary: serializer.fromJson<String>(json['summary']),
      strengthsJson: serializer.fromJson<String>(json['strengthsJson']),
      weaknessesJson: serializer.fromJson<String>(json['weaknessesJson']),
      highestStage: serializer.fromJson<String>(json['highestStage']),
      messageCount: serializer.fromJson<int>(json['messageCount']),
      sessionAt: serializer.fromJson<DateTime>(json['sessionAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'topic': serializer.toJson<String>(topic),
      'summary': serializer.toJson<String>(summary),
      'strengthsJson': serializer.toJson<String>(strengthsJson),
      'weaknessesJson': serializer.toJson<String>(weaknessesJson),
      'highestStage': serializer.toJson<String>(highestStage),
      'messageCount': serializer.toJson<int>(messageCount),
      'sessionAt': serializer.toJson<DateTime>(sessionAt),
    };
  }

  SessionSummary copyWith(
          {int? id,
          int? studentId,
          String? topic,
          String? summary,
          String? strengthsJson,
          String? weaknessesJson,
          String? highestStage,
          int? messageCount,
          DateTime? sessionAt}) =>
      SessionSummary(
        id: id ?? this.id,
        studentId: studentId ?? this.studentId,
        topic: topic ?? this.topic,
        summary: summary ?? this.summary,
        strengthsJson: strengthsJson ?? this.strengthsJson,
        weaknessesJson: weaknessesJson ?? this.weaknessesJson,
        highestStage: highestStage ?? this.highestStage,
        messageCount: messageCount ?? this.messageCount,
        sessionAt: sessionAt ?? this.sessionAt,
      );
  SessionSummary copyWithCompanion(SessionSummariesCompanion data) {
    return SessionSummary(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      topic: data.topic.present ? data.topic.value : this.topic,
      summary: data.summary.present ? data.summary.value : this.summary,
      strengthsJson: data.strengthsJson.present
          ? data.strengthsJson.value
          : this.strengthsJson,
      weaknessesJson: data.weaknessesJson.present
          ? data.weaknessesJson.value
          : this.weaknessesJson,
      highestStage: data.highestStage.present
          ? data.highestStage.value
          : this.highestStage,
      messageCount: data.messageCount.present
          ? data.messageCount.value
          : this.messageCount,
      sessionAt: data.sessionAt.present ? data.sessionAt.value : this.sessionAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionSummary(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('topic: $topic, ')
          ..write('summary: $summary, ')
          ..write('strengthsJson: $strengthsJson, ')
          ..write('weaknessesJson: $weaknessesJson, ')
          ..write('highestStage: $highestStage, ')
          ..write('messageCount: $messageCount, ')
          ..write('sessionAt: $sessionAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, studentId, topic, summary, strengthsJson,
      weaknessesJson, highestStage, messageCount, sessionAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionSummary &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.topic == this.topic &&
          other.summary == this.summary &&
          other.strengthsJson == this.strengthsJson &&
          other.weaknessesJson == this.weaknessesJson &&
          other.highestStage == this.highestStage &&
          other.messageCount == this.messageCount &&
          other.sessionAt == this.sessionAt);
}

class SessionSummariesCompanion extends UpdateCompanion<SessionSummary> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<String> topic;
  final Value<String> summary;
  final Value<String> strengthsJson;
  final Value<String> weaknessesJson;
  final Value<String> highestStage;
  final Value<int> messageCount;
  final Value<DateTime> sessionAt;
  const SessionSummariesCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.topic = const Value.absent(),
    this.summary = const Value.absent(),
    this.strengthsJson = const Value.absent(),
    this.weaknessesJson = const Value.absent(),
    this.highestStage = const Value.absent(),
    this.messageCount = const Value.absent(),
    this.sessionAt = const Value.absent(),
  });
  SessionSummariesCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required String topic,
    required String summary,
    this.strengthsJson = const Value.absent(),
    this.weaknessesJson = const Value.absent(),
    this.highestStage = const Value.absent(),
    this.messageCount = const Value.absent(),
    this.sessionAt = const Value.absent(),
  })  : studentId = Value(studentId),
        topic = Value(topic),
        summary = Value(summary);
  static Insertable<SessionSummary> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<String>? topic,
    Expression<String>? summary,
    Expression<String>? strengthsJson,
    Expression<String>? weaknessesJson,
    Expression<String>? highestStage,
    Expression<int>? messageCount,
    Expression<DateTime>? sessionAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (topic != null) 'topic': topic,
      if (summary != null) 'summary': summary,
      if (strengthsJson != null) 'strengths_json': strengthsJson,
      if (weaknessesJson != null) 'weaknesses_json': weaknessesJson,
      if (highestStage != null) 'highest_stage': highestStage,
      if (messageCount != null) 'message_count': messageCount,
      if (sessionAt != null) 'session_at': sessionAt,
    });
  }

  SessionSummariesCompanion copyWith(
      {Value<int>? id,
      Value<int>? studentId,
      Value<String>? topic,
      Value<String>? summary,
      Value<String>? strengthsJson,
      Value<String>? weaknessesJson,
      Value<String>? highestStage,
      Value<int>? messageCount,
      Value<DateTime>? sessionAt}) {
    return SessionSummariesCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      topic: topic ?? this.topic,
      summary: summary ?? this.summary,
      strengthsJson: strengthsJson ?? this.strengthsJson,
      weaknessesJson: weaknessesJson ?? this.weaknessesJson,
      highestStage: highestStage ?? this.highestStage,
      messageCount: messageCount ?? this.messageCount,
      sessionAt: sessionAt ?? this.sessionAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (strengthsJson.present) {
      map['strengths_json'] = Variable<String>(strengthsJson.value);
    }
    if (weaknessesJson.present) {
      map['weaknesses_json'] = Variable<String>(weaknessesJson.value);
    }
    if (highestStage.present) {
      map['highest_stage'] = Variable<String>(highestStage.value);
    }
    if (messageCount.present) {
      map['message_count'] = Variable<int>(messageCount.value);
    }
    if (sessionAt.present) {
      map['session_at'] = Variable<DateTime>(sessionAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionSummariesCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('topic: $topic, ')
          ..write('summary: $summary, ')
          ..write('strengthsJson: $strengthsJson, ')
          ..write('weaknessesJson: $weaknessesJson, ')
          ..write('highestStage: $highestStage, ')
          ..write('messageCount: $messageCount, ')
          ..write('sessionAt: $sessionAt')
          ..write(')'))
        .toString();
  }
}

class $TopicProgressTable extends TopicProgress
    with TableInfo<$TopicProgressTable, TopicProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES students (id) ON DELETE CASCADE'));
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sessionsCountMeta =
      const VerificationMeta('sessionsCount');
  @override
  late final GeneratedColumn<int> sessionsCount = GeneratedColumn<int>(
      'sessions_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastStudiedAtMeta =
      const VerificationMeta('lastStudiedAt');
  @override
  late final GeneratedColumn<DateTime> lastStudiedAt =
      GeneratedColumn<DateTime>('last_studied_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, studentId, topic, level, sessionsCount, lastStudiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topic_progress';
  @override
  VerificationContext validateIntegrity(Insertable<TopicProgressData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    }
    if (data.containsKey('sessions_count')) {
      context.handle(
          _sessionsCountMeta,
          sessionsCount.isAcceptableOrUnknown(
              data['sessions_count']!, _sessionsCountMeta));
    }
    if (data.containsKey('last_studied_at')) {
      context.handle(
          _lastStudiedAtMeta,
          lastStudiedAt.isAcceptableOrUnknown(
              data['last_studied_at']!, _lastStudiedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {studentId, topic},
      ];
  @override
  TopicProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicProgressData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      sessionsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sessions_count'])!,
      lastStudiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_studied_at'])!,
    );
  }

  @override
  $TopicProgressTable createAlias(String alias) {
    return $TopicProgressTable(attachedDatabase, alias);
  }
}

class TopicProgressData extends DataClass
    implements Insertable<TopicProgressData> {
  final int id;
  final int studentId;
  final String topic;
  final int level;
  final int sessionsCount;
  final DateTime lastStudiedAt;
  const TopicProgressData(
      {required this.id,
      required this.studentId,
      required this.topic,
      required this.level,
      required this.sessionsCount,
      required this.lastStudiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['topic'] = Variable<String>(topic);
    map['level'] = Variable<int>(level);
    map['sessions_count'] = Variable<int>(sessionsCount);
    map['last_studied_at'] = Variable<DateTime>(lastStudiedAt);
    return map;
  }

  TopicProgressCompanion toCompanion(bool nullToAbsent) {
    return TopicProgressCompanion(
      id: Value(id),
      studentId: Value(studentId),
      topic: Value(topic),
      level: Value(level),
      sessionsCount: Value(sessionsCount),
      lastStudiedAt: Value(lastStudiedAt),
    );
  }

  factory TopicProgressData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicProgressData(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      topic: serializer.fromJson<String>(json['topic']),
      level: serializer.fromJson<int>(json['level']),
      sessionsCount: serializer.fromJson<int>(json['sessionsCount']),
      lastStudiedAt: serializer.fromJson<DateTime>(json['lastStudiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'topic': serializer.toJson<String>(topic),
      'level': serializer.toJson<int>(level),
      'sessionsCount': serializer.toJson<int>(sessionsCount),
      'lastStudiedAt': serializer.toJson<DateTime>(lastStudiedAt),
    };
  }

  TopicProgressData copyWith(
          {int? id,
          int? studentId,
          String? topic,
          int? level,
          int? sessionsCount,
          DateTime? lastStudiedAt}) =>
      TopicProgressData(
        id: id ?? this.id,
        studentId: studentId ?? this.studentId,
        topic: topic ?? this.topic,
        level: level ?? this.level,
        sessionsCount: sessionsCount ?? this.sessionsCount,
        lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
      );
  TopicProgressData copyWithCompanion(TopicProgressCompanion data) {
    return TopicProgressData(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      topic: data.topic.present ? data.topic.value : this.topic,
      level: data.level.present ? data.level.value : this.level,
      sessionsCount: data.sessionsCount.present
          ? data.sessionsCount.value
          : this.sessionsCount,
      lastStudiedAt: data.lastStudiedAt.present
          ? data.lastStudiedAt.value
          : this.lastStudiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicProgressData(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('topic: $topic, ')
          ..write('level: $level, ')
          ..write('sessionsCount: $sessionsCount, ')
          ..write('lastStudiedAt: $lastStudiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, studentId, topic, level, sessionsCount, lastStudiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicProgressData &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.topic == this.topic &&
          other.level == this.level &&
          other.sessionsCount == this.sessionsCount &&
          other.lastStudiedAt == this.lastStudiedAt);
}

class TopicProgressCompanion extends UpdateCompanion<TopicProgressData> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<String> topic;
  final Value<int> level;
  final Value<int> sessionsCount;
  final Value<DateTime> lastStudiedAt;
  const TopicProgressCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.topic = const Value.absent(),
    this.level = const Value.absent(),
    this.sessionsCount = const Value.absent(),
    this.lastStudiedAt = const Value.absent(),
  });
  TopicProgressCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required String topic,
    this.level = const Value.absent(),
    this.sessionsCount = const Value.absent(),
    this.lastStudiedAt = const Value.absent(),
  })  : studentId = Value(studentId),
        topic = Value(topic);
  static Insertable<TopicProgressData> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<String>? topic,
    Expression<int>? level,
    Expression<int>? sessionsCount,
    Expression<DateTime>? lastStudiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (topic != null) 'topic': topic,
      if (level != null) 'level': level,
      if (sessionsCount != null) 'sessions_count': sessionsCount,
      if (lastStudiedAt != null) 'last_studied_at': lastStudiedAt,
    });
  }

  TopicProgressCompanion copyWith(
      {Value<int>? id,
      Value<int>? studentId,
      Value<String>? topic,
      Value<int>? level,
      Value<int>? sessionsCount,
      Value<DateTime>? lastStudiedAt}) {
    return TopicProgressCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      topic: topic ?? this.topic,
      level: level ?? this.level,
      sessionsCount: sessionsCount ?? this.sessionsCount,
      lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (sessionsCount.present) {
      map['sessions_count'] = Variable<int>(sessionsCount.value);
    }
    if (lastStudiedAt.present) {
      map['last_studied_at'] = Variable<DateTime>(lastStudiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicProgressCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('topic: $topic, ')
          ..write('level: $level, ')
          ..write('sessionsCount: $sessionsCount, ')
          ..write('lastStudiedAt: $lastStudiedAt')
          ..write(')'))
        .toString();
  }
}

class $LearningPathsTable extends LearningPaths
    with TableInfo<$LearningPathsTable, LearningPath> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningPathsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES students (id) ON DELETE CASCADE'));
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitsJsonMeta =
      const VerificationMeta('unitsJson');
  @override
  late final GeneratedColumn<String> unitsJson = GeneratedColumn<String>(
      'units_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _totalLessonsMeta =
      const VerificationMeta('totalLessons');
  @override
  late final GeneratedColumn<int> totalLessons = GeneratedColumn<int>(
      'total_lessons', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _completedLessonsMeta =
      const VerificationMeta('completedLessons');
  @override
  late final GeneratedColumn<int> completedLessons = GeneratedColumn<int>(
      'completed_lessons', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _currentUnitMeta =
      const VerificationMeta('currentUnit');
  @override
  late final GeneratedColumn<int> currentUnit = GeneratedColumn<int>(
      'current_unit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _currentLessonMeta =
      const VerificationMeta('currentLesson');
  @override
  late final GeneratedColumn<int> currentLesson = GeneratedColumn<int>(
      'current_lesson', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _generatedAtMeta =
      const VerificationMeta('generatedAt');
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
      'generated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastAccessedAtMeta =
      const VerificationMeta('lastAccessedAt');
  @override
  late final GeneratedColumn<DateTime> lastAccessedAt =
      GeneratedColumn<DateTime>('last_accessed_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        studentId,
        topic,
        title,
        description,
        unitsJson,
        totalLessons,
        completedLessons,
        currentUnit,
        currentLesson,
        generatedAt,
        lastAccessedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_paths';
  @override
  VerificationContext validateIntegrity(Insertable<LearningPath> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('units_json')) {
      context.handle(_unitsJsonMeta,
          unitsJson.isAcceptableOrUnknown(data['units_json']!, _unitsJsonMeta));
    }
    if (data.containsKey('total_lessons')) {
      context.handle(
          _totalLessonsMeta,
          totalLessons.isAcceptableOrUnknown(
              data['total_lessons']!, _totalLessonsMeta));
    }
    if (data.containsKey('completed_lessons')) {
      context.handle(
          _completedLessonsMeta,
          completedLessons.isAcceptableOrUnknown(
              data['completed_lessons']!, _completedLessonsMeta));
    }
    if (data.containsKey('current_unit')) {
      context.handle(
          _currentUnitMeta,
          currentUnit.isAcceptableOrUnknown(
              data['current_unit']!, _currentUnitMeta));
    }
    if (data.containsKey('current_lesson')) {
      context.handle(
          _currentLessonMeta,
          currentLesson.isAcceptableOrUnknown(
              data['current_lesson']!, _currentLessonMeta));
    }
    if (data.containsKey('generated_at')) {
      context.handle(
          _generatedAtMeta,
          generatedAt.isAcceptableOrUnknown(
              data['generated_at']!, _generatedAtMeta));
    }
    if (data.containsKey('last_accessed_at')) {
      context.handle(
          _lastAccessedAtMeta,
          lastAccessedAt.isAcceptableOrUnknown(
              data['last_accessed_at']!, _lastAccessedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {studentId, topic},
      ];
  @override
  LearningPath map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningPath(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      unitsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}units_json'])!,
      totalLessons: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_lessons'])!,
      completedLessons: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completed_lessons'])!,
      currentUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_unit'])!,
      currentLesson: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_lesson'])!,
      generatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}generated_at'])!,
      lastAccessedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed_at'])!,
    );
  }

  @override
  $LearningPathsTable createAlias(String alias) {
    return $LearningPathsTable(attachedDatabase, alias);
  }
}

class LearningPath extends DataClass implements Insertable<LearningPath> {
  final int id;
  final int studentId;
  final String topic;
  final String title;
  final String description;
  final String unitsJson;
  final int totalLessons;
  final int completedLessons;
  final int currentUnit;
  final int currentLesson;
  final DateTime generatedAt;
  final DateTime lastAccessedAt;
  const LearningPath(
      {required this.id,
      required this.studentId,
      required this.topic,
      required this.title,
      required this.description,
      required this.unitsJson,
      required this.totalLessons,
      required this.completedLessons,
      required this.currentUnit,
      required this.currentLesson,
      required this.generatedAt,
      required this.lastAccessedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['topic'] = Variable<String>(topic);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['units_json'] = Variable<String>(unitsJson);
    map['total_lessons'] = Variable<int>(totalLessons);
    map['completed_lessons'] = Variable<int>(completedLessons);
    map['current_unit'] = Variable<int>(currentUnit);
    map['current_lesson'] = Variable<int>(currentLesson);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['last_accessed_at'] = Variable<DateTime>(lastAccessedAt);
    return map;
  }

  LearningPathsCompanion toCompanion(bool nullToAbsent) {
    return LearningPathsCompanion(
      id: Value(id),
      studentId: Value(studentId),
      topic: Value(topic),
      title: Value(title),
      description: Value(description),
      unitsJson: Value(unitsJson),
      totalLessons: Value(totalLessons),
      completedLessons: Value(completedLessons),
      currentUnit: Value(currentUnit),
      currentLesson: Value(currentLesson),
      generatedAt: Value(generatedAt),
      lastAccessedAt: Value(lastAccessedAt),
    );
  }

  factory LearningPath.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningPath(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      topic: serializer.fromJson<String>(json['topic']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      unitsJson: serializer.fromJson<String>(json['unitsJson']),
      totalLessons: serializer.fromJson<int>(json['totalLessons']),
      completedLessons: serializer.fromJson<int>(json['completedLessons']),
      currentUnit: serializer.fromJson<int>(json['currentUnit']),
      currentLesson: serializer.fromJson<int>(json['currentLesson']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      lastAccessedAt: serializer.fromJson<DateTime>(json['lastAccessedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'topic': serializer.toJson<String>(topic),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'unitsJson': serializer.toJson<String>(unitsJson),
      'totalLessons': serializer.toJson<int>(totalLessons),
      'completedLessons': serializer.toJson<int>(completedLessons),
      'currentUnit': serializer.toJson<int>(currentUnit),
      'currentLesson': serializer.toJson<int>(currentLesson),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'lastAccessedAt': serializer.toJson<DateTime>(lastAccessedAt),
    };
  }

  LearningPath copyWith(
          {int? id,
          int? studentId,
          String? topic,
          String? title,
          String? description,
          String? unitsJson,
          int? totalLessons,
          int? completedLessons,
          int? currentUnit,
          int? currentLesson,
          DateTime? generatedAt,
          DateTime? lastAccessedAt}) =>
      LearningPath(
        id: id ?? this.id,
        studentId: studentId ?? this.studentId,
        topic: topic ?? this.topic,
        title: title ?? this.title,
        description: description ?? this.description,
        unitsJson: unitsJson ?? this.unitsJson,
        totalLessons: totalLessons ?? this.totalLessons,
        completedLessons: completedLessons ?? this.completedLessons,
        currentUnit: currentUnit ?? this.currentUnit,
        currentLesson: currentLesson ?? this.currentLesson,
        generatedAt: generatedAt ?? this.generatedAt,
        lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
      );
  LearningPath copyWithCompanion(LearningPathsCompanion data) {
    return LearningPath(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      topic: data.topic.present ? data.topic.value : this.topic,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      unitsJson: data.unitsJson.present ? data.unitsJson.value : this.unitsJson,
      totalLessons: data.totalLessons.present
          ? data.totalLessons.value
          : this.totalLessons,
      completedLessons: data.completedLessons.present
          ? data.completedLessons.value
          : this.completedLessons,
      currentUnit:
          data.currentUnit.present ? data.currentUnit.value : this.currentUnit,
      currentLesson: data.currentLesson.present
          ? data.currentLesson.value
          : this.currentLesson,
      generatedAt:
          data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
      lastAccessedAt: data.lastAccessedAt.present
          ? data.lastAccessedAt.value
          : this.lastAccessedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningPath(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('topic: $topic, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('unitsJson: $unitsJson, ')
          ..write('totalLessons: $totalLessons, ')
          ..write('completedLessons: $completedLessons, ')
          ..write('currentUnit: $currentUnit, ')
          ..write('currentLesson: $currentLesson, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('lastAccessedAt: $lastAccessedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      studentId,
      topic,
      title,
      description,
      unitsJson,
      totalLessons,
      completedLessons,
      currentUnit,
      currentLesson,
      generatedAt,
      lastAccessedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningPath &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.topic == this.topic &&
          other.title == this.title &&
          other.description == this.description &&
          other.unitsJson == this.unitsJson &&
          other.totalLessons == this.totalLessons &&
          other.completedLessons == this.completedLessons &&
          other.currentUnit == this.currentUnit &&
          other.currentLesson == this.currentLesson &&
          other.generatedAt == this.generatedAt &&
          other.lastAccessedAt == this.lastAccessedAt);
}

class LearningPathsCompanion extends UpdateCompanion<LearningPath> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<String> topic;
  final Value<String> title;
  final Value<String> description;
  final Value<String> unitsJson;
  final Value<int> totalLessons;
  final Value<int> completedLessons;
  final Value<int> currentUnit;
  final Value<int> currentLesson;
  final Value<DateTime> generatedAt;
  final Value<DateTime> lastAccessedAt;
  const LearningPathsCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.topic = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.unitsJson = const Value.absent(),
    this.totalLessons = const Value.absent(),
    this.completedLessons = const Value.absent(),
    this.currentUnit = const Value.absent(),
    this.currentLesson = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.lastAccessedAt = const Value.absent(),
  });
  LearningPathsCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required String topic,
    required String title,
    required String description,
    this.unitsJson = const Value.absent(),
    this.totalLessons = const Value.absent(),
    this.completedLessons = const Value.absent(),
    this.currentUnit = const Value.absent(),
    this.currentLesson = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.lastAccessedAt = const Value.absent(),
  })  : studentId = Value(studentId),
        topic = Value(topic),
        title = Value(title),
        description = Value(description);
  static Insertable<LearningPath> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<String>? topic,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? unitsJson,
    Expression<int>? totalLessons,
    Expression<int>? completedLessons,
    Expression<int>? currentUnit,
    Expression<int>? currentLesson,
    Expression<DateTime>? generatedAt,
    Expression<DateTime>? lastAccessedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (topic != null) 'topic': topic,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (unitsJson != null) 'units_json': unitsJson,
      if (totalLessons != null) 'total_lessons': totalLessons,
      if (completedLessons != null) 'completed_lessons': completedLessons,
      if (currentUnit != null) 'current_unit': currentUnit,
      if (currentLesson != null) 'current_lesson': currentLesson,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (lastAccessedAt != null) 'last_accessed_at': lastAccessedAt,
    });
  }

  LearningPathsCompanion copyWith(
      {Value<int>? id,
      Value<int>? studentId,
      Value<String>? topic,
      Value<String>? title,
      Value<String>? description,
      Value<String>? unitsJson,
      Value<int>? totalLessons,
      Value<int>? completedLessons,
      Value<int>? currentUnit,
      Value<int>? currentLesson,
      Value<DateTime>? generatedAt,
      Value<DateTime>? lastAccessedAt}) {
    return LearningPathsCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      topic: topic ?? this.topic,
      title: title ?? this.title,
      description: description ?? this.description,
      unitsJson: unitsJson ?? this.unitsJson,
      totalLessons: totalLessons ?? this.totalLessons,
      completedLessons: completedLessons ?? this.completedLessons,
      currentUnit: currentUnit ?? this.currentUnit,
      currentLesson: currentLesson ?? this.currentLesson,
      generatedAt: generatedAt ?? this.generatedAt,
      lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (unitsJson.present) {
      map['units_json'] = Variable<String>(unitsJson.value);
    }
    if (totalLessons.present) {
      map['total_lessons'] = Variable<int>(totalLessons.value);
    }
    if (completedLessons.present) {
      map['completed_lessons'] = Variable<int>(completedLessons.value);
    }
    if (currentUnit.present) {
      map['current_unit'] = Variable<int>(currentUnit.value);
    }
    if (currentLesson.present) {
      map['current_lesson'] = Variable<int>(currentLesson.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (lastAccessedAt.present) {
      map['last_accessed_at'] = Variable<DateTime>(lastAccessedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningPathsCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('topic: $topic, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('unitsJson: $unitsJson, ')
          ..write('totalLessons: $totalLessons, ')
          ..write('completedLessons: $completedLessons, ')
          ..write('currentUnit: $currentUnit, ')
          ..write('currentLesson: $currentLesson, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('lastAccessedAt: $lastAccessedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$OticDatabase extends GeneratedDatabase {
  _$OticDatabase(QueryExecutor e) : super(e);
  $OticDatabaseManager get managers => $OticDatabaseManager(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $SessionSummariesTable sessionSummaries =
      $SessionSummariesTable(this);
  late final $TopicProgressTable topicProgress = $TopicProgressTable(this);
  late final $LearningPathsTable learningPaths = $LearningPathsTable(this);
  late final StudentDao studentDao = StudentDao(this as OticDatabase);
  late final SessionDao sessionDao = SessionDao(this as OticDatabase);
  late final PathDao pathDao = PathDao(this as OticDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [students, sessionSummaries, topicProgress, learningPaths];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('students',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('session_summaries', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('students',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('topic_progress', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('students',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('learning_paths', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$StudentsTableCreateCompanionBuilder = StudentsCompanion Function({
  Value<int> id,
  required String name,
  Value<int?> age,
  Value<String?> grade,
  Value<String> language,
  Value<String> interestsJson,
  Value<String> learningStyle,
  Value<String> strengthsJson,
  Value<String> weaknessesJson,
  Value<String> goalsJson,
  Value<DateTime> createdAt,
  Value<DateTime> lastActiveAt,
});
typedef $$StudentsTableUpdateCompanionBuilder = StudentsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int?> age,
  Value<String?> grade,
  Value<String> language,
  Value<String> interestsJson,
  Value<String> learningStyle,
  Value<String> strengthsJson,
  Value<String> weaknessesJson,
  Value<String> goalsJson,
  Value<DateTime> createdAt,
  Value<DateTime> lastActiveAt,
});

final class $$StudentsTableReferences
    extends BaseReferences<_$OticDatabase, $StudentsTable, Student> {
  $$StudentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SessionSummariesTable, List<SessionSummary>>
      _sessionSummariesRefsTable(_$OticDatabase db) =>
          MultiTypedResultKey.fromTable(db.sessionSummaries,
              aliasName: $_aliasNameGenerator(
                  db.students.id, db.sessionSummaries.studentId));

  $$SessionSummariesTableProcessedTableManager get sessionSummariesRefs {
    final manager =
        $$SessionSummariesTableTableManager($_db, $_db.sessionSummaries)
            .filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_sessionSummariesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TopicProgressTable, List<TopicProgressData>>
      _topicProgressRefsTable(_$OticDatabase db) =>
          MultiTypedResultKey.fromTable(db.topicProgress,
              aliasName: $_aliasNameGenerator(
                  db.students.id, db.topicProgress.studentId));

  $$TopicProgressTableProcessedTableManager get topicProgressRefs {
    final manager = $$TopicProgressTableTableManager($_db, $_db.topicProgress)
        .filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicProgressRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LearningPathsTable, List<LearningPath>>
      _learningPathsRefsTable(_$OticDatabase db) =>
          MultiTypedResultKey.fromTable(db.learningPaths,
              aliasName: $_aliasNameGenerator(
                  db.students.id, db.learningPaths.studentId));

  $$LearningPathsTableProcessedTableManager get learningPathsRefs {
    final manager = $$LearningPathsTableTableManager($_db, $_db.learningPaths)
        .filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_learningPathsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$StudentsTableFilterComposer
    extends Composer<_$OticDatabase, $StudentsTable> {
  $$StudentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get interestsJson => $composableBuilder(
      column: $table.interestsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get learningStyle => $composableBuilder(
      column: $table.learningStyle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strengthsJson => $composableBuilder(
      column: $table.strengthsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weaknessesJson => $composableBuilder(
      column: $table.weaknessesJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalsJson => $composableBuilder(
      column: $table.goalsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastActiveAt => $composableBuilder(
      column: $table.lastActiveAt, builder: (column) => ColumnFilters(column));

  Expression<bool> sessionSummariesRefs(
      Expression<bool> Function($$SessionSummariesTableFilterComposer f) f) {
    final $$SessionSummariesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sessionSummaries,
        getReferencedColumn: (t) => t.studentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SessionSummariesTableFilterComposer(
              $db: $db,
              $table: $db.sessionSummaries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> topicProgressRefs(
      Expression<bool> Function($$TopicProgressTableFilterComposer f) f) {
    final $$TopicProgressTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.topicProgress,
        getReferencedColumn: (t) => t.studentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TopicProgressTableFilterComposer(
              $db: $db,
              $table: $db.topicProgress,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> learningPathsRefs(
      Expression<bool> Function($$LearningPathsTableFilterComposer f) f) {
    final $$LearningPathsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.learningPaths,
        getReferencedColumn: (t) => t.studentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LearningPathsTableFilterComposer(
              $db: $db,
              $table: $db.learningPaths,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StudentsTableOrderingComposer
    extends Composer<_$OticDatabase, $StudentsTable> {
  $$StudentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get interestsJson => $composableBuilder(
      column: $table.interestsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get learningStyle => $composableBuilder(
      column: $table.learningStyle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strengthsJson => $composableBuilder(
      column: $table.strengthsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weaknessesJson => $composableBuilder(
      column: $table.weaknessesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalsJson => $composableBuilder(
      column: $table.goalsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastActiveAt => $composableBuilder(
      column: $table.lastActiveAt,
      builder: (column) => ColumnOrderings(column));
}

class $$StudentsTableAnnotationComposer
    extends Composer<_$OticDatabase, $StudentsTable> {
  $$StudentsTableAnnotationComposer({
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

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get grade =>
      $composableBuilder(column: $table.grade, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get interestsJson => $composableBuilder(
      column: $table.interestsJson, builder: (column) => column);

  GeneratedColumn<String> get learningStyle => $composableBuilder(
      column: $table.learningStyle, builder: (column) => column);

  GeneratedColumn<String> get strengthsJson => $composableBuilder(
      column: $table.strengthsJson, builder: (column) => column);

  GeneratedColumn<String> get weaknessesJson => $composableBuilder(
      column: $table.weaknessesJson, builder: (column) => column);

  GeneratedColumn<String> get goalsJson =>
      $composableBuilder(column: $table.goalsJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastActiveAt => $composableBuilder(
      column: $table.lastActiveAt, builder: (column) => column);

  Expression<T> sessionSummariesRefs<T extends Object>(
      Expression<T> Function($$SessionSummariesTableAnnotationComposer a) f) {
    final $$SessionSummariesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sessionSummaries,
        getReferencedColumn: (t) => t.studentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SessionSummariesTableAnnotationComposer(
              $db: $db,
              $table: $db.sessionSummaries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> topicProgressRefs<T extends Object>(
      Expression<T> Function($$TopicProgressTableAnnotationComposer a) f) {
    final $$TopicProgressTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.topicProgress,
        getReferencedColumn: (t) => t.studentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TopicProgressTableAnnotationComposer(
              $db: $db,
              $table: $db.topicProgress,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> learningPathsRefs<T extends Object>(
      Expression<T> Function($$LearningPathsTableAnnotationComposer a) f) {
    final $$LearningPathsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.learningPaths,
        getReferencedColumn: (t) => t.studentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LearningPathsTableAnnotationComposer(
              $db: $db,
              $table: $db.learningPaths,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StudentsTableTableManager extends RootTableManager<
    _$OticDatabase,
    $StudentsTable,
    Student,
    $$StudentsTableFilterComposer,
    $$StudentsTableOrderingComposer,
    $$StudentsTableAnnotationComposer,
    $$StudentsTableCreateCompanionBuilder,
    $$StudentsTableUpdateCompanionBuilder,
    (Student, $$StudentsTableReferences),
    Student,
    PrefetchHooks Function(
        {bool sessionSummariesRefs,
        bool topicProgressRefs,
        bool learningPathsRefs})> {
  $$StudentsTableTableManager(_$OticDatabase db, $StudentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<String?> grade = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<String> interestsJson = const Value.absent(),
            Value<String> learningStyle = const Value.absent(),
            Value<String> strengthsJson = const Value.absent(),
            Value<String> weaknessesJson = const Value.absent(),
            Value<String> goalsJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> lastActiveAt = const Value.absent(),
          }) =>
              StudentsCompanion(
            id: id,
            name: name,
            age: age,
            grade: grade,
            language: language,
            interestsJson: interestsJson,
            learningStyle: learningStyle,
            strengthsJson: strengthsJson,
            weaknessesJson: weaknessesJson,
            goalsJson: goalsJson,
            createdAt: createdAt,
            lastActiveAt: lastActiveAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int?> age = const Value.absent(),
            Value<String?> grade = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<String> interestsJson = const Value.absent(),
            Value<String> learningStyle = const Value.absent(),
            Value<String> strengthsJson = const Value.absent(),
            Value<String> weaknessesJson = const Value.absent(),
            Value<String> goalsJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> lastActiveAt = const Value.absent(),
          }) =>
              StudentsCompanion.insert(
            id: id,
            name: name,
            age: age,
            grade: grade,
            language: language,
            interestsJson: interestsJson,
            learningStyle: learningStyle,
            strengthsJson: strengthsJson,
            weaknessesJson: weaknessesJson,
            goalsJson: goalsJson,
            createdAt: createdAt,
            lastActiveAt: lastActiveAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$StudentsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {sessionSummariesRefs = false,
              topicProgressRefs = false,
              learningPathsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (sessionSummariesRefs) db.sessionSummaries,
                if (topicProgressRefs) db.topicProgress,
                if (learningPathsRefs) db.learningPaths
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sessionSummariesRefs)
                    await $_getPrefetchedData<Student, $StudentsTable,
                            SessionSummary>(
                        currentTable: table,
                        referencedTable: $$StudentsTableReferences
                            ._sessionSummariesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StudentsTableReferences(db, table, p0)
                                .sessionSummariesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.studentId == item.id),
                        typedResults: items),
                  if (topicProgressRefs)
                    await $_getPrefetchedData<Student, $StudentsTable,
                            TopicProgressData>(
                        currentTable: table,
                        referencedTable: $$StudentsTableReferences
                            ._topicProgressRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StudentsTableReferences(db, table, p0)
                                .topicProgressRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.studentId == item.id),
                        typedResults: items),
                  if (learningPathsRefs)
                    await $_getPrefetchedData<Student, $StudentsTable,
                            LearningPath>(
                        currentTable: table,
                        referencedTable: $$StudentsTableReferences
                            ._learningPathsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StudentsTableReferences(db, table, p0)
                                .learningPathsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.studentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$StudentsTableProcessedTableManager = ProcessedTableManager<
    _$OticDatabase,
    $StudentsTable,
    Student,
    $$StudentsTableFilterComposer,
    $$StudentsTableOrderingComposer,
    $$StudentsTableAnnotationComposer,
    $$StudentsTableCreateCompanionBuilder,
    $$StudentsTableUpdateCompanionBuilder,
    (Student, $$StudentsTableReferences),
    Student,
    PrefetchHooks Function(
        {bool sessionSummariesRefs,
        bool topicProgressRefs,
        bool learningPathsRefs})>;
typedef $$SessionSummariesTableCreateCompanionBuilder
    = SessionSummariesCompanion Function({
  Value<int> id,
  required int studentId,
  required String topic,
  required String summary,
  Value<String> strengthsJson,
  Value<String> weaknessesJson,
  Value<String> highestStage,
  Value<int> messageCount,
  Value<DateTime> sessionAt,
});
typedef $$SessionSummariesTableUpdateCompanionBuilder
    = SessionSummariesCompanion Function({
  Value<int> id,
  Value<int> studentId,
  Value<String> topic,
  Value<String> summary,
  Value<String> strengthsJson,
  Value<String> weaknessesJson,
  Value<String> highestStage,
  Value<int> messageCount,
  Value<DateTime> sessionAt,
});

final class $$SessionSummariesTableReferences extends BaseReferences<
    _$OticDatabase, $SessionSummariesTable, SessionSummary> {
  $$SessionSummariesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $StudentsTable _studentIdTable(_$OticDatabase db) =>
      db.students.createAlias(
          $_aliasNameGenerator(db.sessionSummaries.studentId, db.students.id));

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $$StudentsTableTableManager($_db, $_db.students)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SessionSummariesTableFilterComposer
    extends Composer<_$OticDatabase, $SessionSummariesTable> {
  $$SessionSummariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strengthsJson => $composableBuilder(
      column: $table.strengthsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weaknessesJson => $composableBuilder(
      column: $table.weaknessesJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get highestStage => $composableBuilder(
      column: $table.highestStage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get messageCount => $composableBuilder(
      column: $table.messageCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get sessionAt => $composableBuilder(
      column: $table.sessionAt, builder: (column) => ColumnFilters(column));

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableFilterComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SessionSummariesTableOrderingComposer
    extends Composer<_$OticDatabase, $SessionSummariesTable> {
  $$SessionSummariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strengthsJson => $composableBuilder(
      column: $table.strengthsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weaknessesJson => $composableBuilder(
      column: $table.weaknessesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get highestStage => $composableBuilder(
      column: $table.highestStage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get messageCount => $composableBuilder(
      column: $table.messageCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sessionAt => $composableBuilder(
      column: $table.sessionAt, builder: (column) => ColumnOrderings(column));

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableOrderingComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SessionSummariesTableAnnotationComposer
    extends Composer<_$OticDatabase, $SessionSummariesTable> {
  $$SessionSummariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get strengthsJson => $composableBuilder(
      column: $table.strengthsJson, builder: (column) => column);

  GeneratedColumn<String> get weaknessesJson => $composableBuilder(
      column: $table.weaknessesJson, builder: (column) => column);

  GeneratedColumn<String> get highestStage => $composableBuilder(
      column: $table.highestStage, builder: (column) => column);

  GeneratedColumn<int> get messageCount => $composableBuilder(
      column: $table.messageCount, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionAt =>
      $composableBuilder(column: $table.sessionAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableAnnotationComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SessionSummariesTableTableManager extends RootTableManager<
    _$OticDatabase,
    $SessionSummariesTable,
    SessionSummary,
    $$SessionSummariesTableFilterComposer,
    $$SessionSummariesTableOrderingComposer,
    $$SessionSummariesTableAnnotationComposer,
    $$SessionSummariesTableCreateCompanionBuilder,
    $$SessionSummariesTableUpdateCompanionBuilder,
    (SessionSummary, $$SessionSummariesTableReferences),
    SessionSummary,
    PrefetchHooks Function({bool studentId})> {
  $$SessionSummariesTableTableManager(
      _$OticDatabase db, $SessionSummariesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionSummariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionSummariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionSummariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> studentId = const Value.absent(),
            Value<String> topic = const Value.absent(),
            Value<String> summary = const Value.absent(),
            Value<String> strengthsJson = const Value.absent(),
            Value<String> weaknessesJson = const Value.absent(),
            Value<String> highestStage = const Value.absent(),
            Value<int> messageCount = const Value.absent(),
            Value<DateTime> sessionAt = const Value.absent(),
          }) =>
              SessionSummariesCompanion(
            id: id,
            studentId: studentId,
            topic: topic,
            summary: summary,
            strengthsJson: strengthsJson,
            weaknessesJson: weaknessesJson,
            highestStage: highestStage,
            messageCount: messageCount,
            sessionAt: sessionAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int studentId,
            required String topic,
            required String summary,
            Value<String> strengthsJson = const Value.absent(),
            Value<String> weaknessesJson = const Value.absent(),
            Value<String> highestStage = const Value.absent(),
            Value<int> messageCount = const Value.absent(),
            Value<DateTime> sessionAt = const Value.absent(),
          }) =>
              SessionSummariesCompanion.insert(
            id: id,
            studentId: studentId,
            topic: topic,
            summary: summary,
            strengthsJson: strengthsJson,
            weaknessesJson: weaknessesJson,
            highestStage: highestStage,
            messageCount: messageCount,
            sessionAt: sessionAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SessionSummariesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({studentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (studentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.studentId,
                    referencedTable:
                        $$SessionSummariesTableReferences._studentIdTable(db),
                    referencedColumn: $$SessionSummariesTableReferences
                        ._studentIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SessionSummariesTableProcessedTableManager = ProcessedTableManager<
    _$OticDatabase,
    $SessionSummariesTable,
    SessionSummary,
    $$SessionSummariesTableFilterComposer,
    $$SessionSummariesTableOrderingComposer,
    $$SessionSummariesTableAnnotationComposer,
    $$SessionSummariesTableCreateCompanionBuilder,
    $$SessionSummariesTableUpdateCompanionBuilder,
    (SessionSummary, $$SessionSummariesTableReferences),
    SessionSummary,
    PrefetchHooks Function({bool studentId})>;
typedef $$TopicProgressTableCreateCompanionBuilder = TopicProgressCompanion
    Function({
  Value<int> id,
  required int studentId,
  required String topic,
  Value<int> level,
  Value<int> sessionsCount,
  Value<DateTime> lastStudiedAt,
});
typedef $$TopicProgressTableUpdateCompanionBuilder = TopicProgressCompanion
    Function({
  Value<int> id,
  Value<int> studentId,
  Value<String> topic,
  Value<int> level,
  Value<int> sessionsCount,
  Value<DateTime> lastStudiedAt,
});

final class $$TopicProgressTableReferences extends BaseReferences<
    _$OticDatabase, $TopicProgressTable, TopicProgressData> {
  $$TopicProgressTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $StudentsTable _studentIdTable(_$OticDatabase db) =>
      db.students.createAlias(
          $_aliasNameGenerator(db.topicProgress.studentId, db.students.id));

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $$StudentsTableTableManager($_db, $_db.students)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TopicProgressTableFilterComposer
    extends Composer<_$OticDatabase, $TopicProgressTable> {
  $$TopicProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessionsCount => $composableBuilder(
      column: $table.sessionsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastStudiedAt => $composableBuilder(
      column: $table.lastStudiedAt, builder: (column) => ColumnFilters(column));

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableFilterComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TopicProgressTableOrderingComposer
    extends Composer<_$OticDatabase, $TopicProgressTable> {
  $$TopicProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessionsCount => $composableBuilder(
      column: $table.sessionsCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastStudiedAt => $composableBuilder(
      column: $table.lastStudiedAt,
      builder: (column) => ColumnOrderings(column));

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableOrderingComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TopicProgressTableAnnotationComposer
    extends Composer<_$OticDatabase, $TopicProgressTable> {
  $$TopicProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get sessionsCount => $composableBuilder(
      column: $table.sessionsCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastStudiedAt => $composableBuilder(
      column: $table.lastStudiedAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableAnnotationComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TopicProgressTableTableManager extends RootTableManager<
    _$OticDatabase,
    $TopicProgressTable,
    TopicProgressData,
    $$TopicProgressTableFilterComposer,
    $$TopicProgressTableOrderingComposer,
    $$TopicProgressTableAnnotationComposer,
    $$TopicProgressTableCreateCompanionBuilder,
    $$TopicProgressTableUpdateCompanionBuilder,
    (TopicProgressData, $$TopicProgressTableReferences),
    TopicProgressData,
    PrefetchHooks Function({bool studentId})> {
  $$TopicProgressTableTableManager(_$OticDatabase db, $TopicProgressTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> studentId = const Value.absent(),
            Value<String> topic = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> sessionsCount = const Value.absent(),
            Value<DateTime> lastStudiedAt = const Value.absent(),
          }) =>
              TopicProgressCompanion(
            id: id,
            studentId: studentId,
            topic: topic,
            level: level,
            sessionsCount: sessionsCount,
            lastStudiedAt: lastStudiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int studentId,
            required String topic,
            Value<int> level = const Value.absent(),
            Value<int> sessionsCount = const Value.absent(),
            Value<DateTime> lastStudiedAt = const Value.absent(),
          }) =>
              TopicProgressCompanion.insert(
            id: id,
            studentId: studentId,
            topic: topic,
            level: level,
            sessionsCount: sessionsCount,
            lastStudiedAt: lastStudiedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TopicProgressTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({studentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (studentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.studentId,
                    referencedTable:
                        $$TopicProgressTableReferences._studentIdTable(db),
                    referencedColumn:
                        $$TopicProgressTableReferences._studentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TopicProgressTableProcessedTableManager = ProcessedTableManager<
    _$OticDatabase,
    $TopicProgressTable,
    TopicProgressData,
    $$TopicProgressTableFilterComposer,
    $$TopicProgressTableOrderingComposer,
    $$TopicProgressTableAnnotationComposer,
    $$TopicProgressTableCreateCompanionBuilder,
    $$TopicProgressTableUpdateCompanionBuilder,
    (TopicProgressData, $$TopicProgressTableReferences),
    TopicProgressData,
    PrefetchHooks Function({bool studentId})>;
typedef $$LearningPathsTableCreateCompanionBuilder = LearningPathsCompanion
    Function({
  Value<int> id,
  required int studentId,
  required String topic,
  required String title,
  required String description,
  Value<String> unitsJson,
  Value<int> totalLessons,
  Value<int> completedLessons,
  Value<int> currentUnit,
  Value<int> currentLesson,
  Value<DateTime> generatedAt,
  Value<DateTime> lastAccessedAt,
});
typedef $$LearningPathsTableUpdateCompanionBuilder = LearningPathsCompanion
    Function({
  Value<int> id,
  Value<int> studentId,
  Value<String> topic,
  Value<String> title,
  Value<String> description,
  Value<String> unitsJson,
  Value<int> totalLessons,
  Value<int> completedLessons,
  Value<int> currentUnit,
  Value<int> currentLesson,
  Value<DateTime> generatedAt,
  Value<DateTime> lastAccessedAt,
});

final class $$LearningPathsTableReferences
    extends BaseReferences<_$OticDatabase, $LearningPathsTable, LearningPath> {
  $$LearningPathsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $StudentsTable _studentIdTable(_$OticDatabase db) =>
      db.students.createAlias(
          $_aliasNameGenerator(db.learningPaths.studentId, db.students.id));

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $$StudentsTableTableManager($_db, $_db.students)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LearningPathsTableFilterComposer
    extends Composer<_$OticDatabase, $LearningPathsTable> {
  $$LearningPathsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitsJson => $composableBuilder(
      column: $table.unitsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalLessons => $composableBuilder(
      column: $table.totalLessons, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get completedLessons => $composableBuilder(
      column: $table.completedLessons,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentUnit => $composableBuilder(
      column: $table.currentUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentLesson => $composableBuilder(
      column: $table.currentLesson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAccessedAt => $composableBuilder(
      column: $table.lastAccessedAt,
      builder: (column) => ColumnFilters(column));

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableFilterComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LearningPathsTableOrderingComposer
    extends Composer<_$OticDatabase, $LearningPathsTable> {
  $$LearningPathsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitsJson => $composableBuilder(
      column: $table.unitsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalLessons => $composableBuilder(
      column: $table.totalLessons,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get completedLessons => $composableBuilder(
      column: $table.completedLessons,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentUnit => $composableBuilder(
      column: $table.currentUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentLesson => $composableBuilder(
      column: $table.currentLesson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAccessedAt => $composableBuilder(
      column: $table.lastAccessedAt,
      builder: (column) => ColumnOrderings(column));

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableOrderingComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LearningPathsTableAnnotationComposer
    extends Composer<_$OticDatabase, $LearningPathsTable> {
  $$LearningPathsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get unitsJson =>
      $composableBuilder(column: $table.unitsJson, builder: (column) => column);

  GeneratedColumn<int> get totalLessons => $composableBuilder(
      column: $table.totalLessons, builder: (column) => column);

  GeneratedColumn<int> get completedLessons => $composableBuilder(
      column: $table.completedLessons, builder: (column) => column);

  GeneratedColumn<int> get currentUnit => $composableBuilder(
      column: $table.currentUnit, builder: (column) => column);

  GeneratedColumn<int> get currentLesson => $composableBuilder(
      column: $table.currentLesson, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAccessedAt => $composableBuilder(
      column: $table.lastAccessedAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.studentId,
        referencedTable: $db.students,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StudentsTableAnnotationComposer(
              $db: $db,
              $table: $db.students,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LearningPathsTableTableManager extends RootTableManager<
    _$OticDatabase,
    $LearningPathsTable,
    LearningPath,
    $$LearningPathsTableFilterComposer,
    $$LearningPathsTableOrderingComposer,
    $$LearningPathsTableAnnotationComposer,
    $$LearningPathsTableCreateCompanionBuilder,
    $$LearningPathsTableUpdateCompanionBuilder,
    (LearningPath, $$LearningPathsTableReferences),
    LearningPath,
    PrefetchHooks Function({bool studentId})> {
  $$LearningPathsTableTableManager(_$OticDatabase db, $LearningPathsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningPathsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningPathsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningPathsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> studentId = const Value.absent(),
            Value<String> topic = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> unitsJson = const Value.absent(),
            Value<int> totalLessons = const Value.absent(),
            Value<int> completedLessons = const Value.absent(),
            Value<int> currentUnit = const Value.absent(),
            Value<int> currentLesson = const Value.absent(),
            Value<DateTime> generatedAt = const Value.absent(),
            Value<DateTime> lastAccessedAt = const Value.absent(),
          }) =>
              LearningPathsCompanion(
            id: id,
            studentId: studentId,
            topic: topic,
            title: title,
            description: description,
            unitsJson: unitsJson,
            totalLessons: totalLessons,
            completedLessons: completedLessons,
            currentUnit: currentUnit,
            currentLesson: currentLesson,
            generatedAt: generatedAt,
            lastAccessedAt: lastAccessedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int studentId,
            required String topic,
            required String title,
            required String description,
            Value<String> unitsJson = const Value.absent(),
            Value<int> totalLessons = const Value.absent(),
            Value<int> completedLessons = const Value.absent(),
            Value<int> currentUnit = const Value.absent(),
            Value<int> currentLesson = const Value.absent(),
            Value<DateTime> generatedAt = const Value.absent(),
            Value<DateTime> lastAccessedAt = const Value.absent(),
          }) =>
              LearningPathsCompanion.insert(
            id: id,
            studentId: studentId,
            topic: topic,
            title: title,
            description: description,
            unitsJson: unitsJson,
            totalLessons: totalLessons,
            completedLessons: completedLessons,
            currentUnit: currentUnit,
            currentLesson: currentLesson,
            generatedAt: generatedAt,
            lastAccessedAt: lastAccessedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LearningPathsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({studentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (studentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.studentId,
                    referencedTable:
                        $$LearningPathsTableReferences._studentIdTable(db),
                    referencedColumn:
                        $$LearningPathsTableReferences._studentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LearningPathsTableProcessedTableManager = ProcessedTableManager<
    _$OticDatabase,
    $LearningPathsTable,
    LearningPath,
    $$LearningPathsTableFilterComposer,
    $$LearningPathsTableOrderingComposer,
    $$LearningPathsTableAnnotationComposer,
    $$LearningPathsTableCreateCompanionBuilder,
    $$LearningPathsTableUpdateCompanionBuilder,
    (LearningPath, $$LearningPathsTableReferences),
    LearningPath,
    PrefetchHooks Function({bool studentId})>;

class $OticDatabaseManager {
  final _$OticDatabase _db;
  $OticDatabaseManager(this._db);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$SessionSummariesTableTableManager get sessionSummaries =>
      $$SessionSummariesTableTableManager(_db, _db.sessionSummaries);
  $$TopicProgressTableTableManager get topicProgress =>
      $$TopicProgressTableTableManager(_db, _db.topicProgress);
  $$LearningPathsTableTableManager get learningPaths =>
      $$LearningPathsTableTableManager(_db, _db.learningPaths);
}
