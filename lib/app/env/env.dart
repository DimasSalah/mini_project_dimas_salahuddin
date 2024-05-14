import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'OPEN_API_KEY')
  static String apiKey = _Env.apiKey;

  @EnviedField(varName: 'SUPABASE_KEY')
  static String supabaseKey = _Env.supabaseKey;
}