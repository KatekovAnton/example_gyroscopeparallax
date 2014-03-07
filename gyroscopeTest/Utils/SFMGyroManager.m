//
//  SFMGyroManager.m
//  Miranda
//
//  Created by Anton Katekov on 13.01.14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import "SFMGyroManager.h"
#import <CoreMotion/CoreMotion.h>

@implementation SFMGyroManager

static SFMGyroManager* _instance;

+ (SFMGyroManager*)instance
{
    if (!_instance)
        _instance = [[SFMGyroManager alloc]init];
    
    return _instance;
}

- (id)init
{
    if (self = [super init]) {
        
        _motionManager = [[CMMotionManager alloc] init];
        [_motionManager startGyroUpdates];
        
       _timer = [NSTimer scheduledTimerWithTimeInterval:2.0/60.0 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)onTimer:(id)param
{
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateBackground || [[UIApplication sharedApplication] applicationState] == UIApplicationStateInactive) 
        return;
    
    [self handleGyroData:_motionManager.gyroData];
}

- (void)handleGyroData:(CMGyroData *)gyroData
{
    CMRotationRate data = gyroData.rotationRate;
    UIInterfaceOrientation statusBarOrientation = [UIApplication sharedApplication].statusBarOrientation;
    if (statusBarOrientation == UIInterfaceOrientationLandscapeRight)
    {
        data.x = -data.x;
        data.y = -data.y;
    }
    [self.delegate onDeviceMoved:CGPointMake(data.x, data.y)];
}

@end
