import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../providers/auth_provider.dart';
import '../providers/wallet_provider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<AuthProvider>(
      create: (ctx) => AuthProvider(),
    ),
     ChangeNotifierProvider<WalletProvider>(
      create: (ctx) => WalletProvider(),
    ),
  ];
}
