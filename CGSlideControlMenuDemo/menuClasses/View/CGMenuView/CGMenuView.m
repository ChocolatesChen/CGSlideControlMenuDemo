//
//  CGMenuView.m
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/15.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import "CGMenuView.h"
#pragma mark ----------------------- 框架 -----------------------
#import "UITableView+FDTemplateLayoutCell.h"
#pragma mark ----------------------- Model类型 -----------------------
#import "menuModel.h"
#import "personModel.h"
#pragma mark ----------------------- View类型 -----------------------
#import "CGMenuCell.h"

@interface CGMenuView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *feedEntitySections; // 菜单数据
@property (nonatomic, strong) NSMutableArray *userInfoArray; // 个人数据
@property (nonatomic, strong) personModel *userInfo;

@end
static NSString *identifier = @"menuCell";
@implementation CGMenuView

+(instancetype)loadMenuViewFromXib{
    
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
-(void)awakeFromNib{
    [super awakeFromNib];

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_headerImage.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:_headerImage.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init]; //设置大小
    maskLayer.frame = _headerImage.bounds; //设置图形样子
    maskLayer.path = maskPath.CGPath;
    _headerImage.layer.mask = maskLayer;
    
    _typeLabel.layer.borderColor = [UIColor redColor].CGColor;
    _typeLabel.layer.borderWidth = 0.8f;
    _typeLabel.layer.masksToBounds = YES;
    _typeLabel.layer.cornerRadius = 10.f;
    
    //个人详情、退出
    
   //列表
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    _menuTableView.rowHeight = 58.f;
    // 在表格视图中注册表格单元并设置可复用标识
    [self.menuTableView registerNib:[UINib nibWithNibName:@"CGMenuCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier]; // 从xib文件中加载
    self.menuTableView.fd_debugLogEnabled = YES;
    
}
-(void)setUserInfoFromJSON:(NSArray *)userInfoFromJSON{
    _userInfoFromJSON = userInfoFromJSON;
//    self.userInfoArray = @[].mutableCopy;
//    NSLog(@"%@",self.userInfoArray);
//    [self.userInfoArray addObject:self.userInfoFromJSON.mutableCopy];
//    NSLog(@"%@",self.userInfoArray);
    self.userInfo = userInfoFromJSON[0];
}
-(void)setUserInfo:(personModel *)userInfo{
    _userInfo = userInfo;
    if (userInfo.imageName.length > 0) {
        self.headerImage.image = [UIImage imageNamed:userInfo.imageName];
    }
    self.titleLabel.text = userInfo.userName;
    self.typeLabel.text = userInfo.userType;
}
-(void)setPrototypeEntitiesFromJSON:(NSArray *)prototypeEntitiesFromJSON{
    _prototypeEntitiesFromJSON = prototypeEntitiesFromJSON;
    self.feedEntitySections = @[].mutableCopy;
    NSLog(@"%@",self.feedEntitySections);
    [self.feedEntitySections addObject:self.prototypeEntitiesFromJSON.mutableCopy];
    NSLog(@"%@",self.feedEntitySections);
    [self.menuTableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%ld",self.feedEntitySections.count);
    return self.feedEntitySections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feedEntitySections[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    CGMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    /* 去掉cell点击阴影**/
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(CGMenuCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = YES; // Enable to use "-sizeThatFits:"
    //    if (indexPath.row % 2 == 0) {
    //        //cell的右边有一个小箭头，距离右边有十几像素；
    //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    } else {
    //        //cell右边的形状是对号；
    //        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    //    }
    /*赋值*/
    cell.entity = self.feedEntitySections[indexPath.section][indexPath.row];
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return [tableView fd_heightForCellWithIdentifier:identifier cacheByIndexPath:indexPath configuration:^(CGMenuCell *cell) {
//        [self configureCell:cell atIndexPath:indexPath];
//    }];
//}



@end
