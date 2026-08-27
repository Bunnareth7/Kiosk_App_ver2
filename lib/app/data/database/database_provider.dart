import 'app_database.dart';
import 'daos/cart_dao.dart';

class DatabaseProvider {
  static final AppDatabase database = AppDatabase();

  static final CartDao cartDao = CartDao(database);
}