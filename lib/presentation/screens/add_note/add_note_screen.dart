//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import 'package:workshopodc/business_logic/notes/notes_cubit.dart';
// import 'package:workshopodc/widgets/custom_app_bar.dart';
// import 'package:workshopodc/widgets/default_form_field.dart';
//
//
//
//
//
// class AddNotesScreen extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocBuilder<NotesCubit, NotesState>(
//
//       builder: (context, state) {
//         NotesCubit notesCubit = NotesCubit.get(context);
//         return Scaffold(
//             appBar: PreferredSize(
//                 preferredSize: Size.fromHeight(7.h),
//                 child: const DefaultAppbar(
//                   automaticallyImplyLeading: true,
//                   title: 'Add Notes',
//                 )),
//
//             body: Form(
//               key: notesCubit.addNoteKey,
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
//                         notesCubit.title = value;
//                       },
//                       controller: notesCubit.titleController,),
//                     SizedBox(height:5.h),
//                     DefaultTextFormField(
//                       maxLines: 5,
//
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
//                         notesCubit.description = value;
//                       },
//                       controller: notesCubit.descriptionController,),
//                     SizedBox(height:5.h),
//
//
//                     ElevatedButton(
//                         style:ElevatedButton.styleFrom(
//                             primary:Colors.deepOrange
//                         ),
//                         child:const Text( "Add"),
//                         onPressed: () {
//                           if (notesCubit.addNoteKey.currentState!.validate())
//                           {
//                             notesCubit.insert(context);
//
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



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopodc/business_logic/notes/notes_cubit.dart';
import 'package:workshopodc/business_logic/notes/notes_state.dart';

import '../../../widgets/input_field.dart';

class AddNotesScreen extends StatelessWidget {
  AddNotesScreen({Key? key}) : super(key: key);
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var addNoteKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if(state is InsertDataBaseState){
          Navigator.pop(context);
        }

      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Form(
              key: addNoteKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    InputField(
                      validation: (String value) {
                        if(value.isEmpty){
                          return "Required";
                        }
                      },
                      label: 'Title',
                      controller: titleController,
                      labelColor: Colors.grey,
                    ),
                    const SizedBox(height: 30,),
                    InputField(
                      validation: (String value) {
                        if(value.isEmpty){
                          return "Required";
                        }
                      },
                      label: 'Description',
                      controller: descriptionController,
                      maxLines: 8,
                      labelColor: Colors.grey,
                      alignLabel: true,
                    ),
                    ElevatedButton(onPressed: () {
                      if(addNoteKey.currentState!.validate()){
                        context.read<NotesCubit>().insertData(
                            title: titleController.text,
                            description: descriptionController.text);
                      }

                    }, child: const Text('Add'))
                  ],),
              ),
            ),
          ),
        );
      },
    );
  }
}
