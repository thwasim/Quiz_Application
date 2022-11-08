class QuestionTypeModel {
  final int id, answer;
  final String question;
  final List<String> options;

  QuestionTypeModel(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}
