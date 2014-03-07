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
        
//        CCSprite* sprite = CCSprite::create("s_bg.jpg");
//        float scaleX = size.width/sprite->getContentSize().width;
//        float scaleY = size.height/sprite->getContentSize().height;
//        scale = ____max(scaleX, scaleY);
//        sprite->setScale(scale * 1.2);
//        sprite->setPosition(ccp(size.width/2, size.height/2));
//        
//        result->addBackgroundChild(sprite, 1.0-0.0);
    }
    
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"cloud_05"]];
        sprite.basePosition = CGPointMake(size.width / 2 - sprite.frame.size.width / 2, size.height / 2 - sprite.frame.size.height / 2);
        sprite.offset = 1.0 - 0.4;
        [_viewParallaz addView:sprite];
        
//        CCSprite* sprite = CCSprite::create("cloud_05.png");
//        sprite->setScale(scale * 1.1);
//        sprite->setPosition(ccp(size.width * 0.5, size.height * 0.5));
//        result->addChild(sprite, 1.0-0.4);
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_03"]];
        sprite.basePosition = CGPointMake(size.width * 0.9 - sprite.frame.size.width/2, size.height/2 + 10);
        sprite.offset = 1.0 - 0.45;
        [_viewParallaz addView:sprite];
        
//        CCSprite* sprite = CCSprite::create("s_03.png");
//        sprite->setScale(scale);
//        sprite->setPosition(ccp(size.width * 0.9, size.height * 0.2));
//        result->addChild(sprite, 1.0-0.45);
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_05"]];
        sprite.basePosition = CGPointMake(size.width * 0.2 - sprite.frame.size.width/2, 10);
        sprite.offset = 1.0 - 0.5;
        [_viewParallaz addView:sprite];
//        CCSprite* sprite = CCSprite::create("s_05.png");
//        sprite->setScale(scale);
//        sprite->setPosition(ccp(size.width * 0.2, size.height/2 + 100));
//        result->addChild(sprite, 1.0-0.5);
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_04"]];
        sprite.basePosition = CGPointMake(size.width * 0.8 - sprite.frame.size.width/2, 10);
        sprite.offset = 1.0 - 0.55;
        [_viewParallaz addView:sprite];
//        CCSprite* sprite = CCSprite::create("s_04.png");
//        sprite->setScale(scale);
//        sprite->setPosition(ccp(size.width * 0.8, size.height/2 + 100));
//        result->addChild(sprite, 1.0-0.55);
    }
    {
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_02"]];
        sprite.basePosition = CGPointMake(- 20, size.height/2 + 10);
        sprite.offset = 1.0 - 0.7;
        [_viewParallaz addView:sprite];
        
//        CCSprite* sprite = CCSprite::create("s_02.png");
//        sprite->setScale(scale);
//        sprite->setPosition(ccp(sprite->getContentSize().width/2 * scale - 20, size.height/2 - 100));
//        result->addChild(sprite, 1.0-0.7);
    }
    {
        
        GTParallaxViewElement *sprite = [[GTParallaxViewElement alloc] initWithImage:[UIImage imageNamed:@"s_01"]];
        sprite.basePosition = CGPointMake(size.width/2 - sprite.frame.size.width/2, size.height/2 - sprite.frame.size.height/2);
        sprite.offset = 1.0 - 0.8;
        [_viewParallaz addView:sprite];
//        CCSprite* sprite = CCSprite::create("s_01.png");
//        sprite->setScale(scale);
//        sprite->setPosition(ccp(size.width * 0.4, size.height/2));
//        result->addChild(sprite, 1.0-0.8);
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
