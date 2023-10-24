import 'package:flutter/cupertino.dart';
import 'package:installed_apps/app_info.dart';

import '../app/helpers/parsing_extension.dart';
import '../common_widgets/show_logger.dart';
import '../models/child_model/child_model.dart';
import 'app_usage_local_service.dart';
import 'database.dart';

abstract class AppService {
  Future<void> getAppUsageService();
  Future<Duration?> getChildrenAppUsageAverage(Database database);
  Future<Duration?> getChildAppUsagePerDay(BuildContext context);
}

class AppUsageService implements AppService {
  List<AppUsageInfo> _info = <AppUsageInfo>[];
  final List<AppInfo> _appInfo = <AppInfo>[];
  Duration _averageDuration = const Duration(minutes: 1);

  List<AppUsageInfo> get info => _info;

  List<AppInfo> get appInfo => _appInfo;

  Duration get averageDuration => _averageDuration;

  @override
  Future<void> getAppUsageService() async {
    try {
      final endDate = DateTime.now();
      final startDate = endDate.subtract(const Duration(hours: 1));
      final infoList =
          await AppUsage.getAppUsage(startDate, endDate, useMock: false);
      _info = infoList;
    } on AppUsageException catch (exception) {
      JHLogger.$.e(exception);
    }
  }

  @override
  Future<Duration?> getChildrenAppUsageAverage(Database database) async {
    List children = <ChildModel>[];
    final durations = <Duration>[];
    try {
      final response = await database.childrenStream().first;
      if (response.isNotEmpty) {
        children = response.toList();

        for (final listUsage in children) {
          for (final usage in listUsage.appsUsageModel) {
            durations.add(usage.usage);
          }
        }
        final averageDuration = getMedian(durations);
        JHLogger.$.e(averageDuration);
        _averageDuration = averageDuration;
        return averageDuration;
      }
    } on AppUsageException catch (exception) {
      JHLogger.$.e(exception);
    }

    return null;
  }

  @override
  Future<Duration?> getChildAppUsagePerDay(BuildContext context) async {
    try {
      final endDate = DateTime.now();
      final startDate = endDate.subtract(const Duration(hours: 1));
      final infoList =
          await AppUsage.getAppUsage(startDate, endDate, useMock: false);
      _info = infoList;
    } on AppUsageException catch (exception) {
      JHLogger.$.e(exception);
    }

    return null;
  }
}
