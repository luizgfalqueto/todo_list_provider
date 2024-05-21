class TotalTasksModel {
  int _totalTasks;
  int get totalTasks => _totalTasks;

  int _totalTasksFinished;
  int get totalTasksFinished => _totalTasksFinished;

  TotalTasksModel({
    required int totalTasks,
    required int totalTasksFinished,
  })  : _totalTasks = totalTasks,
        _totalTasksFinished = totalTasksFinished;
}
