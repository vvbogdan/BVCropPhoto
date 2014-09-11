//
//  DVCropViewController.h
//  Router
//
//  Created by Sergey Shpygar on 11.07.14.
//  Copyright (c) 2014 DENIVIP Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DVCropViewController;

@protocol DVCropViewControllerDelegate <NSObject>

- (void)cropViewControllerDidCrop:(DVCropViewController *)sender croppedImage:(UIImage *)croppedImage;

@optional

- (void)cropViewControllerDidCancel:(DVCropViewController *)sender;

@end

@interface DVCropViewController : UIViewController

@property (nonatomic, weak) id<DVCropViewControllerDelegate> delegate;

@property (nonatomic, assign) CGSize cropSize;
// source image
@property (nonatomic, strong) UIImage * sourceImage;
// default 5
@property (nonatomic, assign) CGFloat maximumZoomScale;

@end