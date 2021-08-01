import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileGetter{
      getProfile(String mobile) {
        return Firestore.instance
          .collection('Students')
          .where('mobile', isEqualTo: mobile)
          .getDocuments();
      }

      getProfileT(String mobile) {
        return Firestore.instance
          .collection('Teachers')
          .where('mobile', isEqualTo: mobile)
          .getDocuments();
      }
}