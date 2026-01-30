import 'package:primecustomer/data/model/remote/suggestion.dart';

class PlaceSuggestion {
  List<Suggestion> suggestions = [];

  PlaceSuggestion(this.suggestions);

  PlaceSuggestion.fromJson(Map<String, dynamic> json) {
    if (json['suggestions'] != null) {
      suggestions = <Suggestion>[];
      json['suggestions'].forEach((v) {
        suggestions.add(Suggestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['suggestions'] = suggestions.map((v) => v.toJson()).toList();
    return data;
  }
}
