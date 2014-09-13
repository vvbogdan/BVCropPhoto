//
//  DVGCropView.m
//  Router
//
//  Created by Sergey Shpygar on 11.07.14.
//  Copyright (c) 2014 DENIVIP Group. All rights reserved.
//

#import "DVGCropView.h"

@interface DVGCropView ()

@property (nonatomic, weak) CAShapeLayer *overlayLayer;

@end

@implementation DVGCropView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CAShapeLayer *overlayLayer = [CAShapeLayer layer];
        overlayLayer.lineWidth = 0.f;
        overlayLayer.fillColor =
        overlayLayer.strokeColor = [UIColor colorWithWhite:0.f alpha:0.7f].CGColor;
        [self.layer addSublayer:overlayLayer];
        _overlayLayer = overlayLayer;
    }
    return self;
}

-(void)layoutSublayersOfLayer:(CALayer *)layer{
    [super layoutSublayersOfLayer:layer];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    CGSize size = CGSizeMake(self.bounds.size.width + 2, self.bounds.size.height + 2) ;
    CGRect rect = CGRectMake((size.width - self.cropSize.width)/2, (size.height - self.cropSize.height)/2, self.cropSize.width, self.cropSize.height);
    
    [path moveToPoint:CGPointMake(-1, -1)];
    [path addLineToPoint:CGPointMake(size.width, -1)];
    [path addLineToPoint:CGPointMake(size.width, size.height)];
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y)];
    [path addLineToPoint:CGPointMake(rect.origin.x, rect.origin.y)];
    [path addLineToPoint:CGPointMake(-1, -1)];
    
    [path moveToPoint:CGPointMake(-1, 0)];
    [path addLineToPoint:CGPointMake(-1, size.height)];
    [path addLineToPoint:CGPointMake(size.width, size.height)];
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.origin.x, rect.origin.y + rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.origin.x, rect.origin.y)];
    [path addLineToPoint:CGPointMake(-1, 0)];
    
    self.overlayLayer.path = path.CGPath;

}


@end
