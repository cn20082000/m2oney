extension ExtDouble on num {
  num limit({num? min, num? max}) {
    if (min != null && this < min) {
      return min;
    }
    if (max != null && this > max) {
      return max;
    }
    return this;
  }
}
