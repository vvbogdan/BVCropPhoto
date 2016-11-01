BVCropPhoto
=================

BVCropPhoto is image cropping library for iOS.

## System requirements
- iOS 9.0 or higher

## Installation
**CocoaPods**

`pod 'BVCropPhoto'`

## Usage
### BVCropPhotoView
**Using with image overlay**
```objective-c
    self.cropPhotoView = [[BVCropPhotoView alloc] init];
    self.cropPhotoView.overlayImage = [UIImage imageNamed:@"crop-overlay-568h"];
    self.cropPhotoView.sourceImage = [UIImage imageNamed:@"example1.jpg"];
    self.cropPhotoView.cropSize = CGSizeMake(260, 286);
```
**Using with custom overlay view**

```objective-c
    self.cropPhotoView = [[BVCropPhotoView alloc] init];
    self.cropPhotoView.sourceImage = [UIImage imageNamed:@"example1.jpg"];
    self.cropPhotoView.cropSize = CGSizeMake(260, 286);
    BVCropPhotoOverlayView * overlay = [[BVCropPhotoOverlayView alloc] initWithCropSize:self.cropPhotoView.cropSize];
    [self.cropPhotoView updateOverlayView:overlay];
```

#### Get the cropped image
```objective-c
UIImage * croppedImage = self.cropPhotoView.croppedImage;
```

### BVCropViewController

#### Init

```objective-c
    BVCropViewController *controller = [[BVCropViewController alloc] init];
    controller.cropSize = CGSizeMake(260, 286);
    controller.cropPhotoView.maximumZoomScale = 10;
    [controller.cropPhotoView updateOverlayView:[[BVCropPhotoOverlayView alloc] initWithCropSize:CGSizeMake(260, 286)]];
    controller.delegate = self;
    controller.sourceImage = [UIImage imageNamed:@"example1.jpg"];
```

#### Get the cropped image

```objective-c
- (void)cropViewControllerDidCrop:(BVCropViewController *)sender croppedImage:(UIImage *)croppedImage{
    self.imageView.image = croppedImage;
}
```


## License

[Apache]: http://www.apache.org/licenses/LICENSE-2.0
[MIT]: http://www.opensource.org/licenses/mit-license.php
[GPL]: http://www.gnu.org/licenses/gpl.html
[BSD]: http://opensource.org/licenses/bsd-license.php

BVCropPhoto is available under the [MIT license][MIT]. See the LICENSE file for more info.
