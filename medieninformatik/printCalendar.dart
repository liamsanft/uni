// ====================================
// PROGRAMMBESCHREIBUNG
//
// In dieser Übung sollen wir eine Funktion printCalendar implementieren, welche einmal den Monat als Integer (1-12) und den Wochentag des Monatsbeginns (1-7) entgegen nimmt und dementsprechend einen formatierten Kalender an die Konsole ausgibt.
//
// Zuerst haben wir die Funktion printCalendar deklariert mit dem Return-Typ Void und den Parametern month (Integer) und day (Integer). In dieser überprüfen wir zuerst die übergebenen Parameter auf Fehler, also ob der Monat 1-12 und der Tag 1-7 ist und geben bei Fehlern einen Error in der Konsole aus.
//
// Danach deklarieren wir calendar als eine, bisher leere, Liste von Strings.
//
// Darauffolgend schreiben wir uns eine kleine Helfer-Funktion, welche eine Liste von Strings im benötigten Format als einzelne Zeile ausgibt (printCalendarLine).
//
// Jetzt nutzen wir einen for-Loop, welche die ersten freien leeren Tage in die calendar-Liste hinzufügt, indem er den day-Parameter nutzt.
//
// Nun wollen wir die Menge der Tage eines Monats herausfinden. Hierfür nutzen wir ein If-Statement, welches nacheinander alle Monate mit den verschiedenen Tageszahlen prüft und die Anzahl der Tage des Monats speichern wir in einer Variable monthLength.
//
// Im jetzigen Schritt fügen alle einzelnen Tage in die calendar-Liste hinzu. Wir nutzen einen for-Loop, welcher die monthLength nutzt. In diesem for-Loop nutzen wir auch ein If-Statement, welches prüft, ob der Tag eine oder zwei Stellen hat und dementsprechend noch ein Leerzeichen benötigt.
//
// Nun fehlen nur noch die lezten leeren Tage im calendar-Array, damit der Kalendar noch ausgefüllt wird. Dabei testen wir zuerst ob die bisherige Länge der calendar-Liste mod 7 = 0 ist oder noch Tage fehlen. Sollte dies der Fall sein, berechnen wir die letzten benötigten Tage mit 7 - der calender-Listenlänge mod 7 und loopen dementsprechend oft und fügen hierfür zwei Leerzeichen der calendar-Liste hinzu.
//
// Nun fehlt nur noch den Kalender final auszugeben. Zuerst nutzen wir unsere printCalendarLine-Funktion und geben die einzelnen Wochentage in der 1. Zeile aus. Nun teilen wir die calendar-Liste in kleiner Listen mit der Länge 7 ein, welche in einer großen Liste gespeichert werden. Über die große Liste loopen wir dann drüber und geben die 7er-Listen an die printCalendarLine-Funktion, welche uns die einzelnen formatierten Kalendertage und leeren Stellen ausgibt.
// ====================================

void printCalendar(int month, int day) {
  if (month >= 1 && month <= 12 && day >= 1 && day <= 7) {
    List<String> calendar = [];

    // function for printing line by using a list as input
    void printCalendarLine(List<String> fields) {
      print("|${fields.join('|')}|");
    }

    // add first empty days to calendar list
    for (int i = 0; i < day - 1; i++) {
      calendar.add("  ");
    }

    // get monthLength
    int monthLength;

    if (month == 2) {
      monthLength = 28;
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      monthLength = 30;
    } else {
      monthLength = 31;
    }

    // add days to list
    for (int i = 1; i <= monthLength; i++) {
      if (i < 10) {
        calendar.add(" $i");
      } else {
        calendar.add("$i");
      }
    }

    // add last empty days to calendar list
    if (calendar.length % 7 != 0) {
      int lastDays = 7 - calendar.length % 7;
      for (int i = 0; i < lastDays; i++) {
        calendar.add("  ");
      }
    }

    // ------------------------------
    // print calendar
    // ------------------------------

    // print header
    printCalendarLine(["MO", "DI", "MI", "DO", "FR", "SA", "SO"]);

    // generate sublists from calendar list
    List<List<String>> calendarSublists = [];

    for (int i = 0; i < calendar.length / 7; i++) {
      // generate sublist
      List<String> sublist = [];
      for (int j = 0; j < 7; j++) {
        sublist.add(calendar[j + i * 7]);
      }

      calendarSublists.add(sublist);
    }

    // output calendar
    for (List<String> sublist in calendarSublists) {
      printCalendarLine(sublist);
    }
  } else {
    throw Exception('Der eingegebene Monat oder Monatsanfang ist ungültig!');
  }
}

void main() {
  // test

  // normal use case
  //
  // for (int i = 1; i <= 12; i++) {
  //   for (int j = 1; j <= 7; j++) {
  //     printCalendar(i, j);
  //   }
  // }

  // edge cases
  //
  // printCalendar(0, 1);
  // printCalendar(13, 1);
  // printCalendar(1, 0);
  // printCalendar(1, 8);

  printCalendar(8, 3);
}
