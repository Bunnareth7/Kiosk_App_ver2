import 'package:drift/drift.dart';
import 'package:kiosk_app/app/data/Model/cart_summary.dart';
import 'package:kiosk_app/app/data/tables/cart_item.dart';
import '../app_database.dart';

part 'cart_dao.g.dart';

@DriftAccessor(tables: [CartItems])
class CartDao extends DatabaseAccessor<AppDatabase> with _$CartDaoMixin {
  CartDao(super.db);

  Future<List<CartItem>> getAllCartItems() {
    return select(cartItems).get();
  }

  Stream<List<CartItem>> watchCartItems() {
    return select(cartItems).watch();
  }

 Future<void> addToCart({
  required String productId,
  required String productName,
  required double price,
  required String image,
  required int quantity,
}) async {
  final existingItem = await (select(
    cartItems,
  )..where((tbl) => tbl.productId.equals(productId))).getSingleOrNull();

  if (existingItem != null) {
    await update(cartItems).replace(
      existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
        productName: productName,
        price: price,
        image: Value(image),
      ),
    );
  } else {
    await into(cartItems).insert(
      CartItemsCompanion.insert(
        productId: productId,
        productName: productName,
        price: price,
        quantity: quantity,
        image: Value(image),
      ),
    );
  }
}

  Future<void> increaseQuantity(int cartItemId) async {
    final item = await (select(
      cartItems,
    )..where((tbl) => tbl.id.equals(cartItemId))).getSingle();

    await update(cartItems).replace(item.copyWith(quantity: item.quantity + 1));
  }

  Future<void> decreaseQuantity(int cartItemId) async {
    final item = await (select(
      cartItems,
    )..where((tbl) => tbl.id.equals(cartItemId))).getSingle();

    if (item.quantity > 1) {
      await update(
        cartItems,
      ).replace(item.copyWith(quantity: item.quantity - 1));
    } else {
      await deleteCartItem(cartItemId);
    }
  }

  Future<void> deleteCartItem(int cartItemId) async {
    await (delete(cartItems)..where((tbl) => tbl.id.equals(cartItemId))).go();
  }

  Future<void> clearCart() async {
    await delete(cartItems).go();
  }
  Stream<CartSummary> watchCartSummary() {
  return customSelect(
    '''
    SELECT
      COALESCE(SUM(quantity), 0) AS totalQuantity,
      COALESCE(SUM(price * quantity), 0) AS totalPrice
    FROM cart_items
    ''',
    readsFrom: {cartItems},
  ).watchSingle().map(
    (row) => CartSummary(
      quantity: row.read<int>('totalQuantity'),
      totalPrice: row.read<double>('totalPrice'),
    ),
  );
}
}
