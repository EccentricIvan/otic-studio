import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/path_dao.dart';
import 'daos/session_dao.dart';
import 'daos/student_dao.dart';
import 'tables/learning_paths_table.dart';
import 'tables/session_summaries_table.dart';
import 'tables/students_table.dart';
import 'tables/topic_progress_table.dart';

part 'otic_database.g.dart';

@DriftDatabase(
  tables: [Students, SessionSummaries, TopicProgress, LearningPaths],
  daos: [StudentDao, SessionDao, PathDao],
)
class OticDatabase extends _$OticDatabase {
  OticDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(learningPaths);
          }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'otic_student_db');
  }
}
