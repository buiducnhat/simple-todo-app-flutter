class Task {
  int id;
  String title;
  String content;
  bool isCompleted;

  Task(this.id, this.title, this.content, this.isCompleted);

  static Task copyTask(Task sourceTask) {
    return new Task(sourceTask.id, sourceTask.title, sourceTask.content,
        sourceTask.isCompleted);
  }
}
