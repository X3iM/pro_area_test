import '../../../../app.dart';

part 'random_cat_fact_model.g.dart';

@JsonSerializable()
class RandomCatFactModel extends RandomCatFact {
  const RandomCatFactModel({
    String? id,
    String? text,
  }) : super(id: id, text: text);

  factory RandomCatFactModel.fromJson(Map<String, dynamic> json) => _$RandomCatFactModelFromJson(json);
  Map<String, dynamic> toJson() => _$RandomCatFactModelToJson(this);
}