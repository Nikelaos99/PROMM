import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tema1_actividad1/screens/screens.dart';

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavegacionDrawer(),
      appBar: AppBar(title: Text('Registro de Evento')),
      body: FormularioRegistroEvento(),
    );
  }
}

class FormularioRegistroEvento extends StatefulWidget {
  @override
  _FormularioRegistroEventoState createState() =>
      _FormularioRegistroEventoState();
}

class _FormularioRegistroEventoState extends State<FormularioRegistroEvento> {
  final _formKey = GlobalKey<FormState>();

  String? _tipoEventoSeleccionado;
  bool _aceptarTerminos = false;
  bool _recordatorio = false;
  String _generoSeleccionado = 'Masculino';
  double _participantes = 10;
  int _numberPickerValue = 50;
  int _randomNumber = Random().nextInt(100) + 1;
  DateTime? _fechaSeleccionada;
  TextEditingController _dateController = TextEditingController();

  String? _checkboxError;
  String? _numberPickerError;

  @override
  void initState() {
    super.initState();
    // Inicializar la configuración regional de fecha para español
    initializeDateFormatting('es_ES', null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            // TextFormField
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Nombre del Evento', icon: Icon(Icons.abc)),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa el nombre del evento';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            TextFormField(
              decoration:
                  InputDecoration(labelText: 'E-mail', icon: Icon(Icons.mail)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa un e-mail';
                } else if (!(RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                    .hasMatch(value))) {
                  return 'Por favor, ingresa un e-mail con formato valido';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // DropDownButton
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  labelText: 'Tipo de Evento', icon: Icon(Icons.star)),
              value: _tipoEventoSeleccionado,
              onChanged: (String? newValue) {
                setState(() {
                  _tipoEventoSeleccionado = newValue;
                });
              },
              validator: (value) => value == null
                  ? 'Por favor, selecciona un tipo de evento'
                  : null,
              items: ['Conferencia', 'Taller', 'Seminario', 'Concierto']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // RadioListTile
            Column(
              children: [
                ListTile(
                  title: Text('Masculino'),
                  leading: Radio<String>(
                    value: 'Masculino',
                    groupValue: _generoSeleccionado,
                    onChanged: (String? value) {
                      setState(() {
                        _generoSeleccionado = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Femenino'),
                  leading: Radio<String>(
                    value: 'Femenino',
                    groupValue: _generoSeleccionado,
                    onChanged: (String? value) {
                      setState(() {
                        _generoSeleccionado = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Slider
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Número de participantes: ${_participantes.toInt()}'),
                Slider(
                  value: _participantes,
                  min: 1,
                  max: 100,
                  divisions: 99,
                  onChanged: (double value) {
                    setState(() {
                      _participantes = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            // Campo Fecha
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                  labelText: 'Fecha del Evento', icon: Icon(Icons.event)),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                  locale: const Locale("es", "ES"),
                );

                if (pickedDate != null) {
                  setState(() {
                    _fechaSeleccionada = pickedDate;
                    _dateController.text =
                        DateFormat('dd/MM/yyyy', 'es_ES').format(pickedDate);
                  });
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, selecciona una fecha';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // SwitchListTile
            SwitchListTile(
              title: Text('Recordatorio'),
              value: _recordatorio,
              onChanged: (bool value) {
                setState(() {
                  _recordatorio = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Number Picker centrado con botón para cambiar el número aleatorio
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Selecciona el número: $_randomNumber'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 3,
                        ),

                        borderRadius:
                            BorderRadius.circular(8), // Bordes redondeados
                      ),
                      child: NumberPicker(
                        minValue: 1,
                        maxValue: 100,
                        value: _numberPickerValue,
                        onChanged: (value) {
                          setState(() {
                            _numberPickerValue = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _randomNumber = Random().nextInt(100) + 1;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Número aleatorio cambiado: $_randomNumber'),
                            ),
                          );
                        });
                      },
                      child: Icon(Icons.restart_alt),
                    ),
                  ],
                ),
                if (_numberPickerError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _numberPickerError!,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
              ],
            ),

            // CheckBoxListTile
            CheckboxListTile(
              title: Text('Acepto los términos y condiciones'),
              value: _aceptarTerminos,
              onChanged: (bool? value) {
                setState(() {
                  _aceptarTerminos = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (_checkboxError != null)
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  _checkboxError!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),

            // Botón de Envío
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Si el checkbox no está marcado, mostrar error.
                  if (!_aceptarTerminos) {
                    _checkboxError = 'Debe aceptar los términos y condiciones';
                  } else {
                    _checkboxError = null;
                  }

                  // Verificar si el número seleccionado es igual al número aleatorio
                  if (_numberPickerValue != _randomNumber) {
                    _numberPickerError = _numberPickerValue < _randomNumber
                        ? 'El número debería ser mayor'
                        : 'El número debería ser menor';
                  } else {
                    _numberPickerError = null;
                  }

                  // Validar formulario y checkbox.
                  if (_formKey.currentState!.validate() &&
                      _aceptarTerminos &&
                      _numberPickerError == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Formulario enviado para la fecha: ${DateFormat('dd/MM/yyyy', 'es_ES').format(_fechaSeleccionada!)}',
                        ),
                      ),
                    );
                  }
                });
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
