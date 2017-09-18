//
//  menuModel.m
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/18.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import "menuModel.h"

@implementation menuModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _titleName = dictionary[@"RightTitle"];
        _imageName = dictionary[@"leftImage"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}

@end
