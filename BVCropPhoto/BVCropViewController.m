//
// BVCropViewController.m
//
//  Created by Vitalii Bogdan on 05/06/2014 .
//  Copyright (c) 2014. All rights reserved.

#import <PixateFreestyle/PixateFreestyle.h>
#import "BVCropViewController.h"
#import "BVCropPhotoView.h"
#import "SFUIViewMacroses.h"

@interface BVCropViewController ()

@property (nonatomic, strong) UIImage * image;

@property (nonatomic, strong) BVCropPhotoView * cropView;

@end

@implementation BVCropViewController

- (id)init {
    self = [super init];
    if ( self ) {
        self.title = NSLocalizedString(@"Crop.Title", @"");
        [self setStylizedTitle:self.title];

    }
    return self;
}


- (id)initWithImage:(UIImage *)image {
    self = [self init];
    if ( self ) {
        self.image = image;

        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}


- (void)loadView {
    self.view = [UIView new];
    self.view.clipsToBounds = YES;


}


- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton * button = [UIButton new];
    button.styleClass = @"crop-button";
    [button setAttributedTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Crop.Button", nil)] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cropAction:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    self.view.styleClass = @"blackBackground";

    [self setStylizedBackButton];
}


- (void)cropAction:(id)cropAction {

    if ( self.cropActionBlock ) {
        self.cropActionBlock(self.cropView.croppedImage);
    }
}


@end