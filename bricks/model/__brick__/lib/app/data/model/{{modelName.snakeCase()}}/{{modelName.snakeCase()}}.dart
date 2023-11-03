// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part '{{modelName.snakeCase()}}.g.dart';

@JsonSerializable()
class {{modelName.pascalCase()}} {
  
  {{modelName.pascalCase()}}();

  factory {{modelName.pascalCase()}}.fromJson(Map<String, dynamic> json) {
    return _${{modelName.pascalCase()}}FromJson(json);
  }

  Map<String, dynamic> toJson() => _${{modelName.pascalCase()}}ToJson(this);
}