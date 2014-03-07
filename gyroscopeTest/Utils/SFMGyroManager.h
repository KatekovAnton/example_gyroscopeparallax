//
//  SFMGyroManager.h
//  Miranda
//
//  Created by Anton Katekov on 13.01.14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFMGyroManagerDelegate.h"

@class CMMotionManager;

@interface SFMGyroManager : NSObject {
    NSTimer         *_timer;
    CMMotionManager *_motionManager;
}

@property (nonatomic, weak) id<SFMGyroManagerDelegate> delegate;

+ (SFMGyroManager*)instance;

@end
