//
//  DVCropViewController.m
//  Router
//
//  Created by Sergey Shpygar on 11.07.14.
//  Copyright (c) 2014 DENIVIP Group. All rights reserved.
//

#import "DVCropViewController.h"
#import "DVGCropView.h"

@interface DVCropViewController ()

@property (nonatomic, strong) BVCropPhotoView * cropPhotoView;

@end

@implementation DVCropViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cropPhotoView = [[DVGCropView alloc] init];
    self.cropPhotoView.sourceImage = self.sourceImage;
    self.cropPhotoView.cropSize = self.cropSize;
    self.cropPhotoView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.cropPhotoView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cropAction:)];
}


- (void)cropAction:(id)cropAction {
    [self.delegate cropViewControllerDidCrop:self croppedImage:self.cropPhotoView.croppedImage];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.cropPhotoView.frame = self.view.bounds;
}

@end