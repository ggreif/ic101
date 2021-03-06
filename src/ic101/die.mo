import Random "mo:base/Random";

actor Die {
  /// roll a fair die
  /// each outcome in the range [1 .. 6] has the same probability
  public func roll() : async Nat {
    loop {
      let d = Random.rangeFrom(3, await Random.blob());
      if (d >= 1 and d <= 6) { return d };
    }
  }
};
