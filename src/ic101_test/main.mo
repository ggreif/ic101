import Canister "canister:ic101";
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
        // Will succeed
        it.should("see a single outcome", func () : async C.TestResult {
          let u = await Random.range(0);
          M.attempt(u, M.equals(T.nat 0))
        });

        // Will succeed
        it.should("see four outcomes", func () : async C.TestResult {
          let u = await Random.range(2);
          let {attempt; anyOf; equals; inRange} = M;
          //attempt(u, anyOf(A.map([0, 1, 2, 3], F.compose(equals, T.nat))))
          //attempt(u, anyOf(A.map([T.nat 0, T.nat 1, T.nat 2, T.nat 3], equals<Nat>)));
          //attempt(u, anyOf([equals(T.nat 0), equals(T.nat 1), equals(T.nat 2), equals(T.nat 3)]))
          attempt(u, inRange<Nat>(0, 3))
        });

        // Will succeed
        it.should("see binomial outcomes of 200 flips", func () : async C.TestResult {
          let u = await Random.binomialNat8(200);
          let {attempt; anyOf; equals; inRange} = M;
          attempt(Prim.nat8ToNat u, inRange<Nat>(0, 200))
        });

        // Will fail very seldom
        it.should("see binomial outcomes [3 .. 17] of 20 flips", func () : async C.TestResult {
          let u = await Random.binomialNat8(20);
          let {attempt; anyOf; equals; inRange} = M;
          attempt(Prim.nat8ToNat u, inRange<Nat>(3, 17))
        });

        // Will fail sometimes
        it.should("see a head coin flip", func () : async C.TestResult {
          let flip = await Random.coin();
          M.attempt(flip, M.equals(T.bool true))
        });

        await it.runAll()
    }
}
