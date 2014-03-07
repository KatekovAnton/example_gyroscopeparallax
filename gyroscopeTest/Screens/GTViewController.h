//
//  GTViewController.h
//  gyroscopeTest
//
//  Created by  Developer on 07.03.14.
//  Copyright (c) 2014 katekovanton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFMGyroManagerDelegate.h"

@class GTParallaxView;

@interface GTViewController : UIViewController <SFMGyroManagerDelegate> {
    
    CGPoint _totalRotation;
    IBOutlet GTParallaxView *_viewParallaz;
}

@end
