//
//  BVViewController.m
//  CropPhoto
//
//  Created by Vitalii Bogdan on 6/18/14.
//  Copyright (c) 2014 BogdanVV. All rights reserved.
//

#import "BVViewController.h"
#import "BVCropPhotoView.h"
#import "BVResultViewController.h"

@interface BVViewController ()

@property (nonatomic, strong) BVCropPhotoView * cropPhotoView;

@end

@implementation BVViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;

    self.cropPhotoView = [[BVCropPhotoView alloc] init];
    self.cropPhotoView.overlayImage = [UIImage imageNamed:@"crop-overlay-568h"];
    self.cropPhotoView.sourceImage = [UIImage imageNamed:@"example1.jpg"];
    self.cropPhotoView.cropSize = CGSizeMake(260, 286);
    self.cropPhotoView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.cropPhotoView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Crop" style:UIBarButtonItemStyleBordered target:self action:@selector(cropAction:)];
}


- (void)cropAction:(id)cropAction {
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:[[BVResultViewController alloc] initWithImage:self.cropPhotoView.croppedImage]];
    [self presentViewController:navigationController animated:YES completion:nil];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.cropPhotoView.frame = self.view.bounds;
}

@end