## Children

I'm still trying to really nail this one down, but it seems possible to pass children to child views in SwiftUI. This example shows a common `Layout`, `Content` composition pattern which I commonly use in React, and is the key to developing reusable, flexible components.

### React

```jsx
import React from "react";

function Page() {
  return (
    <Layout>
      <span>This is the page content</span>
    </Layout>
  );
}

function Layout({ children }) {
  return (
    <div>
      <span>This is the layout</span>
      {children}
    </div>
  );
}
```

### SwiftUI

The SwiftUI version seems harder to type. Currently, the below example only accepts a `Text` child. Does anyone know how to make this accept any view type?

```swift
import SwiftUI

struct Page : View {
    var body: some View {
        Layout() {
            Text("This is the page content")
        }
    }
}

struct Layout : View {

    var content: () -> Text

    var body: some View {
        VStack {
            Text("This is the layout")
            content()
        }
    }
}

```
