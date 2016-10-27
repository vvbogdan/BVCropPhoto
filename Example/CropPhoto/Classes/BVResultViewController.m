//
// BVResultViewController.m
//
//  Created by Vitalii Bogdan on 18/06/2014 .
//  Copyright (c) 2014. All rights reserved.

#import "BVResultViewController.h"
#import "BVCropViewController.h"
#import "BVCropPhotoView.h"
#import "BVCropPhotoOverlayView.h"

@interface BVResultViewController () <BVCropViewControllerDelegate>

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIImage * image;

@end

@implementation BVResultViewController

- (id)initWithImage:(UIImage *)image {
    self = [super init];
    if ( self ) {
        self.image = image;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];

    self.navigationController.navigationBar.translucent = NO;

    self.imageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.image = self.image;
        imageView;
    });
    [self.view addSubview:self.imageView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(selectAction:)];


}

- (void)selectAction:(id)doneAction {
    BVCropViewController *controller = [[BVCropViewController alloc] init];
    controller.cropSize = CGSizeMake(260, 286);
    controller.cropPhotoView.maximumZoomScale = 100;
    [controller.cropPhotoView updateOverlayView:[[BVCropPhotoOverlayView alloc] initWithCropSize:controller.cropSize]];
    controller.delegate = self;
    controller.sourceImage = self.image;
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:nil];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.imageView.frame = self.view.bounds;
}

#pragma DVCropViewController Delegate

-(void)cropViewControllerDidCrop:(BVCropViewController *)sender croppedImage:(UIImage *)croppedImage{
    self.imageView.image = croppedImage;

    [sender.navigationController dismissViewControllerAnimated:YES
                                                    completion:nil];
}

-(void)cropViewControllerDidCancel:(BVCropViewController *)sender{
    [sender dismissViewControllerAnimated:YES
                               completion:nil];
}

@end
