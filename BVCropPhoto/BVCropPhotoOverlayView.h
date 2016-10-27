//
//  BVCropPhotoOverlayView.h
//
//
//  Created by Bogdan V. on 11.07.14.
//  Copyright (c) 2014 Nowytech. All rights reserved.
//

#import "BVCropPhotoView.h"

@interface BVCropPhotoOverlayView : UIView

@property(nonatomic, assign) CGSize cropSize;

- (id)initWithCropSize:(CGSize)size;

@end
