//
//  LKTopMessage.h
//  LKTopMessage
//
//  Created by karos li on 2017/7/5.
//  Copyright © 2017年 karos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKTopMessageConfig : NSObject

@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong, readonly) UIColor *textColor;
@property (nonatomic, strong, readonly) UIColor *backgroundColor;
@property (nonatomic, assign, readonly) CGFloat height;

+ (LKTopMessageConfig *)topMessage:(NSDictionary *)options;

@end
