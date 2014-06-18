//
// BVCropPhotoView.h
//
//  Created by Vitalii Bogdan on 11/06/2014 .
//  Copyright (c) 2014. All rights reserved.

@interface BVCropPhotoView : UIView
// crop for size
@property (nonatomic, assign) CGSize cropSize;
// overlay
@property (nonatomic, strong) UIImage * overlayImage;
// source image
@property (nonatomic, strong) UIImage * sourceImage;
// default 5
@property (nonatomic, assign) CGFloat maximumZoomScale;

- (id)initWithSourceImage:(UIImage *)image;

// cropped image with cropSize
- (UIImage *)croppedImage;

@end