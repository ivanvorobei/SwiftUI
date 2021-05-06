## `SwiftUI` Examples

<img align="left" src="Previews/animatable-cards.gif" width="280">

### About

Examples projects using `SwiftUI` & `Combine`.  
Include Layout, UI, Animations, Gestures, Draw and Data. See projects files in `Files` & `Other Projects` folders. If you have project, make a pull request or create issue with link to repo.

Interested in UI and animations in `UIKit`?  
See [awesome-ios-ui](https://github.com/ivanvorobei/awesome-ios-ui) pack with UI elements:

[![awesome-ios-ui](https://github.com/ivanvorobei/SPPermissions/blob/master/Assets/Buttons/awesome-ios-ui.svg)](https://github.com/ivanvorobei/awesome-ios-ui)

If you like the project, do not forget to `put star ★`  
and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/Readme/blob/main/Buttons/follow-me-ivanvorobei.svg)](https://github.com/ivanvorobei)

## Navigate

- [Animatable Cards](#animatable-cards)
- [Area to Card](#area-to-card)

#### Other projects

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
- [PureGenius](#puregenius)
- [SwiftUI Download Progress View](#SwiftUIDownloadView)
- [SwiftUI SideMenu](#SwiftUI-SideMenu)
- [SwiftUI Currency App](#SwiftUI-Currency)
- [SwiftUI Weather App](#SwiftUI-Weather)
- [DesignCode SwiftUI App](https://github.com/mythxn/DesignCode)
- [SwiftUI SlideToOpen](#MTSlideToOpen-SwiftUI)
- [Currency Converter & Calculator](#transition-and-blur)
- [FlipClock-SwiftUI](#FlipClock-SwiftUI)
- [Countdown Film Clutter](#CountdownFilmClutter-SwiftUI)
- [SpotlightSearch](#SpotlightSearch)
- [Growing text view in SwiftUI](#Growing-text-view-in-SwiftUI)
- [Calculator Clone for iPadOS](https://github.com/bofeiw/ios-calculator-clone-for-ipados)
- [MGFlipView](#MGFlipView)

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

#### 3D

For add 3D rotation for back cards use code:

```swift
.rotation3DEffect(
	Angle(degrees: dragState.isActive ? 0 : 60), axis: (x: 10.0, y: 10.0, z: 10.0)
 )
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

#### PureGenius

<img src="Resources/PureGenius.gif" width="260">

### SwiftUIDownloadView

<img src="Resources/SwiftUIDownloadView.gif" width="294">

### SwiftUI SideMenu

[Source](https://github.com/Vidhyadharan24/SideMenu)

<img src="Resources/SwiftUISideMenu.gif" width="300">

### SwiftUI Currency

[Source](https://github.com/alexliubj/SwiftUI-Currency-Converter)

<img src="Resources/SwiftUICurrency.png" width="300">

### SwiftUI Weather

[Source](https://github.com/bpisano/Weather) and [Tutorial](https://medium.com/lunabee-studio/building-a-weather-app-with-swiftui-4ec2743ff615)

<img src="https://github.com/bpisano/Weather/blob/master/Images/Banner.png" width="650">

### DesignCode SwiftUI
[Source](https://github.com/mythxn/DesignCode/tree/master)

<img src="https://github.com/mythxn/DesignCode-SwiftUI/blob/master/preview.gif" height=450><img src="https://i.imgur.com/N9HfWdD.png" height=450>

### MTSlideToOpen-SwiftUI
[Source](https://github.com/lemanhtien/MTSlideToOpen-SwiftUI)

<a href="url"><img src="https://raw.githubusercontent.com/lemanhtien/MTSlideToOpen-SwiftUI/master/example.gif" align="center" height="500" ></a>

### Currency Converter & Calculator

[Source](https://github.com/CurrencyConverterCalculator/iosCCC)

<img src="https://github.com/CurrencyConverterCalculator/iosCCC/blob/master/dark.gif" width="320px"/> <img src="https://github.com/CurrencyConverterCalculator/iosCCC/blob/master/light.gif" width="320px"/>
### FlipClock-SwiftUI
[Source](https://github.com/elpassion/FlipClock-SwiftUI)

|Light|Dark|
|:-:|:-:|
|<img src="https://github.com/elpassion/FlipClock-SwiftUI/blob/master/Gifs/flip_clock_light.gif" width="260">|<img src="https://github.com/elpassion/FlipClock-SwiftUI/blob/master/Gifs/flip_clock_dark.gif" width="260">|

### CountdownFilmClutter-SwiftUI

[Source](https://github.com/elpassion/CountdownFilmClutter-SwiftUI)

<img src="https://github.com/elpassion/CountdownFilmClutter-SwiftUI/blob/master/Gifs/countdown_film_clutter.gif">

### SpotlightSearch
[Source](https://github.com/boraseoksoon/SpotlightSearch)

|Light|Dark|
|:-:|:-:|
|<img src="https://github.com/boraseoksoon/SpotlightSearch/blob/master/gif/white_theme.gif" width="260">|<img src="https://github.com/boraseoksoon/SpotlightSearch/blob/master/gif/dark_theme.gif" width="260">|

### SwiftUI Weather App with MVVM and CoreML

[Source](https://github.com/necatievrenyasar/SwiftUI-WeatherApp)

<img src="https://user-images.githubusercontent.com/1447937/72296817-96f10580-366b-11ea-957c-023efeac958f.png" width="300">

### Growing text view in SwiftUI
[Source](https://github.com/Zaprogramiacz/GrowingTextView)

<img src="https://github.com/Zaprogramiacz/GrowingTextView/blob/master/Resources/growing_text_view.gif">

### MGFlipView
[Source](https://github.com/Zaprogramiacz/MGFlipView)

<img src="https://github.com/Zaprogramiacz/MGFlipView/blob/master/Examples/flip_view_example.gif">

### Authors

Thanks for [Jinxiansen](https://github.com/Jinxiansen), [ra1028](https://github.com/ra1028), [timdonnelly](https://github.com/timdonnelly), [TwoLivesLeft](https://github.com/TwoLivesLeft), [devxoul](https://github.com/devxoul), [cmtrounce](https://github.com/cmtrounce), [unixzii](https://github.com/unixzii), [ra1028](https://github.com/ra1028) for examples project.

## Other Projects

#### [SPAlert](https://github.com/ivanvorobei/SPAlert)
You can find this alerts in AppStore after feedback or after added song to library in Apple Music. Contains popular Done, Heart presets and many other. Done preset present with draw path animation like original. Also available simple present message without icon. Usage in one line code.

#### [SPPerspective](https://github.com/ivanvorobei/SPPerspective)
Animation of widgets from iOS 14. 3D transform with dynamic shadow. Look [video preview](https://ivanvorobei.by/github/spperspective/video-preview). Available deep customisation 3D and shadow. Also you can use static transform without animation.

#### [SPPermissions](https://github.com/ivanvorobei/SPPermissions)
Using for request and check state of permissions. Available native UI for request multiple permissions at the same time. Simple integration and usage like 2 lines code.

#### [SPDiffable](https://github.com/ivanvorobei/SPDiffable)
Simplifies working with animated changes in table and collections. Apple's diffable API required models for each object type. If you want use it in many place, you pass time to implement it and get over duplicates codes. This project help do it elegant with shared models and special cell providers. Support side bar iOS14 and already has native cell providers and views.

#### [SparrowKit](https://github.com/ivanvorobei/SparrowKit)
Collection of native Swift extensions to boost your development. Support tvOS and watchOS.

Для русского комьюнити

## Russian-specking Community

В телеграм-канале [Код Воробья](https://sparrowcode.by/telegram) пишу о iOS разработке. Помощь можно найти в [нашем чате](https://sparrowcode.by/telegram/chat).

Видео-туториалы выклыдываю на [YouTube](https://sparrowcode.by/youtube):

[![Tutorials on YouTube](https://cdn.ivanvorobei.by/github/readme/youtube-preview.jpg)](https://sparrowcode.by/youtube)

[Стикеры в телеграм](https://sparrowcode.by/telegram/stickers) про iOS разработку:

[![Telegram Stikers](https://cdn.ivanvorobei.by/github/readme/telegram-stikers-preview.png)](https://sparrowcode.by/telegram/stickers)

