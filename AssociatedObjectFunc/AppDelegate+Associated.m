//
//  AppDelegate+Associated.m
//  AssociatedObjectFunc
//
//  Created by gkoudai_xl on 15/7/26.
//  Copyright (c) 2015年 longxdragon. All rights reserved.
//

#import "AppDelegate+Associated.h"
#import <objc/runtime.h>

@interface AppDelegate (_Associated)

// 2. Adding private variables to facilitate implementation details
@property (nonatomic, strong) NSString *lx_categroyPrivateParam;

@end

@implementation AppDelegate (_Associated)

- (void)setLx_categroyPrivateParam:(NSString *)lx_categroyPrivateParam {
    objc_setAssociatedObject(self, @selector(lx_categroyPrivateParam), lx_categroyPrivateParam, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)lx_categroyPrivateParam {
    return objc_getAssociatedObject(self, @selector(lx_categroyPrivateParam));
}

@end



@implementation AppDelegate (Associated)

- (void)setLx_categoryStringParam:(NSString *)lx_categoryStringParam {
    objc_setAssociatedObject(self, @selector(lx_categoryStringParam), lx_categoryStringParam, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)lx_categoryStringParam {
    return objc_getAssociatedObject(self, @selector(lx_categoryStringParam));
}

- (void)setPrivateParamValueAndPrint:(NSString *)privateParam {
    self.lx_categroyPrivateParam = privateParam;
    NSLog(@"Categroy Private Params is : %@", self.lx_categroyPrivateParam);
}

// 3. Creating an associated observer for KVO
// [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
- (void)addKeyValueObserver {
    NSString *keyPath = NSStringFromSelector(@selector(lx_categroyPrivateParam));
    [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(lx_categroyPrivateParam))]) {
        NSLog(@"Changed new : %@", change);
    }
}

@end
