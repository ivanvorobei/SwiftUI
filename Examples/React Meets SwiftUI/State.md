## Managing State

With SwiftUI you can create state in views and pass that state to child views, much as you would in React. You can also pass functions as props which allow child views to control state in parent components.

The example below creates a simple counter. The `ContentView` manages the `count` state, while the child view renders that count and asks the parent to increment.

### React

```jsx
import React from "react";

export function ContentView() {
  const [count, setCount] = useState(0);

  function increment() {
    setCount(count + 1);
  }

  return (
    <div>
      <div>Press the button below</div>
      <ChildView count={count} increment={increment} />
    </div>
  );
}

export function ChildView({ count, increment }) {
  return (
    <div>
      <div>{coun t}</div>
      <button onClick={increment}>Increment</button>
    </div>
  );
}
```

### SwiftUI

```swift
import SwiftUI

struct ContentView : View {
    @State var count = 0

    var body: some View {
        VStack(spacing: 1.0) {
            Text("Press the button below")
            ChildView(
                counter: count,
                increment: increment
            )
        }
    }

    func increment() {
        count += 1
    }
}


struct ChildView : View {
    var counter: Int
    var increment: () -> Void

    var body: some View {
        VStack {
            Text("\(counter)")
            Button(action: increment) {
                Text("Increment")
            }
        }
    }
}

```

With SwiftUI you can use `@Binding` to enable child views to alter state provided by parent views. Notice that we prepend the `$` to our count value to pass its binding value. Our child can then alter the `count` state itself without supplying a callback to the parent.

```swift
import SwiftUI

struct ContentView : View {
    @State var count = 0

    var body: some View {
        VStack(spacing: 1.0) {
            Text("Press the button below")
            ChildView(
                counter: $count
            )
        }
    }
}


struct ChildView : View {
    @Binding var counter: Int

    func increment () {
        counter += 1
    }

    var body: some View {
        VStack {
            Text("\(counter)")
            Button(action: increment) {
                Text("Increment")
            }
        }
    }
}
```
