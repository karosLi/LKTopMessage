//
//  LKTopMessage.m
//  LKTopMessage
//
//  Created by karos li on 2017/7/5.
//  Copyright © 2017年 karos. All rights reserved.
//

#import "LKTopMessageView.h"

@interface LKTopMessageView ()

@end

@implementation LKTopMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    [self setupView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 是否是iPhoneX
    if ([UIScreen mainScreen].bounds.size.width == 375.0f && [UIScreen mainScreen].bounds.size.height == 812.0f) {
        self.messageLabel.frame = CGRectMake(20, [[UIApplication sharedApplication] statusBarFrame].size.height, CGRectGetWidth(self.bounds) - 20 * 2, CGRectGetHeight(self.bounds) - [[UIApplication sharedApplication] statusBarFrame].size.height);
    } else {
        self.messageLabel.frame = CGRectMake(20, 0, CGRectGetWidth(self.bounds) - 20 * 2, CGRectGetHeight(self.bounds));
    }
}

- (void)setupView {
    [self addSubview:self.messageLabel];
}

#pragma mark - getter and setter
- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}

@end
