//
//  LKTopMessageManager.h
//  LKTopMessage
//
//  Created by karos li on 2017/7/5.
//  Copyright © 2017年 karos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKTopMessageManager : NSObject

+ (void)show:(NSString *)message;
+ (void)showError:(NSString *)message;
+ (void)show:(NSString *)message options:(NSDictionary *)options;
+ (void)dismissAll;

@end
