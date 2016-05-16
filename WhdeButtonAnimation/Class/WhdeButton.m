//
//  WhdeButton.m
//  WhdeButtonAnimation
//
//  Created by whde on 16/5/13.
//  Copyright © 2016年 whde. All rights reserved.
//

#import "WhdeButton.h"

@interface WhdeButton ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end
@implementation WhdeButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        NSArray *recognizers = touch.gestureRecognizers;
        if (recognizers.count > 0) {
            UIGestureRecognizer *recognizer = ((UIGestureRecognizer *)[recognizers objectAtIndex:0]);
            CGPoint point = [recognizer locationInView:self];
            if (_shapeLayer.superlayer) {
                [_shapeLayer removeFromSuperlayer];
            }
            _shapeLayer = [[CAShapeLayer alloc] init];
            CGFloat width = CGRectGetWidth(self.frame)>CGRectGetHeight(self.frame)?CGRectGetWidth(self.frame):CGRectGetHeight(self.frame);
            _shapeLayer.frame = CGRectMake(0, 0, width*2, width*2);
            _shapeLayer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5].CGColor;
            self.layer.masksToBounds = YES;
            _shapeLayer.position = point;
            _shapeLayer.cornerRadius = width;
            [self.layer addSublayer:_shapeLayer];
            
            /*CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
            gradientLayer.frame = _shapeLayer.bounds;
            gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:1 alpha:0.0f].CGColor, (__bridge id)[UIColor colorWithWhite:1 alpha:0.5f].CGColor];
            gradientLayer.startPoint = CGPointMake(0.5, 0.5);
            gradientLayer.endPoint = CGPointMake(1, 1);
            [_shapeLayer addSublayer:gradientLayer];*/
            [self animations];
        }
    }
}
- (void)animations {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.05];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 0.3f;
    scaleAnimation.removedOnCompletion = YES;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = 0.3;
    opacityAnimation.beginTime = 0.3f;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.removedOnCompletion = YES;
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 0.6f;
    groupAnimation.removedOnCompletion = YES;
    groupAnimation.delegate = self;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.animations = @[scaleAnimation, opacityAnimation];
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_shapeLayer addAnimation:groupAnimation forKey:@"group"];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [_shapeLayer removeFromSuperlayer];
}
@end
