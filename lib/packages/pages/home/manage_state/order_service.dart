part of '../../../../services/import/app_import.dart';

class OrderService extends ChangeNotifier {
  // * Firebase Cloud
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(KeyFirebase.collectionOrder);

  bool isLoading = false;
  String errorMessage = '';

  set setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setMessage(String message) {
    errorMessage = message;
    notifyListeners();
  }

  Future<bool> addOrder(ModelOrder order) async {
    try {
      setLoading = true;
      // *  get User Data
      final User user = AuthService().currentUser;
      order.idUser = user.uid;
      DocumentReference documentRef =
          await _collectionReference.add(order.toMap());

      //  * storage id order
      order.idOrder = documentRef.id;
      // * update order
      _collectionReference.doc(order.idOrder).update(order.toMap());
      setLoading = false;
      return true;
    } on SocketException {
      setLoading = false;
      setMessage = KeyLang.noInternet.tr();
      return false;
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
      return false;
    }
  }

  Stream<List<ModelOrder>?> get order {
    // *  get User Data
    final String idUser = AuthService().currentUser.uid;

    return _collectionReference
        .orderBy(KeyFirebase.createdAt, descending: true)
        .where(KeyFirebase.id, isEqualTo: idUser)
        .snapshots()
        .map(_orderListFromSnapshot);
  }

  List<ModelOrder>? _orderListFromSnapshot(QuerySnapshot snapshots) {
    try {
      return snapshots.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ModelOrder.fromMap(data);
      }).toList();
    } catch (e) {
      developer.log('error get order ${e.toString()}');
      return null;
    }
  }
}
