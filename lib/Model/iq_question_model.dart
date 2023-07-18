import 'package:coursia/Model/image_model.dart';
import 'package:coursia/Model/static_data.dart';

class IQQuestionModel {
  List<IqQuestion>? iqQuestion;
  IQResult? result;
  List<IQAnswerModel>? iqAnswerList;

  IQQuestionModel({this.iqQuestion, this.result, this.iqAnswerList});

  IQQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['iq_question'] != null) {
      iqQuestion = <IqQuestion>[];
      json['iq_question'].forEach((v) {
        iqQuestion!.add(IqQuestion.fromJson(v));
      });
    }
    result = json['result'] != null ? IQResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iqQuestion != null) {
      data['iq_question'] = iqQuestion!.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }

  Map<String, dynamic> sendIQResult() => {
        "user_id": StaticData.dataResponse?.userInfo?.userId,
        "answerlist": iqAnswerList
      };
}

class IqQuestion {
  int? id;
  int? iqTypeId;
  String? questionName;
  int? mediableId;
  List<IqAnswer>? iqAnswer;
  ImageModel? imageModel;
  int? selectIqAnswer;
  IQAnswerModel? iqAnswerModel;

  IqQuestion(
      {this.id,
      this.iqTypeId,
      this.questionName,
      this.mediableId,
      this.iqAnswer,
      this.imageModel,
      this.selectIqAnswer,
      this.iqAnswerModel});

  IqQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iqTypeId = json['iq_type_id'];
    questionName = json['question_name'];
    mediableId = json['mediable_id'];
    if (json['iq_answer'] != null) {
      iqAnswer = <IqAnswer>[];
      json['iq_answer'].forEach((v) {
        iqAnswer!.add(IqAnswer.fromJson(v));
      });
    }
    imageModel =
        json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['iq_type_id'] = iqTypeId;
    data['question_name'] = questionName;
    data['mediable_id'] = mediableId;
    if (iqAnswer != null) {
      data['iq_answer'] = iqAnswer!.map((v) => v.toJson()).toList();
    }
    if (imageModel != null) {
      data['image'] = imageModel!.toJson();
    }
    return data;
  }
}

class IqAnswer {
  int? id;
  int? iqQuestionId;
  String? answer;
  int? correctStatus;
  int? activeStatus;

  IqAnswer(
      {this.id,
      this.iqQuestionId,
      this.answer,
      this.correctStatus,
      this.activeStatus});

  IqAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iqQuestionId = json['iq_question_id'];
    answer = json['answer'];
    correctStatus = json['correct_status'];
    activeStatus = json['active_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['iq_question_id'] = iqQuestionId;
    data['answer'] = answer;
    data['correct_status'] = correctStatus;
    data['active_status'] = activeStatus;
    return data;
  }
}

class IQResult {
  String? expiredDate;
  List<IQResult1>? result;

  IQResult({this.expiredDate, this.result});

  IQResult.fromJson(Map<String, dynamic> json) {
    expiredDate = json['expired_date'];
    if (json['result'] != null) {
      result = <IQResult1>[];
      json['result'].forEach((v) {
        result!.add(IQResult1.fromJson(v));
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

class IQResult1 {
  int? id;
  int? iqResultId;
  int? userId;
  int? iqTypeId;
  int? score;
  int? activeStatus;
  IqType? iqType;

  IQResult1(
      {this.id,
      this.iqResultId,
      this.userId,
      this.iqTypeId,
      this.score,
      this.activeStatus,
      this.iqType});

  IQResult1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iqResultId = json['iq_result_id'];
    userId = json['user_id'];
    iqTypeId = json['iq_type_id'];
    score = json['score'];
    activeStatus = json['active_status'];
    iqType = json['iq_type'] != null ? IqType.fromJson(json['iq_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['iq_result_id'] = iqResultId;
    data['user_id'] = userId;
    data['iq_type_id'] = iqTypeId;
    data['score'] = score;
    data['active_status'] = activeStatus;
    if (iqType != null) {
      data['iq_type'] = iqType!.toJson();
    }
    return data;
  }
}

class IqType {
  int? id;
  String? name;
  String? shortCode;
  String? description;
  int? activeStatus;

  IqType(
      {this.id,
      this.name,
      this.shortCode,
      this.description,
      this.activeStatus});

  IqType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortCode = json['short_code'];
    description = json['description'];
    activeStatus = json['active_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['short_code'] = shortCode;
    data['description'] = description;
    data['active_status'] = activeStatus;
    return data;
  }
}

class IQAnswerModel {
  int? iqTypeId;
  int? iqQuestionId;
  int? iqAnswerId;

  IQAnswerModel({this.iqTypeId, this.iqQuestionId, this.iqAnswerId});

  IQAnswerModel.fromJson(Map<String, dynamic> json) {
    iqTypeId = json['iq_type_id'];
    iqQuestionId = json['iq_question_id'];
    iqAnswerId = json['iq_answer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iq_type_id'] = iqTypeId;
    data['iq_question_id'] = iqQuestionId;
    data['iq_answer_id'] = iqAnswerId;
    return data;
  }
}
