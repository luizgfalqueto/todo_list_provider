class TotalTasksModel {
  final int _totalTasks;
  int get totalTasks => _totalTasks;

  final int _totalTasksFinished;
  int get totalTasksFinished => _totalTasksFinished;

  int get availableTasks => _totalTasks - _totalTasksFinished;

  TotalTasksModel({
    required int totalTasks,
    required int totalTasksFinished,
  })  : _totalTasks = totalTasks,
        _totalTasksFinished = totalTasksFinished;
}
