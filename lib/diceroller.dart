import 'dart:math';

class DiceRoller {
  int _dice1, _dice2, _dice3, _dice4, _dice5;
  String _rollStatus;

  DiceRoller() {
    _rollStatus = 'ROLLEM';

    _dice1 = 1;
    _dice2 = 1;
    _dice3 = 1;
    _dice4 = 1;
    _dice5 = 1;
  }

  int getDiceValue(int diceNumber) {
    if (diceNumber == 1) {
      return _dice1;
    }
    if (diceNumber == 2) {
      return _dice2;
    }
    if (diceNumber == 3) {
      return _dice3;
    }
    if (diceNumber == 4) {
      return _dice4;
    }
    if (diceNumber == 5) {
      return _dice5;
    }
  }

  String getRollStatus() {
    return _rollStatus;
  }

  void changeDiceFace() {
    _dice1 = Random().nextInt(6) + 1;
    _dice2 = Random().nextInt(6) + 1;
    _dice3 = Random().nextInt(6) + 1;
    _dice4 = Random().nextInt(6) + 1;
    _dice5 = Random().nextInt(6) + 1;

    updateRollStatus(_dice1, _dice2, _dice3, _dice4, _dice5);
  }

  String updateRollStatus(int d1, int d2, int d3, int d4, int d5) {
    List<int> values = [d1, d2, d3, d4, d5];
    List<int> distinctValues = values.toSet().toList();

    if (distinctValues.length == 5) {
      _rollStatus = 'No particular combination!';
    }

    if (distinctValues.length == 4) {
      _rollStatus = 'Pair!';
    }

    if (distinctValues.length == 3) {
      if (duplicateTracker(values, distinctValues) == 2) {
        _rollStatus = '2 pairs!';
      } else {
        _rollStatus = '3 of a kind!';
      }
    }

    if (distinctValues.length == 2) {
      if (duplicateTracker(values, distinctValues) < 6) {
        _rollStatus = '3 of a kind and a pair!';
      } else {
        _rollStatus = '4 of a kind!';
      }
    }

    if (distinctValues.length == 1) {
      _rollStatus = '5 of a kind!';
    }

    return _rollStatus;
  }

  int duplicateTracker(List<int> values, List<int> distinctValues) {
    int duplicate = 0;

    // Begin with distinctValues
    for (int distinctIter = 0;
        distinctIter < distinctValues.length;
        distinctIter++) {
      // Look through original values to find a match
      for (int valueIter = 0; valueIter < values.length; valueIter++) {
        if (distinctValues[distinctIter] == values[valueIter]) {
          // Search for a match for a distinct value
          for (int pairFinder = valueIter + 1;
              pairFinder < values.length;
              pairFinder++) {
            if (values[pairFinder] == values[valueIter]) {
              // If a match exists, increment pairCounter.
              duplicate++;
            }
          }
        }
      }
    }
    return duplicate;
  }
}
