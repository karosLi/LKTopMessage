//
//  LKTopMessage.m
//  LKTopMessage
//
//  Created by karos li on 2017/7/5.
//  Copyright © 2017年 karos. All rights reserved.
//

#import "LKTopMessageConfig.h"
#import "LKTopMessageConstant.h"

@interface LKTopMessageConfig ()

@property (nonatomic, strong, readwrite) UIColor *textColor;
@property (nonatomic, strong, readwrite) UIColor *backgroundColor;
@property (nonatomic, assign, readwrite) CGFloat height;

@end

@implementation LKTopMessageConfig

+ (LKTopMessageConfig *)topMessage:(NSDictionary *)options {
    LKTopMessageConfig *topMessage = [[LKTopMessageConfig alloc] init];
    topMessage.textColor = options[kLKTopMessageTextColorKey] ? options[kLKTopMessageTextColorKey] : [UIColor whiteColor];
    topMessage.backgroundColor = options[kLKTopMessageBackgroundColorKey] ? options[kLKTopMessageBackgroundColorKey] : [UIColor colorWithRed:37.0 / 255.0 green:220.0 / 255.0 blue:142.0 / 255.0 alpha:1];
    topMessage.height = options[kLKTopMessageHeightKey] ? [options[kLKTopMessageHeightKey] floatValue] : 60;
    
    return topMessage;
}

@end
