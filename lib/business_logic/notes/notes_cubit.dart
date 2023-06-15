// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:workshopodc/presentation/screens/notes/notes_screen.dart';
// import '../../data/models/note_model.dart';
// import '../../data_provider/local/sql_helper.dart';
// import '../../presentation/screens/edit_note/edit_note_screen.dart';
//
//
// part 'notes_state.dart';
//
// class NotesCubit extends Cubit<NotesState> {
//   NotesCubit() : super(NotesInitial());
//
//   static NotesCubit get(context) => BlocProvider.of(context);
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//
//   int? id;
//   String? title;
//   String? description;
//   String? date;
//   String datetime =
//   DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now());
//
//   NotesModel? notesModel;
//
//   final GlobalKey<FormState> addNoteKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> editNoteKey = GlobalKey<FormState>();
//
//   Future<dynamic> initialize() async {
//     SqlHelper.db.then((value) {
//       emit(InitialNotesSuccess());
//     }).catchError((error) {
//       emit(InitialNotesError());
//     });
//   }
//
//   Future<dynamic> insert(BuildContext context) async {
//     SqlHelper.insertDB({
//       'Description': '$description',
//       'Title': '$title',
//       'date': '$datetime',
//     }).then((value) {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => NotesScreen(),));
//       emit(InsertNotesSuccess());
//     }).catchError((error) {
//       emit(InsertNotesError());
//     });
//   }
//
//   Future<dynamic> delete(int id) async {
//     SqlHelper.deleteDB(id).then((value) {
//       emit(DeleteNotesSuccess());
//     }).catchError((value) {
//       emit(DeleteNotesError());
//     });
//   }
//
//   Future<dynamic> update(BuildContext context, int id, String title,
//       String description, String date) async {
//     SqlHelper.updateDB(id, title, description, date,).then((value) {
//       Navigator.pop(context);
//       emit(UpdateNotesSuccess());
//     }).catchError((e) {
//       emit(UpdateNotesError());
//     });
//   }
//
//   Future<dynamic> getOneNote(
//       BuildContext context,
//       int id,
//       String title,
//       String description,
//       String date,
//       ) async {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               EditNotesScreen(description: description, id: id, title: title),
//         ));
//     emit(GetOneRowNotesSuccess());
//   }
// }




import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:workshopodc/business_logic/notes/notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(DataBaseInitialState());
  List<Map> data = [];
  // bool isbottomsheetshown = false;
  // IconData fabicon = Icons.edit;

  // void changebottomsheetstate({required bool isshown,required IconData icon}){
  //   isbottomsheetshown=isshown;
  //   fabicon=icon;
  //   emit(appbottomsheetstate());
  // }

  late Database DB;

  createTable() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Notes.db');
    print(path);
    openDatabase(path, version: 1, onCreate: (database, version) {
      // table Tasks
      database
          .execute(
              'CREATE TABLE Notes(id INTEGER PRIMARY KEY,title TEXT,description TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print(error);
      });
    }, onOpen: (database) {
      getDB(database);
      print('Table Opened');
    }).then((value) {
      DB = value;
      emit(CreateDataBaseState());
    });
  }

  insertData({required String title, required String description}) async {
    await DB.transaction((txn) {
      //return   txn.rawInsert('INSERT INTO Notes(title,description) VALUES("$title","$description",)')
      return txn
          .rawInsert(
              'INSERT INTO Notes(title,description) VALUES("$title","$description")')
          .then((value) {
        print('inserted $value');
        emit(InsertDataBaseState());
        getDB(DB);
      }).catchError((error) {
        print(error);
      });
    });
  }

  getDB(database) async {
    data = [];
    await database.rawQuery('SELECT * FROM Notes').then((value) {
      value.forEach((element) {
        data.add(element);
      });

      emit(GetDataBaseState());
    });
  }

  upDB({required String status, required int id}) async {
    await DB.rawUpdate('UPDATE Notes SET status = ? WHERE id = ?', [
      '$status',
      id,
    ]).then((value) {
      getDB(DB);
      emit(UpdateDataBaseState());
    });
  }

  deleteDB(id) async {
    await DB.rawDelete('DELETE FROM Notes WHERE id = ?', ['$id']).then((value) {
      getDB(DB);
    });
    emit(DeleteDataBaseState());
  }
}
