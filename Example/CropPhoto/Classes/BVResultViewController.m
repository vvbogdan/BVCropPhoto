//
// BVResultViewController.m
//
//  Created by Vitalii Bogdan on 18/06/2014 .
//  Copyright (c) 2014. All rights reserved.

#import "BVResultViewController.h"
#import "DVCropViewController.h"

@interface BVResultViewController () <DVCropViewControllerDelegate>

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
        imageView.image = [UIImage imageNamed:@"example1.jpg"];
        imageView;
    });
    [self.view addSubview:self.imageView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(selectAction:)];


}

- (void)selectAction:(id)doneAction {
    DVCropViewController *controller = [[DVCropViewController alloc] init];
    controller.delegate = self;
    controller.sourceImage = [UIImage imageNamed:@"example1.jpg"];
    controller.cropSize = CGSizeMake(260, 286);
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:nil];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.imageView.frame = self.view.bounds;
}

#pragma DVCropViewController Delegate

-(void)cropViewControllerDidCrop:(DVCropViewController *)sender croppedImage:(UIImage *)croppedImage{
    self.imageView.image = croppedImage;

    [sender.navigationController dismissViewControllerAnimated:NO completion:nil];
}

-(void)cropViewControllerDidCancel:(DVCropViewController *)sender{
    
}

@end