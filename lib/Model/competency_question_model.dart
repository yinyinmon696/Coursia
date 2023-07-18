import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Model/static_data.dart';

class CompetencyQuestionModel {
  List<CompetencyQuestion>? competencyQuestion;
  CompetencyResult? result;
  List<CompetencyAnswerModel>? competencyAnswerList;

  CompetencyQuestionModel({this.competencyQuestion, this.result});

  CompetencyQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['competency_question'] != null) {
      competencyQuestion = <CompetencyQuestion>[];
      json['competency_question'].forEach((v) {
        competencyQuestion!.add(CompetencyQuestion.fromJson(v));
      });
    }
    result = json['result'] != null
        ? CompetencyResult.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (competencyQuestion != null) {
      data['competency_question'] =
          competencyQuestion!.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }

  Map<String, dynamic> sendCompetencyResult() => {
        "user_id": StaticData.dataResponse?.userInfo?.userId,
        "answerlist": competencyAnswerList
      };
}

class CompetencyQuestion {
  int? id;
  int? competencyTypeId;
  String? level;
  String? questionName;
  CompetencyTypeModel? competencyType;
  int? selectAnswer;

  CompetencyQuestion(
      {this.id,
      this.competencyTypeId,
      this.level,
      this.questionName,
      this.competencyType,
      this.selectAnswer});

  CompetencyQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    competencyTypeId = json['competency_type_id'];
    level = json['level'];
    questionName = json['question_name'];
    competencyType = json['competency_type'] != null
        ? CompetencyTypeModel.fromJson(json['competency_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['competency_type_id'] = competencyTypeId;
    data['level'] = level;
    data['question_name'] = questionName;
    if (competencyType != null) {
      data['competency_type'] = competencyType!.toJson();
    }
    return data;
  }
}

class CompetencyResult {
  String? expiredDate;
  List<CompetencyResult1>? result;

  CompetencyResult({this.expiredDate, this.result});

  CompetencyResult.fromJson(Map<String, dynamic> json) {
    expiredDate = json['expired_date'];
    if (json['result'] != null) {
      result = <CompetencyResult1>[];
      json['result'].forEach((v) {
        result!.add(CompetencyResult1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expired_date'] = expiredDate;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompetencyResult1 {
  int? id;
  int? competencyResultId;
  int? userId;
  int? competencyTypeId;
  int? range;
  int? score;
  CompetencyTypeModel? competencyType;

  CompetencyResult1(
      {this.id,
      this.competencyResultId,
      this.userId,
      this.competencyTypeId,
      this.range,
      this.score,
      this.competencyType});

  CompetencyResult1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    competencyResultId = json['competency_result_id'];
    userId = json['user_id'];
    competencyTypeId = json['competency_type_id'];
    range = json['range'];
    score = json['score'];
    competencyType = json['competency_type'] != null
        ? CompetencyTypeModel.fromJson(json['competency_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['competency_result_id'] = competencyResultId;
    data['user_id'] = userId;
    data['competency_type_id'] = competencyTypeId;
    data['range'] = range;
    data['score'] = score;
    if (competencyType != null) {
      data['competency_type'] = competencyType!.toJson();
    }
    return data;
  }
}

class CompetencyAnswerModel {
  int? competencyTypeId;
  int? competencyQuestionId;
  int? range;

  CompetencyAnswerModel(
      {this.competencyTypeId, this.competencyQuestionId, this.range});

  CompetencyAnswerModel.fromJson(Map<String, dynamic> json) {
    competencyTypeId = json['competency_type_id'];
    competencyQuestionId = json['competency_question_id'];
    range = json['range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['competency_type_id'] = competencyTypeId;
    data['competency_question_id'] = competencyQuestionId;
    data['range'] = range;
    return data;
  }
}
