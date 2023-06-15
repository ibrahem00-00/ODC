// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import 'package:workshopodc/presentation/screens/add_note/add_note_screen.dart';
//
//
// import '../../../business_logic/notes/notes_cubit.dart';
// import '../../../constants/app_colors.dart';
// import '../../../data_provider/local/sql_helper.dart';
// import '../../../widgets/defualt_text.dart';
// import '../add_note/add.dart';
// import 'details.dart';
//
//
// class NoteScreen extends StatefulWidget {
//    const NoteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NoteScreen> createState() => _NoteScreenState();
// }
//
// class _NoteScreenState extends State<NoteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     NotesCubit noteCubit = NotesCubit.get(context);
//     return BlocConsumer<NotesCubit, NotesState>(
//       listener: (context, state) {
//         if (state is DatabaseCreate) {
//           noteCubit.initialize();
//         }
//       },
//       builder: (context, state) {
//        // NoteCubit noteCubit = NoteCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(),
//           // appBar: PreferredSize(
//           //     preferredSize: Size.fromHeight(7.h),
//           //     child: const DefaultAppbar(
//           //       automaticallyImplyLeading: true,
//           //       title: 'Notes',
//           //     )),
//           body: Padding(
//             padding: const EdgeInsets.all(12),
//             child: FutureBuilder(
//               future: SqlHelper.getAllRowsDB(),
//               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                 if (snapshot.hasData) {
//                   if (snapshot.data.length == 0) {
//                     return Center(
//                         child: DefaultText(
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
//                                     context.read<NotesCubit>().getOneNote(
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
//                                     context.read<NotesCubit>().delete(snapshot.data[index].id);
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
