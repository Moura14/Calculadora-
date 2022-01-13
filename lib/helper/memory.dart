class Memory {
  static const operations = const ['%', '/', 'x', '-', '+', '='];
  String value = '0';
  final buffer = [0.0, 0.0];
  int bufferIndex = 0;
  String operation = '';
  bool _wipeValue = false;

  void applyCommand(String command) {
    if (command == "AC") {
      allClear();
    } else if (operations.contains(command)) {
      _setOperations(command);
    } else {
      _addDigit(command);
    }
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (value == '0' && !isDot) || _wipeValue;

    if (isDot && value.contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : value;
    value = currentValue + digit;
    _wipeValue = false;

    buffer[bufferIndex] = double.tryParse(value) ?? 0;
    print(buffer);
  }

  _setOperations(String newOperations) {
    if (bufferIndex == 0) {
      operation = newOperations;
      bufferIndex = 1;
    } else {
      buffer[0] = _calculate();
      buffer[1] = 0.0;
      value = buffer[0].toString();
      value = value.endsWith('.0') ? value.split('.')[0] : value;
    }

    _wipeValue = true;
  }

  void allClear() {
    value = '0';
    buffer.setAll(0, [0.0, 0.0]);
    bufferIndex = 0;
    _wipeValue = false;
  }

  _calculate() {
    switch (operation) {
      case '%':
        return buffer[0] % buffer[1];
      case '/':
        return buffer[0] / buffer[1];
      case 'x':
        return buffer[0] * buffer[1];
      case '-':
        return buffer[0] - buffer[1];
      case '+':
        return buffer[0] + buffer[1];
      case '=':
        return buffer[0];
      default:
    }
  }
}
