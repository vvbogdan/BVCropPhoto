//
//  BVCropPhotoOverlayView.m
//
//
//  Created by Bogdan V. on 11.07.14.
//  Copyright (c) 2014 Nowytech. All rights reserved.
//

#import "BVCropPhotoOverlayView.h"

@interface BVCropPhotoOverlayView ()

@property(nonatomic, weak) CAShapeLayer *overlayLayer;

@end

@implementation BVCropPhotoOverlayView

- (id)initWithCropSize:(CGSize)size {
    self = [self initWithFrame:CGRectZero];
    if (self) {
        self.cropSize = size;
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CAShapeLayer *overlayLayer = [CAShapeLayer layer];
        overlayLayer.lineWidth = 0.f;
        overlayLayer.fillRule = kCAFillRuleEvenOdd;
        overlayLayer.fillColor = [UIColor colorWithWhite:0.f alpha:0.7f].CGColor;
        overlayLayer.strokeColor = [UIColor colorWithWhite:0.f alpha:0.7f].CGColor;
        [self.layer addSublayer:overlayLayer];
        _overlayLayer = overlayLayer;
    }
    return self;
}


- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];

    CGRect outerRect = CGRectMake(0, 0, self.bounds.size.width + 2, self.bounds.size.height + 2);
    CGRect innerRect = CGRectMake(
            (outerRect.size.width - self.cropSize.width) / 2,
            (outerRect.size.height - self.cropSize.height) / 2,
            self.cropSize.width,
            self.cropSize.height);

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:outerRect];
    [path appendPath:[UIBezierPath bezierPathWithRect:innerRect]];

    self.overlayLayer.path = path.CGPath;

}

@end
