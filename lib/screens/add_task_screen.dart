import 'package:ejemplo1/events/alertDialog.dart';
import 'package:ejemplo1/helpers/database_helper.dart';
import 'package:ejemplo1/models/task_model.dart';
import 'package:ejemplo1/screens/todo_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int verficator = 0;

class AddTaskSreen extends StatefulWidget {
  final Task task;
  final Function updateTaskList;

  const AddTaskSreen({Key key, this.task, this.updateTaskList})
      : super(key: key);

  @override
  _AddTaskSreenState createState() => _AddTaskSreenState();
}

class _AddTaskSreenState extends State<AddTaskSreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _priority = '';
  DateTime _date = DateTime.now();

  TextEditingController _dateController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');
  final List<String> _priorities = ['Bajo', 'Medio', 'Alto'];

  _handleDatePicker() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormat.format(date);
    }
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('$_title $_date $_priority');

      //insert the task to our user's database
      Task task = Task(title: _title, date: _date, priority: _priority);
      if (widget.task == null) {
        task.status = 0;
        DatabaseHelper.instance.insertTask(task);
      } else {
        //update the task
        task.id = widget.task.id;
        task.status = widget.task.status;
        DatabaseHelper.instance.updateTask(task);
      }
      widget.updateTaskList();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TodoListScreeen()));
    }
  }

  _delete() {
    DatabaseHelper.instance.deleteTask(widget.task.id);
    widget.updateTaskList();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoListScreeen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.task != null) {
      _title = widget.task.title;
      _date = widget.task.date;
      _priority = widget.task.priority;
    }
    _dateController.text = _dateFormat.format(_date);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.task == null ? 'Añadir Tarea' : 'Actualizar Tarea',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              labelText: 'Titulo ',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (input) => input.trim().isEmpty
                              ? "Por favor ingrese una tarea"
                              : null,
                          onSaved: (input) => {
                            _title = input,
                          },
                          initialValue: _title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: TextFormField(
                            readOnly: true,
                            controller: _dateController,
                            onTap: _handleDatePicker,
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                labelText: 'Fecha',
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (input) => (input.trim().isEmpty
                                ? "Ingrese la fecha"
                                : null)),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: DropdownButtonFormField(
                            isDense: true,
                            items: _priorities.map((String priority) {
                              return DropdownMenuItem(
                                  value: priority,
                                  child: Text(
                                    priority,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ));
                            }).toList(),
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                labelText: 'Prioridad',
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (input) => _priority == null
                                ? "Por favor Selecciona la Prioridad"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value;
                              });
                            },
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: FlatButton(
                          onPressed: () {
                            if (widget.task == null) {
                              _submit();
                            } else {
                              buttonIos(
                                  context,
                                  'A sido Actualizada',
                                  'Tu tarea ${widget.task.title}',
                                  'salir',
                                  _submit);
                            }
                            print(_title);
                          },
                          child: Text(
                            widget.task == null ? "añadir" : 'Actualizar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      widget.task == null
                          ? SizedBox.shrink()
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: FlatButton(
                                onPressed: () => buttonIos(
                                    context,
                                    'Tu Tarea: ${widget.task.title}',
                                    'Tarea Pendiente',
                                    'Salir',
                                    _delete),
                                child: Text(
                                  'Eliminar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
