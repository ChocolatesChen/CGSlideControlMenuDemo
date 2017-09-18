//
//  CGMenuCell.h
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/18.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "menuModel.h"

@interface CGMenuCell : UITableViewCell
@property (nonatomic, strong) menuModel *entity;
@property (strong, nonatomic) IBOutlet UIImageView *leftImage;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;

@end
