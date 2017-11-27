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

@end

@implementation LKTopMessageConfig

+ (LKTopMessageConfig *)topMessage:(NSDictionary *)options {
    LKTopMessageConfig *topMessage = [[LKTopMessageConfig alloc] init];
    topMessage.textColor = options[kLKTopMessageTextColorKey] ? options[kLKTopMessageTextColorKey] : [UIColor whiteColor];
    topMessage.backgroundColor = options[kLKTopMessageBackgroundColorKey] ? options[kLKTopMessageBackgroundColorKey] : [UIColor colorWithRed:37.0 / 255.0 green:220.0 / 255.0 blue:142.0 / 255.0 alpha:1];
    
    return topMessage;
}

- (CGFloat)height {
    CGFloat messageHeight = ceil([self.message boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14 weight:UIFontWeightBold]} context:nil].size.height);
    
    CGFloat defaultHeight = messageHeight + 15;
    // 是否是iPhoneX
    if ([UIScreen mainScreen].bounds.size.width == 375.0f && [UIScreen mainScreen].bounds.size.height == 812.0f) {
        defaultHeight += [[UIApplication sharedApplication] statusBarFrame].size.height;
    }
    
    defaultHeight = MAX(defaultHeight, 60);
    
    return defaultHeight;
}

@end
