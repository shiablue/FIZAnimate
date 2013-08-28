//
//  FIZRotateView.m
//  MyRotateView
//
//  Created by shiablue on 13-8-28.
//  Copyright (c) 2013年 Shiablue. All rights reserved.
//

#import "FIZRotateView.h"

@implementation FIZRotateView

- (void)awakeFromNib {
//    [self drawACurvedLine];
    [self animateRectangleAlongPath];
}

//画出了运动轨迹
- (void)drawACurvedLine {
    UIGraphicsBeginImageContext(CGSizeMake(320, 120));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1.5);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextMoveToPoint(context, 20, 20);
    
    CGContextAddLineToPoint(context, 300, 20);
    CGContextAddLineToPoint(context, 300, 100);
    CGContextAddLineToPoint(context, 20, 100);
    CGContextAddLineToPoint(context, 20, 20);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(1, 1, 320, 120);
    imageView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:imageView];
}

//
- (void)animateRectangleAlongPath {
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationLinear;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 30;
    pathAnimation.repeatCount = HUGE_VALF;
    
    CGMutablePathRef linearPath = CGPathCreateMutable();
    CGPathMoveToPoint(linearPath, NULL, 20, 20);
    CGPathAddLineToPoint(linearPath, NULL, 300, 20);
    CGPathAddLineToPoint(linearPath, NULL, 300, 100);
    CGPathAddLineToPoint(linearPath, NULL, 20, 100);
    CGPathAddLineToPoint(linearPath, NULL, 20, 20);
    
    pathAnimation.path = linearPath;
    CGPathRelease(linearPath);
    
//    UIGraphicsBeginImageContext(CGSizeMake(20, 20));
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetLineWidth(context, 1.5);
//    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
//    
//    CGContextAddEllipseInRect(context, CGRectMake(1, 1, 18, 18));
//    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *image = [UIImage imageNamed:@"IMG_0175.jpg"];
    
    UIImageView *rectangleView = [[UIImageView alloc] initWithImage:image];
    rectangleView.frame = CGRectMake(0, 0, 640, 1136);
    rectangleView.center = self.center;

    [self addSubview:rectangleView];
    
    [rectangleView.layer addAnimation:pathAnimation forKey:@"MoveTheSquare"];
}

@end
