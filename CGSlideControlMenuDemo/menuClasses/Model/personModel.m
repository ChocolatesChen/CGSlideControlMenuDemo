//
//  personModel.m
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/18.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import "personModel.h"

@implementation personModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _imageName  = dictionary[@"imageName"];
        _userName   = dictionary[@"userName"];
        _userType   = dictionary[@"userType"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}


@end
