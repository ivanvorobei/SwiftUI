## ComponentDidMount

With React it's common to perform one-time operations (such as async fetches to a server) in the `componentDidMount` function or the `useEffect` hook. You can replicate this behaviour using the `onAppear` and `onDisappear` callbacks on any View. This means that you can actually have multiple `onAppear` callbacks attached to multiple views contained within your `body` function. Your parent view can also attach these callbacks to custom child views.

The below example mounts and unmounts the counter readout when it reaches a certain value. We log when the mount/unmount happens.

### React

```jsx
import React from "react";

export function Counter() {
  const [count, setCount] = React.useState(0);

  function increment() {
    setCount(count + 1);
  }

  return (
    <div>
      <button onClick={increment}>Increment</button>
      {(count < 10 || count > 12) && <ChildCounter count={count} />}
    </div>
  );
}

export function ChildCounter({ count }) {
  React.useEffect(() => {
    console.log("mounted");

    return () => {
      console.log("unmounting");
    };
  }, []);

  return <div>{count}</div>;
}
```

### Swift

Note that this only approximates the React behaviour. I'm not sure what the `appear` / `mount` distinction implies, but it seems to provide similar utility.

```swift
import SwiftUI

struct Counter : View {
    @State var count = 0

    func increment () {
        count += 1
    }

    var body: some View {

        VStack {
            Button(action: increment) {
                Text("Increment")
            }
            if count < 10 || count > 12 {
                ChildCounter(count: count)
            }
        }

    }
}

struct ChildCounter : View {
    var count: Int

    func onMount () {
        print("on mount")
    }

    func onUnmount () {
        print("on unmount")
    }

    var body: some View {
        Text("\(count)")
            .onAppear(perform: onMount)
            .onDisappear(perform: onUnmount)
    }
}

```

You can attach multiple `onAppear` and `onDisappear` callbacks in your `body` function:

```swift
struct Counter : View {
    @State var count = 0

    func increment () {
        count += 1
    }

    func mount () {
        print("Child mount")
    }

    func unmount () {
        print("Child unmount")
    }

    func parentMount () {
        print("parent mount")
    }


    var body: some View {
        VStack {
            Button(action: increment) {
                Text("Increment")
            }
            if count < 10 || count > 12 {
                ChildCounter(count: count)
                    .onAppear(perform: mount)
                    .onDisappear(perform: unmount)
            }
        }
        .onAppear(perform: parentMount)
    }
}
```
