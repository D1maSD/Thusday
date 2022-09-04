import UIKit
import RxSwift

var greeting = "Hello, playground"
print("!")

public func example(of description: String, action: () -> Void)
{
    print("\n--- Example of:", description, "---")
    action() }

example(of: "just, of, from") {
    let one = 1
    let two = 2
    let three = 3
    
    let observable = Observable<Int>.just(one)
    let sequencdObservable = Observable.of([one, two], [three])
    let fromObservable = Observable.from([one, two, three])
    let observableAndPrint = Observable.of(one, two, three)
    
    observableAndPrint.subscribe { i in
        print(i)
    }
    
    observableAndPrint.subscribe { event in
        if let elevent = event.element {
            print(elevent)
        }
    }
}

let sequence = 0..<3

var iterator = sequence.makeIterator()

while let n = iterator.next() {
    //    print(n)
}


example(of: "empty") {
    let observable = Observable<Void>.empty()
    
    observable.subscribe(
        // 1
        onNext: { element in
            //            print(element)
        },
        // 2
        onCompleted: {
            print("Completed")
        }
    )
}

example(of: "never") {
    let observable = Observable<Void>.never()
    (
        onNext: { element in
            print(element)
            //            print("onNext")
        },
        onCompleted: {
            print("Completed")
        }
    )
}

example(of: "Range of") {
    let observable = Observable<Int>.range(start: 1, count: 10)
    
    observable.subscribe { i in
        let double = Double(i)
        
        let fibonacci = Int(
            ((pow(1.61803, n) - pow(0.61803, n)) /
             2.23606).rounded()
        )
        print(fibonacci)
    }
}

example(of: "Dispose") {
    let observable = Observable.of("A", "B", "C")
    
    let subscription = observable.subscribe { event in
        // 3
        print(event)
      }
    subscription.dispose()
}
