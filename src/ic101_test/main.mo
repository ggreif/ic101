import Canister "canister:ic101";
import Die "canister:die";
import C "mo:matchers/Canister";
import M "mo:matchers/Matchers";
import T "mo:matchers/Testable";
import Prim "mo:prim";
import Random "mo:base/Random";

actor {
    let it = C.Tester({ batchSize = 2 });
    public shared func test() : async Text {
/*
        it.should("greet me", func () : async C.TestResult {
          let greeting = await Canister.greet("Christoph");
          M.attempt(greeting, M.equals(T.text("Hello, Christoph!")))
        });

        it.shouldFailTo("greet him-whose-name-shall-not-be-spoken", func () : async () {
          ignore await Canister.greet("Voldemort")
        });

        // Will fail
        it.should("greet Claudio", func () : async C.TestResult {
          let greeting = await Canister.greet("Claudio");
          M.attempt(greeting, M.equals(T.text("Hello, Karl!")))
        });

        // Will fail
        it.shouldFailTo("greet Joachim", func () : async () {
          ignore await Canister.greet("Joachim");
        });
*/
        let {attempt; equals; inRange} = M;

        // Will succeed
        it.should("see a byte outcome", func () : async C.TestResult {
          let b = await Random.byte();
          attempt(Prim.nat8ToNat b, inRange<Nat>(0, 255))
        });

        // Will succeed
        it.should("see a single outcome", func () : async C.TestResult {
          let u = await Random.range(0);
          M.attempt(u, M.equals(T.nat 0))
        });

        // Will succeed
        it.should("see four outcomes", func () : async C.TestResult {
          let u = await Random.range(2);
          attempt(u, inRange<Nat>(0, 3))
        });

        // Will succeed
        it.should("see binomial outcomes of 200 flips", func () : async C.TestResult {
          let u = await Random.binomial(200);
          attempt(Prim.nat8ToNat u, inRange<Nat>(0, 200))
        });

        // Will fail very seldom
        it.should("see binomial outcomes [3 .. 17] of 20 flips", func () : async C.TestResult {
          let u = await Random.binomial(20);
          attempt(Prim.nat8ToNat u, inRange<Nat>(3, 17))
        });

        // Will fail sometimes
        it.should("see a head coin flip", func () : async C.TestResult {
          let flip = await Random.coin();
          M.attempt(flip, M.equals(T.bool true))
        });

        let block = await Random.blob();
        let fin = Random.Finite block;

        // Will succeed
        it.should("see binomial outcomes of 255 flips", func () : async C.TestResult {
          let ?u = fin.binomial(255);
          attempt(Prim.nat8ToNat u, inRange<Nat>(0, 255))
        });

        // Will succeed
        it.should("see a properly rolled die", func () : async C.TestResult {
          let r = await Die.roll();
          attempt(r, inRange<Nat>(1, 6))
        });

        await it.runAll()
    }
}
