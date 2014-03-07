//
//  GTParallaxView.m
//  gyroscopeTest
//
//  Created by  Developer on 07.03.14.
//  Copyright (c) 2014 katekovanton. All rights reserved.
//

#import "GTParallaxView.h"

@implementation GTParallaxViewElement

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (id)initWithImage:(UIImage*)image
{
    CGRect r = CGRectMake(0, 0, image.size.width, image.size.height);
    if (self = [super initWithFrame:r]) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:r];
        [self addSubview:imgV];
        [imgV setImage:image];
        [imgV setContentMode:UIViewContentModeScaleAspectFill];
    }
    return self;
}

- (void)initialize
{
    self.translatesAutoresizingMaskIntoConstraints = YES;
}

@end

@implementation GTParallaxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.translatesAutoresizingMaskIntoConstraints = YES;
    _views = [NSMutableArray array];
}

- (void)addView:(GTParallaxViewElement*)view
{
    [_views addObject:view];
    CGRect r = view.frame;
    r.origin = view.basePosition;
    view.frame = r;
    [self addSubview:view];
}

- (void)setBackground:(GTParallaxViewElement*)view
{
    _background = view;
    
    [self addView:view];
}

- (void)setDisplacement:(CGPoint)displacement
{
    for (int i = 0; i < _views.count; i++) {
        GTParallaxViewElement* node = [_views objectAtIndex:i];
        CGPoint pos = CGPointMake(node.basePosition.x + node.offset * displacement.x, node.basePosition.y + node.offset * displacement.y);
        CGRect r = node.frame;
        r.origin = pos;
        node.frame = r;
    }
    
//    if (_background)
//    {
//        CGRect r = _background.frame;
//        CGPoint lb = r.origin;
//        lb.x = lb.x - r.size.width / 2;
//        lb.y = lb.y - r.size.height / 2;
//        CGPoint rt;
//        rt.x = lb.x + r.size.width / 2;
//        rt.y = lb.y + r.size.height / 2;
//        
//        CGPoint delta = CGPointMake(0, 0);
//        if (lb.x > 0)
//            delta.x = -lb.x;
//        if (lb.y > 0)
//            delta.y = -lb.y;
//        
//        if (rt.x < self.frame.size.width)
//            delta.x = self.frame.size.width-rt.x;
//        if (rt.y < self.frame.size.height)
//            delta.y = self.frame.size.height-rt.y;
//        
//        CGRect r1 = _background.frame;
//        r1.origin.x += delta.x;
//        r1.origin.y += delta.y;
//        _background.frame = r1;
//    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
