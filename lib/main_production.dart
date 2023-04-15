import 'package:emerson/app/app.dart';
import 'package:emerson/app/config/Dependecy_injection.dart';
import 'package:emerson/app/config/flavor_config.dart';
import 'package:emerson/bootstrap.dart';

void main() {
  InitFlavorConfig.appFlavor = Flavor.PROD;
  DependencyInjection().setup();
  bootstrap(() => const App());
}
