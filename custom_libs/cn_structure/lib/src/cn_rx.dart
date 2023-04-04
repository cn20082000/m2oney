class CnRx<T> {
  T _value;
  void Function()? notify;

  CnRx(this._value);

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    notify?.call();
  }

  set silent(T newValue) {
    _value = newValue;
  }
}