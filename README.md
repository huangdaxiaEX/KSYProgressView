# KSYProgressView
🚀 A progress bar has color animation, support circle and line style.

## Results the preview
  <img src="demoPreview.gif" alt="demo preview" />
  
## Requirements

- iOS 8.0+ 
- Swift3.0+

## Install
You can use `CocoaPods` to install `KSYProgressView`

```
    pod 'KSYProgressView'
```

## How to use

* init
```Swift
  let circle = KSYProgressView()
  let line = KSYProgressView(progressBarType: .line)
  circle.frame = CGRect(x: view.center.x - 100, y: 128, width: 200, height: 200)
  line.frame = CGRect(x: view.center.x - 140, y: 360, width: 280, height: 20)
  view.addSubview(circle)
  view.addSubview(line)
```

* Update progress
``` Swift
  circle.update(progress: progress, color: UIColor(red: r, green: g, blue: b, alpha: 1), animated: true)
  line.update(progress: progress, color: UIColor(red: r, green: g, blue: b, alpha: 1), animated: true)
```
