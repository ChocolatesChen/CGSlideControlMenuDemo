//
//  menuModel.h
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/18.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface menuModel : NSObject

/*初始化方法*/
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *imageName;
@property (nonatomic, copy, readonly) NSString *titleName;

@end
