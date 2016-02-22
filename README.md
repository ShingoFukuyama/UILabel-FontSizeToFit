# UILabel+FontSizeToFit

UILabel can shrink font size as follows:

```swift
label.minimumScaleFactor = 0.3
label.adjustsFontSizeToFitWidth = true
label.numberOfLines = 1
```

However, what if you want to make it more than one line?

That is why this UILabel extension exists!

![demo](https://raw.githubusercontent.com/ShingoFukuyama/UILabel-FontSizeToFit/master/fontSizeToFit.gif)

## Usage

Just add one line to fit font size to the label.

### Swift

```swift
label.fontSizeToFit()
```

### Objective-C

Do not forget `#import "UILabel+FontSizeToFit.h"`

```objc
[label fontSizeToFit];
```


## License

And of course:

MIT: http://rem.mit-license.org


## PR

iOS App: [Ohajiki Web Browser](https://itunes.apple.com/app/id1039646068?mt=8)
