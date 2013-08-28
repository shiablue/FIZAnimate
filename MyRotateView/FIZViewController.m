//
//  FIZViewController.m
//  MyRotateView
//
//  Created by shiablue on 13-8-28.
//  Copyright (c) 2013年 Shiablue. All rights reserved.
//

#import "FIZViewController.h"

@interface FIZViewController ()

@end

@implementation FIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self startMovingMyTopicCover];
}

#define kHorizontalMovedPixels      100
#define kVerticalMovedPixels        50
- (void)startMovingMyTopicCover {
    __block UIImageView *imageView = self.topicCover;
    [UIView animateWithDuration:5.f delay:0 options:UIViewAnimationOptionRepeat animations:^{
        //开始
        CGPoint originCenter = imageView.center;
        imageView.center = CGPointMake(originCenter.x - kHorizontalMovedPixels, originCenter.y);
        
        //2
        originCenter = imageView.center;
        imageView.center = CGPointMake(originCenter.x, originCenter.y - kVerticalMovedPixels * 2);
        
        //3
        originCenter = imageView.center;
        imageView.center = CGPointMake(originCenter.x + kHorizontalMovedPixels * 2, originCenter.y);
        
        //4
        originCenter = imageView.center;
        imageView.center = CGPointMake(originCenter.x, originCenter.y + kVerticalMovedPixels * 2);
        
        //5
        originCenter = imageView.center;
        imageView.center = CGPointMake(originCenter.x - kHorizontalMovedPixels, originCenter.y);
    } completion:^(BOOL finished) {
        
    }];
}



@end
