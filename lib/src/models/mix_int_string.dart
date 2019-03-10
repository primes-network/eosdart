mixin MixIntString {
  // Due to the javascript have limit on the integer, some of the numbers
  // are in String format
  // https://github.com/EOSIO/eos/issues/6820
  static int getIntFromJson(dynamic value) {
    switch (value.runtimeType) {
      case String:
        return int.parse(value);
      default:
        return value as int;
    }
  }
}
