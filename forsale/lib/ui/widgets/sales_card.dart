part of 'widgets.dart';

class SalesCard extends StatefulWidget {

  final Sales sales;
  SalesCard({this.sales});

  @override
  _SalesCardState createState() => _SalesCardState();
}

class _SalesCardState extends State<SalesCard> {
  @override
  Widget build(BuildContext context) {
    Sales sale = widget.sales;
    
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      margin: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: ListTile(      
          title: Text(
            sale.productCategory,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            softWrap: true,
          ),

          subtitle: Text(
            AcitivityServices.toIDR(sale.productPrice),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
            softWrap: true,
          ),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
            IconButton(
              icon: Icon(
                CupertinoIcons.ellipsis_circle_fill,
                color: Colors.blue,
              ),
              onPressed: (){
                showModalBottomSheet(
                  // transitionAnimationController: AnimationController(),
                  context: context, 
                  builder: (BuildContext ctx){
                    return Container(
                      width: double.infinity,
                      height: 80,
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(CupertinoIcons.eye_fill),
                            label: Text("Show Data"),
                            onPressed: (){

                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[500],
                            ),
                          ),

                          ElevatedButton.icon(
                            icon: Icon(CupertinoIcons.pencil),
                            label: Text("Edit Data"),
                            onPressed: (){

                            },
                            
                          ),

                          ElevatedButton.icon(
                            icon: Icon(CupertinoIcons.trash),
                            label: Text("Delete Data"),
                            onPressed: () {                          

                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ],
          )
        ),
      ),
    );
  }
}