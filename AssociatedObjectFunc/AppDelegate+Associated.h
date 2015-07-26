//
//  AppDelegate+Associated.h
//  AssociatedObjectFunc
//
//  Created by gkoudai_xl on 15/7/26.
//  Copyright (c) 2015年 longxdragon. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Associated)

// 1. Adding public properties to configure category behavior
@property (nonatomic, strong) NSString *lx_categoryStringParam;

- (void)setPrivateParamValueAndPrint:(NSString *)privateParam;

- (void)addKeyValueObserver;

@end
