// RUN: %target-swift-frontend -parse -verify -module-name main %s

let foo: Bool! = true

// work -> error

1 /* */+2             // expected-error * {{}}
1 +/* comment */2     // expected-error * {{}}
1+/*comment*/ 2       // expected-error * {{}}

// error -> work

let a = /* */!foo
let b = !/* */foo

1+/* */2
1 /*/*whoa*/*/+ 2

// still errors

1/**/+ 2               // expected-error * {{}}
1 +/*comment*/2        // expected-error * {{}}

// still work

foo!// comment
foo/* /* whoa */ */?.description
foo/* */!

1 +/**/ 2
1/**/+2
1+/**/2
