//
//  BVCropViewController.h
//  Router
//
//  Created by Bogdan V. on 11.07.14.
//  Copyright (c) 2014 Nowytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BVCropViewController;
@class BVCropPhotoView;

@protocol BVCropViewControllerDelegate <NSObject>
- (void)cropViewControllerDidCrop:(BVCropViewController *)sender croppedImage:(UIImage *)croppedImage;

@optional
- (void)cropViewControllerDidCancel:(BVCropViewController *)sender;
@end

@interface BVCropViewController : UIViewController

@property(nonatomic, weak) id <BVCropViewControllerDelegate> delegate;

@property(nonatomic, readonly) BVCropPhotoView *cropPhotoView;

// crop size
@property(nonatomic, assign) CGSize cropSize;
// source image
@property(nonatomic, strong) UIImage *sourceImage;

@end