// RUN: %target-parse-verify-swift

for var a = 0; a < 10; a++ { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}} {{10-13= in }} {{14-20= ..< }} {{22-27=}}
}

for var b = 0; b < 10; ++b { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}} {{10-13= in }} {{14-20= ..< }} {{22-27=}}
}

for var c=1;c != 5 ;++c { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}} {{10-11= in }} {{12-18= ..< }} {{20-24=}}
}

for var d=100;d<5;d++ { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}} {{10-11= in }} {{14-17= ..< }} {{18-22=}}
}

// next three aren't auto-fixable
for var e = 3; e > 4; e++ { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}}
}

for var f = 3; f < 4; f-- { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}}
}

let start = Int8(4)
let count = Int8(10)
var other = Int8(2)

for ; other<count; other++ { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}}
}

// this should be fixable, and keep the type
for (var number : Int8 = start; number < count; number++) { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}} {{23-26= in }} {{31-42= ..< }} {{47-57=}}
  print(number)
}

// should produce extra note
for (var m : Int8 = start; m < count; ++m) { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}} expected-note {{C-style for statement can't be automatically fixed to for-in, because the loop variable is modified inside the loop}}
  m += 3
}

// could theoretically fix this (and more like it if we auto-suggested "stride:")
for var o = 2; o < 888; o += 1 { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}}
}

// could theoretically fix this with "..."
for var p = 2; p <= 8; p++ { // expected-warning {{C-style for statement is deprecated and will be removed in a future version of Swift}}
}