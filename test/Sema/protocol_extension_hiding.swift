// RUN: %target-parse-verify-swift

protocol P {
    func foo() -> String
}

extension P {
    func foo() -> String {
        return "foo default"
    }
}

extension P {
    func bar() -> String { // expected-note {{this implementation will be used when accessed via a variable of 'P' type}}
        return "bar in extension"
    }
}


struct S : P {

    func foo() -> String {
        return "foo in S"
    }

    func bar() -> String { // expected-warning {{method 'bar()' has the same name as an extension to the 'P' protocol}}
        return "bar in S"
    }
}