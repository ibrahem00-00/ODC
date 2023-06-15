// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import '../../../business_logic/notes/notes_cubit.dart';
// import '../../../widgets/default_form_field.dart';
//
//
//
// class AddNoteScreen extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<NotesCubit, NotesState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         //NoteCubit notesCubit = NoteCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(),
//             // appBar: PreferredSize(
//             //     preferredSize: Size.fromHeight(7.h),
//             //     child: const DefaultAppbar(
//             //       automaticallyImplyLeading: true,
//             //       title: 'Add Notes',
//             //     )),
//
//             body: Form(
//               key: context.read<NotesCubit>().addNoteKey,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 5.w),
//                 child: ListView(
//                   children: [
//                     SizedBox(height:5.h),
//                     DefaultTextFormField(
//                       maxLines:1,
//                       labelText: 'Title',
//                       hintText: 'Enter Title',
//                       validation: (val)
//                       {
//                         if (val.isEmpty)
//                         {
//                           return 'Please Enter Your Title';
//                         }
//
//                         else if(val.length>50)
//                         {
//                           return "Title must be less than 50 characters";
//                         }
//                       },
//                       onChanged: (value) {
//                         context.read<NotesCubit>().title = value;
//                       },
//                       controller: context.read<NotesCubit>().titleController,),
//                     SizedBox(height:5.h),
//                     DefaultTextFormField(
//                       maxLines: 5,
//                       labelText: 'Description',
//                       hintText: 'Enter Description',
//                       validation: (val) {
//                         if (val.isEmpty)
//                         {
//                           return 'Please Enter Your Description';
//                         }
//
//                       },
//                       onChanged: (value) {
//                         context.read<NotesCubit>().description = value;
//                       },
//                       controller: context.read<NotesCubit>().descriptionController,),
//                     SizedBox(height:5.h),
//
//
//                     ElevatedButton(
//
//                         child:const Text( "Add"),
//                         onPressed: () {
//                           if (context.read<NotesCubit>().addNoteKey.currentState!.validate())
//                           {
//                             context.read<NotesCubit>().insert(context);
//                           }
//                         }),
//                   ],
//                 ),
//               ),
//             ));
//       },
//     );
//   }
// }
