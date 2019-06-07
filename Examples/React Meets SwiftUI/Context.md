## Context

You can replicate the context functionality found in React by using a combination of `BindableObject`, `Combine` and defining an `environmentObject` for a View. You create a class that adheres to the `BindableObject` and provide that as an argument to `environmentObject` when initiating your parent view. Any child of that parent view can then access the class using `@EnvironmentObject`.

### React

```jsx
import React, { useContext } from "react";

const Session = React.createContext({ name: "" });

export function ContextProvider() {
  return (
    <Session.Provider value={{ name: "Bento" }}>
      <Parent />
    </Session.Provider>
  );
}

export function Parent() {
  return <Child />;
}

export function Child() {
  const session = useContext(Session);

  return <span>Hello {session.name}</span>;
}
```

### SwiftUI

```swift
import SwiftUI
import Combine

final class Session: BindableObject {
    let didChange = PassthroughSubject<Session, Never>()

    var name: String {
        didSet { didChange.send(self) }
    }

    init(name: String) {
        self.name = name
    }
}


struct ContextProvider : View {
    var body: some View {
        Parent().environmentObject(Session(name: "Bento"))
    }
}

struct Parent : View {
    var body: some View {
        Child()
    }
}

struct Child : View {

    @EnvironmentObject var session: Session

    var body: some View {
        Text("Hello \(session.name)")
    }
}
```
