//
//  GTViewController.m
//  gyroscopeTest
//
//  Created by  Developer on 07.03.14.
//  Copyright (c) 2014 katekovanton. All rights reserved.
//

#import "GTViewController.h"
#import "SFMGyroManager.h"
#import "GTParallaxView.h"

@interface GTViewController ()

@end

@implementation GTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[SFMGyroManager instance] setDelegate:self];
    
    CGSize size = self.view.frame.size;
    float t = size.width;
    size.width = size.height;
    size.height = t;
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"s_bg" ofType:@"jpg"]]];
        sprite.basePosition = CGPointMake(size.width / 2 - sprite.frame.size.width / 2, size.height / 2 - sprite.frame.size.height / 2);
        sprite.offset = 1.0;
        [_viewParallaz setBackground:sprite];
    }
    
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"cloud_05"]];
        sprite.basePosition = CGPointMake(size.width / 2 - sprite.frame.size.width / 2, size.height / 2 - sprite.frame.size.height / 2);
        sprite.offset = 1.0 - 0.4;
        [_viewParallaz addView:sprite];
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_03"]];
        sprite.basePosition = CGPointMake(size.width * 0.9 - sprite.frame.size.width/2, size.height/2 + 10);
        sprite.offset = 1.0 - 0.45;
        [_viewParallaz addView:sprite];
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_05"]];
        sprite.basePosition = CGPointMake(size.width * 0.2 - sprite.frame.size.width/2, 10);
        sprite.offset = 1.0 - 0.5;
        [_viewParallaz addView:sprite];
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_04"]];
        sprite.basePosition = CGPointMake(size.width * 0.8 - sprite.frame.size.width/2, 10);
        sprite.offset = 1.0 - 0.55;
        [_viewParallaz addView:sprite];
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_02"]];
        sprite.basePosition = CGPointMake(- 20, size.height/2 + 10);
        sprite.offset = 1.0 - 0.7;
        [_viewParallaz addView:sprite];
    }
    {
        
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_01"]];
        sprite.basePosition = CGPointMake(size.width/2 - sprite.frame.size.width/2, size.height/2 - sprite.frame.size.height/2);
        sprite.offset = 1.0 - 0.8;
        [_viewParallaz addView:sprite];
    }
}

#pragma mark - SFMGyroManagerDelegate

- (void)onDeviceMoved:(CGPoint)screenDelta
{
    _totalRotation.x -= screenDelta.x * 2.0;
    _totalRotation.y -= screenDelta.y * 2.0;
    
    _totalRotation.x *= 0.99;
    _totalRotation.y *= 0.99;
    
    [_viewParallaz setDisplacement:_totalRotation];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
