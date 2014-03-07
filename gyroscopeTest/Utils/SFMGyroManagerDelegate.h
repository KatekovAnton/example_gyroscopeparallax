//
//  SFMGyroManagerDelegate.h
//  Miranda
//
//  Created by Anton Katekov on 13.01.14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SFMGyroManagerDelegate <NSObject>

- (void)onDeviceMoved:(CGPoint)screenDelta;

@end
