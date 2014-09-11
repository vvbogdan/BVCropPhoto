DVCropViewController
=================

DVCropViewController is image cropping library for iOS.

## System requirements
- iOS 5.0 or higher

## Installation
### CocoaPods
`pod 'BVCropPhoto'`

## Usage

```objective-c
    DVCropViewController *controller = [[DVCropViewController alloc] init];
    controller.delegate = self;
    controller.sourceImage = [UIImage imageNamed:@"example1.jpg"];
    controller.cropSize = CGSizeMake(260, 286);
```

### Get the cropped image
**retrieve from view directly**
```objective-c
-(void)cropViewControllerDidCrop:(DVCropViewController *)sender croppedImage:(UIImage *)croppedImage{
    self.imageView.image = croppedImage;
}
```

## License

[Apache]: http://www.apache.org/licenses/LICENSE-2.0
[MIT]: http://www.opensource.org/licenses/mit-license.php
[GPL]: http://www.gnu.org/licenses/gpl.html
[BSD]: http://opensource.org/licenses/bsd-license.php

BVCropPhoto is available under the [MIT license][MIT]. See the LICENSE file for more info.
