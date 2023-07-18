import 'package:coursia/Model/image_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Model/static_data.dart';

class QuizQuestionModel {
  List<QuizQuestion>? quizQuestion;
  QuizResult? result;
  List<QuizAnswerModel>? quizAnswerList;
  int? quizTypeId;
  QuizQuestionModel(
      {this.quizQuestion, this.result, this.quizAnswerList, this.quizTypeId});

  QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['quiz_question'] != null) {
      quizQuestion = <QuizQuestion>[];
      json['quiz_question'].forEach((v) {
        quizQuestion!.add(QuizQuestion.fromJson(v));
      });
    }
    result =
        json['result'] != null ? QuizResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quizQuestion != null) {
      data['quiz_question'] = quizQuestion!.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }

  Map<String, dynamic> sendQuizResult() => {
        "user_id": StaticData.dataResponse?.userInfo?.userId,
        "quiz_type_id": quizTypeId,
        "answerlist": quizAnswerList
      };
}

class QuizQuestion {
  int? id;
  int? quizTypeId;
  String? questionName;
  int? mediableId;
  List<QuizAnswer>? quizAnswer;
  QuizTypeModel? quizType;
  ImageModel? image;
  int? selectQuizAnswer;

  QuizQuestion(
      {this.id,
      this.quizTypeId,
      this.questionName,
      this.mediableId,
      this.quizAnswer,
      this.quizType,
      this.image,
      this.selectQuizAnswer});

  QuizQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizTypeId = json['quiz_type_id'];
    questionName = json['question_name'];
    mediableId = json['mediable_id'];
    if (json['quiz_answer'] != null) {
      quizAnswer = <QuizAnswer>[];
      json['quiz_answer'].forEach((v) {
        quizAnswer!.add(QuizAnswer.fromJson(v));
      });
    }
    quizType = json['quiz_type'] != null
        ? QuizTypeModel.fromJson(json['quiz_type'])
        : null;
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quiz_type_id'] = quizTypeId;
    data['question_name'] = questionName;
    data['mediable_id'] = mediableId;
    if (quizAnswer != null) {
      data['quiz_answer'] = quizAnswer!.map((v) => v.toJson()).toList();
    }
    if (quizType != null) {
      data['quiz_type'] = quizType!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class QuizAnswer {
  int? id;
  int? quizQuestionId;
  String? answer;
  int? correctStatus;
  int? activeStatus;

  QuizAnswer(
      {this.id,
      this.quizQuestionId,
      this.answer,
      this.correctStatus,
      this.activeStatus});

  QuizAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizQuestionId = json['quiz_question_id'];
    answer = json['answer'];
    correctStatus = json['correct_status'];
    activeStatus = json['active_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quiz_question_id'] = quizQuestionId;
    data['answer'] = answer;
    data['correct_status'] = correctStatus;
    data['active_status'] = activeStatus;
    return data;
  }
}

class QuizResult {
  String? expiredDate;
  QuizResult1? result;

  QuizResult({this.expiredDate, this.result});

  QuizResult.fromJson(Map<String, dynamic> json) {
    expiredDate = json['expired_date'];
    result =
        json['result'] != null ? QuizResult1.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expired_date'] = expiredDate;

    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class QuizResult1 {
  int? id;
  int? userId;
  int? correctQty;
  int? incorrectQty;
  String? expiredAt;
  int? activeStatus;
  List<QuizResultScore>? quizResultScore;

  QuizResult1(
      {this.id,
      this.userId,
      this.correctQty,
      this.incorrectQty,
      this.expiredAt,
      this.activeStatus,
      this.quizResultScore});

  QuizResult1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    correctQty = json['correct_qty'];
    incorrectQty = json['incorrect_qty'];
    expiredAt = json['expired_at'];
    activeStatus = json['active_status'];
    if (json['quiz_result_score'] != null) {
      quizResultScore = <QuizResultScore>[];
      json['quiz_result_score'].forEach((v) {
        quizResultScore!.add(QuizResultScore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['correct_qty'] = correctQty;
    data['incorrect_qty'] = incorrectQty;
    data['expired_at'] = expiredAt;
    data['active_status'] = activeStatus;
    if (quizResultScore != null) {
      data['quiz_result_score'] =
          quizResultScore!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizResultScore {
  int? id;
  int? quizResultId;
  int? userId;
  int? userAnswerId;
  int? score;

  QuizResultScore(
      {this.id, this.quizResultId, this.userId, this.userAnswerId, this.score});

  QuizResultScore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizResultId = json['quiz_result_id'];
    userId = json['user_id'];
    userAnswerId = json['user_answer_id'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quiz_result_id'] = quizResultId;
    data['user_id'] = userId;
    data['user_answer_id'] = userAnswerId;
    data['score'] = score;
    return data;
  }
}

class QuizAnswerModel {
  int? quizQuestionId;
  int? quizAnswerId;

  QuizAnswerModel({this.quizQuestionId, this.quizAnswerId});

  QuizAnswerModel.fromJson(Map<String, dynamic> json) {
    quizQuestionId = json['quiz_question_id'];
    quizAnswerId = json['quiz_answer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quiz_question_id'] = quizQuestionId;
    data['quiz_answer_id'] = quizAnswerId;
    return data;
  }
}
