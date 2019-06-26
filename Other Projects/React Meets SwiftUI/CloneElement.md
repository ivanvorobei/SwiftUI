## cloneElement

You'll sometimes use React's `cloneElement` to provide additonal attributes to a child component - i.e, to add an event handler, className, etc. You can achieve similar behaviour in SwiftUI.

### React

```jsx
import React from "react";

export function PageElement() {
  return (
    <div>
      <LayoutElement>
        <span>This is the page content</span>
      </LayoutElement>
    </div>
  );
}

export function LayoutElement({ children }) {
  return (
    <div>
      <span>This is the layout</span>
      {React.cloneElement(children, {
        style: {
          fontWeight: "bold",
          fontSize: "2rem"
        }
      })}
    </div>
  );
}
```

### Swift

```swift
import SwiftUI

struct PageElement : View {
    var body: some View {
        LayoutElement() {
            Text("This is the page content")
        }
    }
}

struct LayoutElement : View {

    var content: () -> Text

    var body: some View {
        VStack {
            Text("This is the layout")
            content()
                .bold()
                .font(.largeTitle)
        }
    }
}
```
