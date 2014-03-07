//
//  GTParallaxView.h
//  gyroscopeTest
//
//  Created by  Developer on 07.03.14.
//  Copyright (c) 2014 katekovanton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTParallaxViewElement : UIView

@property (nonatomic, assign)CGPoint basePosition;
@property (nonatomic, assign)float offset;

- (id)initWithImage:(UIImage*)image;

@end

@interface GTParallaxView : UIView {
    NSMutableArray *_views;
    GTParallaxViewElement *_background;
}

- (void)addView:(GTParallaxViewElement*)view;
- (void)setBackground:(GTParallaxViewElement*)view;

- (void)setDisplacement:(CGPoint)displacement;

@end
