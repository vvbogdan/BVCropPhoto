//
// BVCropViewController.h
//
//  Created by Vitalii Bogdan on 05/06/2014 .
//  Copyright (c) 2014. All rights reserved.

@interface BVCropViewController : UIViewController

@property (nonatomic, copy) void (^cropActionBlock)(UIImage * image);

- (id)initWithImage:(UIImage *)image;

@end