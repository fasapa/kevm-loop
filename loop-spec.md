ERC20-ish Verification
======================

```k
requires "edsl.md"
requires "optimizations.md"
requires "lemmas/lemmas.k"

requires "loop-bin-runtime.k"

module VERIFICATION
    imports EDSL
    imports LEMMAS
    imports EVM-OPTIMIZATIONS
    imports L-VERIFICATION

    syntax Step ::= Bytes | Int
    syntax KItem ::= runLemma ( Step ) | doneLemma ( Step )
 // -------------------------------------------------------
    rule <k> runLemma(S) => doneLemma(S) ... </k>

endmodule

module LOOP-SPEC
    imports VERIFICATION

claim [loop]:
      <mode>      NORMAL                                    </mode>
      <schedule>  MERGE                                     </schedule>
      <program>   #binRuntime(L)                         </program>
      <jumpDests> #computeValidJumpDests(#binRuntime(L)) </jumpDests>
      <pc>        0           => ?_                         </pc>
      <gas>       #gas(_VGAS) => ?_                         </gas>
      <callData>  L.max()                                   </callData>
      <k>         #execute   => #halt ...                   </k>
endmodule
```
