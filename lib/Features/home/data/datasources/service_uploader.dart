import 'package:cloud_firestore/cloud_firestore.dart';

class SeedServicesUploader {
  final FirebaseFirestore firestore;

  SeedServicesUploader(this.firestore);

  Future<void> upload() async {
    final List<Map<String, dynamic>> services = [
      {
        "id": "1",
        "name": "Food",
        "description": "20% Discount",
        "imageUrl":
            "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1750213146/sushi_xyrwqp.jpg",
      },
      {
        "id": "2",
        "name": "deserts",
        "description": "10 mins",
        "imageUrl":
            "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1750213145/cookiee_yxkovs.jpg",
      },
      {
        "id": "3",
        "name": "Groceries",
        "description": "30% off",
        "imageUrl":
            "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1750213811/grocery_wvaium.jpg",
      },
      {
        "id": "4",
        "name": "Groceries",
        "description": "icecream",
        "imageUrl":
            "https://res.cloudinary.com/dmhjjvk5p/image/upload/v1750213146/icecream_rbfxct.jpg",
      },
    ];

    for (var service in services) {
      final docId = service['id'];
      final docRef = firestore.collection('services').doc(docId);

      // Optional: Check if doc exists to prevent overwriting
      final docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        print("⚠️ Service with id=$docId already exists. Skipping...");
        continue;
      }

      print("🔼 Uploading: $service");
      await docRef.set(service);
    }

    print('✅ Services uploaded successfully!');
  }
}
