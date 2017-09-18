//
//  CGMenuCell.m
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/18.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import "CGMenuCell.h"

@implementation CGMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setEntity:(menuModel *)entity{
    _entity = entity;
    if (entity.imageName.length > 0) {
        self.leftImage.image = [UIImage imageNamed:entity.imageName];
    }
    self.rightLabel.text = entity.titleName;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
