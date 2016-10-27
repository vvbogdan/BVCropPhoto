//
//  BVCropViewController.m
//  Router
//
//  Created by Bogdan V. on 11.07.14.
//  Copyright (c) 2014 Nowytech. All rights reserved.
//

#import "BVCropViewController.h"
#import "BVCropPhotoOverlayView.h"
#import "BVCropPhotoView.h"

@interface BVCropViewController ()

@property(nonatomic, strong) BVCropPhotoView *cropPhotoView;

@end

@implementation BVCropViewController


- (id)init {
    self = [super init];
    if (self) {
        self.cropPhotoView = [[BVCropPhotoView alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.cropPhotoView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(cropAction:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                          target:self
                                                                                          action:@selector(cancelAction:)];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.cropPhotoView.frame = self.view.bounds;
}


- (void)setCropSize:(CGSize)cropSize {
    self.cropPhotoView.cropSize = cropSize;
}

- (CGSize)cropSize {
    return self.cropPhotoView.cropSize;
}

- (void)setSourceImage:(UIImage *)sourceImage {
    self.cropPhotoView.sourceImage = sourceImage;
}


- (UIImage *)sourceImage {
    return self.cropPhotoView.sourceImage;
}


#pragma mark - Actions -

- (void)cropAction:(id)cropAction {
    if (self.delegate) {
        [self.delegate cropViewControllerDidCrop:self
                                    croppedImage:self.cropPhotoView.croppedImage];
    }
}


- (void)cancelAction:(id)cancelAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cropViewControllerDidCancel:)]) {
        [self.delegate cropViewControllerDidCancel:self];
    }
}
@end