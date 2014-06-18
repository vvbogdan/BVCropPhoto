//
// BVResultViewController.m
//
//  Created by Vitalii Bogdan on 18/06/2014 .
//  Copyright (c) 2014. All rights reserved.

#import "BVResultViewController.h"

@interface BVResultViewController ()

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

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneAction:)];


}


- (void)doneAction:(id)doneAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.imageView.frame = self.view.bounds;
}


@end