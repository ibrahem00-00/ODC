//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import '../../../business_logic/notes/notes_cubit.dart';
// import '../../../constants/app_colors.dart';
// import '../../../data_provider/local/sql_helper.dart';
// import '../../../widgets/custom_app_bar.dart';
// import '../../../widgets/defualt_text.dart';
// import '../add_note/add_note_screen.dart';
// import 'details.dart';
//
//
// class NotesScreen extends StatefulWidget {
//   const NotesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NotesScreen> createState() => _NotesScreenState();
// }
//
// class _NotesScreenState extends State<NotesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     NotesCubit notesCubit = NotesCubit.get(context);
//     return BlocConsumer<NotesCubit, NotesState>(
//       listener: (context, state) {
//         if (state is DatabaseCreate) {
//           notesCubit.initialize();
//         }
//       },
//       builder: (context, state) {
//         NotesCubit notesCubit = NotesCubit.get(context);
//         return Scaffold(
//           appBar: PreferredSize(
//               preferredSize: Size.fromHeight(7.h),
//               child: const DefaultAppbar(
//                 automaticallyImplyLeading: true,
//                 title: 'Notes',
//               )),
//           body: Padding(
//             padding: const EdgeInsets.all(12),
//             child: FutureBuilder(
//               future: SqlHelper.getAllRowsDB(),
//               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                 if (snapshot.hasData) {
//                   if (snapshot.data.length == 0) {
//                     return Center(
//                         child:
//                         DefaultText(
//                           text: "There's No Data To Show",
//                           fontSize: 20.sp,
//                           textColor: Colors.black,
//                         ));
//                   }
//
//                   //if there's  data in the list of notes
//                   else {
//                     return ListView.separated(
//                       separatorBuilder: (BuildContext context, int index) {
//                         return const Divider();
//                       },
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//
//                           //list of notes
//                           child: ListTile(
//                             onTap: () {
//                               Navigator.push(context, MaterialPageRoute(
//                                   builder: (BuildContext context) {
//                                     return DetailsOfNoteScreen(
//                                       title: snapshot.data[index].title,
//                                       date: snapshot.data[index].date,
//                                       description: snapshot.data[index].description,
//                                     );
//                                   }));
//                             },
//
//                             //title of note
//                             title: DefaultText(
//                               text: "${snapshot.data[index].title}",
//                               fontSize: 20.sp,
//                               textColor: Colors.black,
//                             ),
//
//                             //date of note
//                             subtitle: DefaultText(
//                               text: "${snapshot.data[index].date}",
//                               fontSize: 20.sp,
//                               textColor: Colors.black,
//                             ),
//
//                             //btn edit + btn delete
//                             trailing: Wrap(
//                               children: [
//                                 //btn edit
//                                 IconButton(
//                                   onPressed: () {
//                                     notesCubit.getOneNote(
//                                         context,
//                                         snapshot.data[index].id,
//                                         snapshot.data[index].title,
//                                         snapshot.data[index].description,
//                                         snapshot.data[index].date);
//                                   },
//                                   icon: const Icon(Icons.edit),
//                                   iconSize: 15.sp,
//                                   color: AppColors.primaryColor,
//                                 ),
//
//                                 //btn delete
//                                 IconButton(
//                                   onPressed: () {
//                                     notesCubit.delete(snapshot.data[index].id);
//                                   },
//                                   icon: const Icon(Icons.delete),
//                                   iconSize: 15.sp,
//                                   color: AppColors.primaryColor,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: AppColors.primaryColor,
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                     return AddNotesScreen();
//                   }));
//             },
//             child: const Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workshopodc/business_logic/notes/notes_cubit.dart';
import 'package:workshopodc/business_logic/notes/notes_state.dart';
import 'package:workshopodc/presentation/screens/add_note/add_note_screen.dart';

import '../../../constants/app_colors.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    var data = context.read<NotesCubit>().data;

    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if(state is GetDataBaseState){
          setState(() {

          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(

            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            leading: const BackButton(color: Colors.white,),
            title: Text("Notes",style: TextStyle(fontSize: 20.sp,color: Colors.white),),),
          body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 15.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Text(data[index]['title'],style: const TextStyle(fontSize: 20,color: Colors.black),),
                    Text(data[index]['description'],style: const TextStyle(fontSize: 20,color: Colors.black),),
            ],),
                    IconButton(
                        color: Colors.white,
                        onPressed: (){
                          context.read<NotesCubit>().deleteDB(data[index]['id']);
                        }, icon: const Icon(Icons.delete,color: AppColors.primaryColor,))
                  ],
                ),
              ),);
          },),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddNotesScreen(),));
            },
            child: const Text('+'),
          ),
        );
      },
    );
  }
}
