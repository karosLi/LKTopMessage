//
//  LKTopMessageManager.m
//  LKTopMessage
//
//  Created by karos li on 2017/7/5.
//  Copyright © 2017年 karos. All rights reserved.
//

#import "LKTopMessageManager.h"
#import "LKTopMessageViewController.h"
#import "LKTopMessageConstant.h"
#import "LKTopMessageConfig.h"
#import "LKTopMessageWindow.h"
#import "LKTopMessageView.h"

@interface LKTopMessageManager ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *messages;
@property (nonatomic, assign) BOOL showingMessage;
@property (nonatomic, strong) LKTopMessageView *topMessageView;

@end

@implementation LKTopMessageManager

#pragma mark - public methods

+ (void)show:(NSString *)message {
    [self show:message options:nil];
}

+ (void)showError:(NSString *)message {
    [self show:message options:@{kLKTopMessageBackgroundColorKey : [UIColor colorWithRed:255.0 / 255.0 green:74.0 / 255.0 blue:73.0 / 255.0 alpha:1]}];
}

+ (void)show:(NSString *)message options:(NSDictionary *)options {
    LKTopMessageConfig *topMessage = [LKTopMessageConfig topMessage:options];
    topMessage.message = message;
    
    [[self sharedInstance] addMessage:topMessage];
}

+ (void)dismissAll {
    [[self sharedInstance] dismissAllMessage];
}

#pragma mark - life cycle

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (void)addMessage:(LKTopMessageConfig *)topMessage {
    BOOL showingMessage = self.showingMessage;
    [self.messages addObject:topMessage];
    if (!showingMessage) {
        [self displayMessage:topMessage];
    }
}

- (void)displayMessage:(LKTopMessageConfig *)topMessage {
    self.window.hidden = NO;
    self.window.rootViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, topMessage.height);
    
    self.topMessageView.backgroundColor = topMessage.backgroundColor;
    self.topMessageView.messageLabel.text = topMessage.message;
    self.topMessageView.messageLabel.textColor = topMessage.textColor;
    
    [self.window.rootViewController.view addSubview:self.topMessageView];
    
    self.topMessageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, -topMessage.height);
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.topMessageView.frame = self.window.rootViewController.view.bounds;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissMessage];
        });
    }];
}

- (void)dismissMessage {
    if (self.messages.count == 0) return;
    
    LKTopMessageConfig *topMessage = self.messages.firstObject;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.topMessageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, -topMessage.height);
    } completion:^(BOOL finished) {
        [self.messages removeObject:topMessage];
        [self.topMessageView removeFromSuperview];
        if (self.messages.count > 0) {
            LKTopMessageConfig *nextTopMessage = self.messages.firstObject;
            [self displayMessage:nextTopMessage];
        } else {
            self.window.hidden = YES;
        }
    }];
}

- (void)dismissAllMessage {
    [self dismissMessage];
    [self.messages removeAllObjects];
}

#pragma mark - getter and setter
- (UIWindow *)window {
    if (!_window) {
        UIWindow *window = [[LKTopMessageWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        window.backgroundColor = [UIColor clearColor];
        window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        window.windowLevel = UIWindowLevelStatusBar + 1;
        window.rootViewController = [LKTopMessageViewController new];
        window.rootViewController.view.userInteractionEnabled = YES;
        window.rootViewController.view.clipsToBounds = YES;
        _window = window;
    }
    
    return _window;
}

- (NSMutableArray *)messages {
    if (!_messages) {
        _messages = [@[] mutableCopy];
    }
    
    return _messages;
}

- (LKTopMessageView *)topMessageView {
    if (!_topMessageView) {
        _topMessageView = [[LKTopMessageView alloc] init];
    }
    
    return _topMessageView;
}

- (BOOL)showingMessage {
    return self.messages.count > 0;
}

@end
