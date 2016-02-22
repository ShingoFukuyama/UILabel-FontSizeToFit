# UILabel+FontSizeToFit

UILabel can shrink font size as follows:

```swift
label.minimumScaleFactor = 0.3
label.adjustsFontSizeToFitWidth = true
label.numberOfLines = 1
```

However, it works only when `numberOfLines` is 1.
So, what if you want to make it more than one line?

That is why this UILabel extension exists!

![demo](https://raw.githubusercontent.com/ShingoFukuyama/UILabel-FontSizeToFit/master/fontSizeToFit.gif)

## Usage

Just add one line to fit font size to the label.

### Swift

```swift
label.fontSizeToFit()
```

+ [/Swift/UILabel_FontSizeToFit/UILabel+FontSizeToFit.swift](docs/Swift/UILabel_FontSizeToFit/UILabel%2BFontSizeToFit.swift)

### Objective-C

```objc
[label fontSizeToFit];
```

+ [/Objective-C/UILabel_FontSizeToFitObjC/ViewController.h](docs/Objective-C/UILabel_FontSizeToFitObjC/ViewController.h)
+ [/Objective-C/UILabel_FontSizeToFitObjC/UILabel+FontSizeToFit.m](docs/Objective-C/UILabel_FontSizeToFitObjC/ViewController.m)

Do not forget `#import "UILabel+FontSizeToFit.h"`


## License

And of course:

MIT: http://rem.mit-license.org


## PR

iOS App: [Ohajiki Web Browser](https://itunes.apple.com/app/id1039646068?mt=8)
