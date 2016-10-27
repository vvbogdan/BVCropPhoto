//
//  BVAppDelegate.m
//  CropPhoto
//
//  Created by Vitalii Bogdan on 6/18/14.
//  Copyright (c) 2014 BogdanVV. All rights reserved.
//

#import "BVAppDelegate.h"
#import "BVResultViewController.h"

@implementation BVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[BVResultViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end