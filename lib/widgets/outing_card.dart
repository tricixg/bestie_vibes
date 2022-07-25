import 'package:bestie_vibes/pages/new%20outing/datepicker.dart';
import 'package:bestie_vibes/pages/new%20outing/results_page.dart';
import 'package:bestie_vibes/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/models.dart';
import '../pages/pages.dart';

class outingCard extends StatelessWidget {
  const outingCard({Key? key, required this.outing, required this.room})
      : super(key: key);

  final Outing outing;
  final Room room;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final res = await Supabase.instance.client
            .rpc('num_swiped', params: {'outing_id': outing.id}).execute();
        final data = res.data;
        print(data);

        final partres = await Supabase.instance.client
            .rpc('num_outing_participants', params: {'outing_id': outing.id}).execute();
        final partdata = partres.data;
        
        print(partdata);

        final swipe = await Supabase.instance.client
            .rpc('has_swiped', params: {'outing_id': outing.id, 'profile_id': Supabase.instance.client.auth.user()?.id }).execute();
        final swiped = swipe.data;
        
        if(outing.creator_id == Supabase.instance.client.auth.user()?.id){
          if (data == partdata) {
             final res = await Supabase.instance.client
        .rpc('date_result', params: {'outing_id': outing.id}).execute();
              final data = res.data;

              final result = data.toString();
              final insertres = await Supabase.instance.client
                  .from('outings')
                  .update({
                    'date': data,
                  })
                  .eq('id', outing.id)
                  .execute();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ResultsPage(outing: outing, room: room);
              }),
            );
          } else {
            return 
             showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                            title: Text('Results not ready'),
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text('ask your friends to swipe!'),
                              )
                            ],
                          );
                        
                      },);
          }
        } else {
          if (data == partdata) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ResultsPage(outing: outing, room: room);
              }),
            );
            
          } else {
            if(swiped) {
              showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                            title: Text('Results not ready'),
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text('ask your friends to swipe!'),
                              )
                            ],
                          );
                        
                      },);
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DatePickerPage(outing: outing);
                }),
              );
            }
          }
    
        }

  
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      outing.name.length > 19
                          ? outing.name.substring(0, 17) + "..."
                          : outing.name,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.45,
                    //   child: Text(
                    //     outing.text,
                    //     style: TextStyle(
                    //       color: Colors.blueGrey,
                    //       fontSize: 14.0,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  outing.date == null
                      ? 'Show Result'
                      : DateFormat("dd-MM-yyyy")
                          .format(outing.date ?? DateTime(0000)),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                // chat.unread
                //     ? Container(
                //         width: 40.0,
                //         height: 20.0,
                //         decoration: BoxDecoration(
                //           color: Theme.of(context).primaryColor,
                //           borderRadius: BorderRadius.circular(30.0),
                //         ),
                //         alignment: Alignment.center,
                //         child: Text(
                //           'NEW',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 12.0,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       )
                //     : Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
