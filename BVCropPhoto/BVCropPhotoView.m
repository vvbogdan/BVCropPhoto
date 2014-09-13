//
// BVCropPhotoView.m
//
//  Created by Vitalii Bogdan on 11/06/2014 .
//  Copyright (c) 2014. All rights reserved.

#import "BVCropPhotoView.h"

@interface BVCropPhotoView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView * overlayView;

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation BVCropPhotoView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];

    if ( self ) {
        [self setBackgroundColor:[UIColor blackColor]];

        self.scrollView = ({
            UIScrollView * scrollView = [[UIScrollView alloc] init];
            scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [scrollView setDelegate:self];
            [scrollView setAlwaysBounceVertical:YES];
            [scrollView setAlwaysBounceHorizontal:YES];
            [scrollView setShowsVerticalScrollIndicator:NO];
            [scrollView setShowsHorizontalScrollIndicator:NO];
            [scrollView.layer setMasksToBounds:NO];
            scrollView;
        });
        [self addSubview:self.scrollView];

        self.imageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            [imageView setContentMode:UIViewContentModeScaleAspectFit];
            imageView;
        });
        [self.scrollView addSubview:self.imageView];

        self.overlayView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeCenter;
            imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            imageView;
        });
        [self addSubview:self.overlayView];

        self.cropSize = CGSizeMake(260, 290);

        self.maximumZoomScale = 5;
    }

    return self;
}


- (id)initWithSourceImage:(UIImage *)image {
    self = [super init];

    if ( self ) {
        _sourceImage = image;
    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    self.overlayView.frame = self.bounds;

    if ( !self.imageView.image ) {
        [self setupZoomScale];
    }
}


- (void)setupZoomScale {
    [self.imageView setImage:self.sourceImage];
    [self.imageView sizeToFit];

    CGFloat offsetX = ceilf( self.scrollView.frame.size.width / 2 - self.cropSize.width / 2);
    CGFloat offsetY = ceilf( self.scrollView.frame.size.height / 2 - self.cropSize.height / 2);
    self.scrollView.contentInset = UIEdgeInsetsMake(offsetY, offsetX, offsetY, offsetX);

    [self.scrollView setContentSize:self.imageView.frame.size];

    CGFloat zoomScale = 1.0;

    if ( self.imageView.frame.size.width >= self.imageView.frame.size.height ) {
        zoomScale = self.cropSize.height / self.imageView.frame.size.height;
    } else {
        zoomScale = self.cropSize.width / self.imageView.frame.size.width;
    }

    [self.scrollView setMinimumZoomScale:zoomScale];
    [self.scrollView setMaximumZoomScale:self.maximumZoomScale * zoomScale];
    [self.scrollView setZoomScale:zoomScale];

    [self.scrollView setContentOffset:CGPointMake((self.imageView.frame.size.width - self.scrollView.frame.size.width) / 2,
            (self.imageView.frame.size.height - self.scrollView.frame.size.height) / 2)];
}


#pragma mark - Override -
- (UIImage *)fixrotation:(UIImage *)image{
    
    
    if (image.imageOrientation == UIImageOrientationUp) return image;
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
    
}


- (UIImage *)croppedImage {
    CGFloat scale = self.sourceImage.size.width / self.scrollView.contentSize.width;

    UIImage *finalImage = nil;
    CGRect targetFrame = CGRectMake((self.scrollView.contentInset.left + self.scrollView.contentOffset.x) * scale,
            (self.scrollView.contentInset.top + self.scrollView.contentOffset.y) * scale,
            self.cropSize.width * scale,
            self.cropSize.height * scale);

    CGImageRef contextImage = CGImageCreateWithImageInRect([[self fixrotation:self.sourceImage] CGImage], targetFrame);

    if (contextImage != NULL) {
        finalImage = [UIImage imageWithCGImage:contextImage
                                         scale:self.sourceImage.scale
                                   orientation:UIImageOrientationUp];

        CGImageRelease(contextImage);
    }

    return finalImage;
}


- (void)setOverlayImage:(UIImage *)overlayImage {
    _overlayImage = overlayImage;
    self.overlayView.image = self.overlayImage;
    [self setNeedsLayout];
}


- (void)setSourceImage:(UIImage *)sourceImage {
    _sourceImage = sourceImage;
    [self setNeedsLayout];
}


- (void)setMaximumZoomScale:(CGFloat)maximumZoomScale {
    _maximumZoomScale = maximumZoomScale > 0 ? maximumZoomScale : 5;
    self.imageView.image = nil;
    [self setNeedsLayout];
}


#pragma mark - Scroll delegate -

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self.scrollView;
}

@end