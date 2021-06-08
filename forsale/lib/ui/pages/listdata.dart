part of 'pages.dart';

class ListData extends StatefulWidget {
  static const String routeName = "/listdata";
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference productCollection = FirebaseFirestore.instance.collection("products");

  Widget buildBody(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: productCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text("Failed to load data!");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return AcitivityServices.loadings();
          }

          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot doc){
              Sales sales = new Sales(
                doc.data()['produckId'],
                doc.data()['produckCategory'],
                doc.data()['produckInfo'],
                doc.data()['produckPrice'],
                doc.data()['produckProfit'],
                doc.data()['addBy'],
                doc.data()['createdAt'],
                doc.data()['updatedAt'],
              );
              return SalesCard(sales: sales);
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Data"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),

    );
  }
  
}