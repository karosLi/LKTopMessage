//
//  LKTopMessageWindow.m
//  LKTopMessage
//
//  Created by karos li on 2017/7/5.
//  Copyright © 2017年 karos. All rights reserved.
//

#import "LKTopMessageWindow.h"

@implementation LKTopMessageWindow

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event {
    for (UIView *subview in self.subviews) {
        if ([subview hitTest:[self convertPoint:point toView:subview] withEvent:event] != nil) {
            return YES;
        }
    }
    return NO;
}

@end
