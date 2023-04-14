import 'package:movie/app/app.dart';
import 'package:movie/app/config/Dependecy_injection.dart';
import 'package:movie/app/config/flavor_config.dart';
import 'package:movie/bootstrap.dart';

void main() {
  InitFlavorConfig.appFlavor = Flavor.PROD;
  DependencyInjection().setup();
  bootstrap(() => const App());
}
