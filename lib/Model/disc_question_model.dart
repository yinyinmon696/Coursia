import 'package:coursia/Model/static_data.dart';

class DISCQuestionModel {
  List<DiscQuestion>? discQuestionList;
  DISCResult? result;
  List<String>? answerList;

  DISCQuestionModel({this.discQuestionList, this.result, this.answerList});

  DISCQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['disc_question'] != null) {
      discQuestionList = <DiscQuestion>[];
      json['disc_question'].forEach((v) {
        discQuestionList!.add(DiscQuestion.fromJson(v));
      });
    }
    result =
        json['result'] != null ? DISCResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (discQuestionList != null) {
      data['disc_question'] = discQuestionList!.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }

  Map<String, dynamic> sendDISCResult() => {
        "user_id": StaticData.dataResponse?.userInfo?.userId,
        "answerlist": answerList
      };
}

class DiscQuestion {
  int? id;
  List<Questions>? questions;
  int? selectIndex;

  DiscQuestion({this.id, this.questions, this.selectIndex});

  DiscQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? type;
  String? questionName;

  Questions({this.type, this.questionName});

  Questions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    questionName = json['question_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['question_name'] = questionName;
    return data;
  }
}

class DISCResult {
  DiscType? discType;
  String? expiredDate;
  List<DISCResult1>? result1;

  DISCResult({this.discType, this.expiredDate, this.result1});

  DISCResult.fromJson(Map<String, dynamic> json) {
    discType =
        json['disc_type'] != null ? DiscType.fromJson(json['disc_type']) : null;
    expiredDate = json['expired_date'];
    if (json['result'] != null) {
      result1 = <DISCResult1>[];
      json['result'].forEach((v) {
        result1!.add(DISCResult1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (discType != null) {
      data['disc_type'] = discType!.toJson();
    }
    data['expired_date'] = expiredDate;
    if (result1 != null) {
      data['result'] = result1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DiscType {
  int? id;
  String? name;
  String? description;

  DiscType({this.id, this.name, this.description});

  DiscType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

class DISCResult1 {
  int? id;
  int? discResultId;
  int? userId;
  String? discType;
  int? score;

  DISCResult1(
      {this.id, this.discResultId, this.userId, this.discType, this.score});

  DISCResult1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discResultId = json['disc_result_id'];
    userId = json['user_id'];
    discType = json['disc_type'] == "D"
        ? "D, dominance"
        : json['disc_type'] == "I"
            ? "I, influence"
            : json['disc_type'] == "S"
                ? "S, Steadiness"
                : "C, Conscientiousness";
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['disc_result_id'] = discResultId;
    data['user_id'] = userId;
    data['disc_type'] = discType;
    data['score'] = score;
    return data;
  }
}
