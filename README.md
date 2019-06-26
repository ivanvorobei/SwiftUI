## `SwiftUI` Examples

<a href="https://itunes.apple.com/app/id1446635818" target="_blank"><img align="left" src="https://github.com/ivanvorobei/SwiftUI/blob/master/Resources/icon.png" width="70"/></a>

Examples projects using `SwiftUI` & `Combine`.  
Include Layout, UI, Animations, Gestures, Draw and Data. See projects files in `Examples` folder. If you have project, make a pull request or create issue with link to repo.

Interested in UI and animations in `UIKit`?  
See [awesome-ios-ui](https://github.com/ivanvorobei/awesome-ios-ui) pack with UI elements:

[![awesome-ios-ui](https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Buttons/Awesome%20iOS%20UI%20-%201.svg)](https://github.com/ivanvorobei/awesome-ios-ui)

If you like the project, do not forget to `put star ★`

## Navigate

My projects with small comment

- [Animatable Cards](#animatable-cards)
- [Area to Card](#area-to-card)

### Other projects

- [Transition And Blur](#transition-and-blur)
- [2048 Game](#2048-game)
- [SFSymbols](#sfsymbols)
- [Calculator](#calculator)
- [Creating And Combining Views](#creating-and-combining-views)
- [Building Lists And Navigation](#building-lists-and-navigation)
- [Handling User Input](#handling-user-input)
- [WWDCPlayer](#WWDCPlayer)
- [Composing Complex Interfaces](#composing-complex-interfaces)
- [Working With UIControls](#working-with-uicontrols)
- [Example To-Do App](#example-to-do-app)
- [iPadOS Scenes](#ipados-scenes)
- [Combine using GitHub API](#combine-using-github-api)
- [Async image loading](#async-image-loading)
- [Interfacing With UIKit](#interfacing-with-uikit)
- [GitHub Search](#github-search)
- [Time Travel](#time-travel)
- [Drawing Paths And Shapes](#drawing-paths-and-shapes)
- [Animating Views And Transitions](#animating-views-and-transitions)
- [Jike](#jike)
- [Flux](#flux)
- [SwiftUI Download Progress View](#SwiftUIDownloadView)
- [PureGenius](#puregenius)
- [SwiftUI SideMenu](#SwiftUI-SideMenu)

Also include:
- Movie
- InstaFake
- TempusRomanumII
- SwiftUI + Redux
- React Meets SwiftUI
- Webview
- UINote
- SplitView
- Card Animation

## Animatable Cards

<img align="left" src="Previews/animatable-cards.gif" width="280">

#### Gester

In class add property:

```swift
@GestureState var dragState = DragState.inactive
```

Class `DragState` see in file. Also you can see it in [apple's example page](https://developer.apple.com/documentation/swiftui/gestures/composing_swiftui_gestures).

To card add `gester` and `offset`:

```swift
.offset(
    x: dragState.translation.width,
    y: dragState.translation.height
)
.gesture(dragGester)
```

#### 3D

For add 3D rotation for back cards use code:

```swift
.rotation3DEffect(Angle(degrees: dragState.isActive ? 0 : 60), axis: (x: 10.0, y: 10.0, z: 10.0))
```

For medium card use 30 angles.

#### Animation

In preview I am use `Spring` animation for all cards:

```swift
.animation(.spring())

```

## Area to Card

<img align="left" src="Previews/area-to-card.gif" width="280">

#### SFSymbols

For button using `SFSymbols` pack with ready-use icons. Also support customisable weight:

```swift
Image(systemName: show ? "slash.circle.fill" : "slash.circle")
   .font(Font.title.weight(.semibold))
```

#### Button

For change state using `@State` as property:

```swift
@State var show = false
```

#### Frame

Size of area attach to state of property `show`:

```swift
.frame(width: show ? 350 : 290, height: show ? 420 : 260)
```

## Transition And Blur

<img src="Resources/TransitionBlur.png" width="700">

## 2048 Game

<img src="Resources/2048game.png" width="800">

## SFSymbols

<img src="Resources/SFSymbols.gif" width="700">

## Calculator

<img src="Resources/Calculator.png" width="250">

## Creating And Combining Views

<img src="Resources/CreatingAndCombiningViews.png" width="650">

## Building Lists And Navigation

<img src="Resources/BuildingListsAndNavigation.png" width="650">

### WWDCPlayer

<img src="Resources/WWDCPlayer.png" width="260">

### Handling User Input

<img src="Resources/HandlingUserInput.png" width="650">

### Composing Complex Interfaces

<img src="Resources/ComposingComplexInterfaces.png" width="650">

### Working With UIControls

<img src="Resources/WorkingWithUIControls.png" width="650">
<img src="Resources/WorkingWithUIControls2.png" width="650">

### Example To-Do App

<img src="Resources/ExampleToDoApp.png" width="850">

### iPadOS Scenes

<img src="Resources/iPadOSScenes.jpeg" width="600">

### Combine using GitHub API

<img src="Resources/CombineUsingGitHubAPI.png" width="260">

### Async image loading

<img src="Resources/AsyncImageLoading.gif" width="250">

### Interfacing With UIKit

<img src="Resources/InterfacingWithUIKit.png" width="650">

### GitHub Search

<img src="Resources/GitHubSearch.png" width="270">

### Time Travel

<img src="Resources/TimeTravel.gif" width="250">

### Drawing Paths And Shapes

<img src="Resources/DrawingPathsAndShapes.png" width="650">

### Animating Views And Transitions

<img src="Resources/AnimatingViewsAndTransitions.png" width="650">

### Jike

<img src="Resources/Jike.png" width="750">

### Flux

<img src="Resources/Flux.gif" width="260">

### SwiftUIDownloadView

<img src="Resources/SwiftUIDownloadView.gif" width="294">
#### PureGenius

<img src="Resources/PureGenius.gif" width="260">

### SwiftUI SideMenu

<img src="Resources/SwiftUISideMenu.gif" width="300">

### Authors

Thanks for [Jinxiansen](https://github.com/Jinxiansen), [ra1028](https://github.com/ra1028), [timdonnelly](https://github.com/timdonnelly), [TwoLivesLeft](https://github.com/TwoLivesLeft), [devxoul](https://github.com/devxoul), [cmtrounce](https://github.com/cmtrounce), [unixzii](https://github.com/unixzii), [ra1028](https://github.com/ra1028) for examples project.

