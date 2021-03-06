//
//  CGMenuView.h
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/15.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CGMenuViewDelegate <NSObject>

- (void)infoViewClick:(UIButton *)sender;
- (void)outInfoViewClick:(UITapGestureRecognizer *)sender;
- (void)menuView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface CGMenuView : UIView

@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIImageView *headerImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UIButton *InfoButton;

@property (strong, nonatomic) IBOutlet UITableView *menuTableView;

@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIImageView *footerImage;
@property (strong, nonatomic) IBOutlet UILabel *footerLabel;
@property (strong, nonatomic) IBOutlet UIView *outInfoView;

@property (nonatomic, copy) NSArray *prototypeEntitiesFromJSON;//
@property (nonatomic, copy) NSArray *userInfoFromJSON;

@property (weak, nonatomic) id<CGMenuViewDelegate> delegate;

+(instancetype)loadMenuViewFromXib;



@end
