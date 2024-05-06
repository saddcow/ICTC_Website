import 'package:ICTC_Website/models/program.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProgramDropdown extends StatefulWidget {
  const ProgramDropdown({super.key});


  @override
  State<ProgramDropdown> createState() => _ProgramDropdownState();
}

class _ProgramDropdownState extends State<ProgramDropdown> {

  Future<List<Program>> fetchPrograms({String? filter}) async {
    final supabase = Supabase.instance.client;
    List<Program> programs = await supabase
        .from('program')
        .select()
        .withConverter((data) => data.map((e) => Program.fromJson(e)).toList());

    return filter == null
        ? programs
        : programs.where((element) => element.title.contains(filter)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Program>(
      asyncItems: (filter) => fetchPrograms(),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
          labelText: 'Programs',
          filled: true,
        ),
      ),
      onChanged: (value) => setState(() => selectedProgram = value),
      selectedItem: selectedProgram,
      popupProps: const PopupProps.menu(showSearchBox: true),
      compareFn: (item1, item2) => item1.id == item2.id,
      
    );
  }
  Program? selectedProgram;
}

