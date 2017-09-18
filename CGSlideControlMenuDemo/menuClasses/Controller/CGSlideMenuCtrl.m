//
//  CGSlideMenuCtrl.m
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/15.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import "CGSlideMenuCtrl.h"
#import "CGSlideMenuView.h"
#import "CGMenuView.h"
#import "menuModel.h"
#import "personModel.h"

@interface CGSlideMenuCtrl ()
@property (nonatomic, copy) NSArray *JSONArray;//
@end

@implementation CGSlideMenuCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)barButtonAction:(UIBarButtonItem *)sender {
    CGMenuView *menuView = [CGMenuView loadMenuViewFromXib];
    menuView.prototypeEntitiesFromJSON = [self getMenuData:1];
    menuView.userInfoFromJSON = [self getMenuData:2];
    [[CGSlideMenuView defaultSlideMenu]showModal:sender.tag==0?CGSlideMenuModalLeft:CGSlideMenuModalRight controlMenu:menuView];
}
- (NSArray *)getMenuData:(NSInteger)type{
    // Data from `data.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSLog(@"%@",dataFilePath);
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSLog(@"%@",data);
    /*json转model*/
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",rootDict);
    NSArray *feedDicts;
    if (type == 1) {
        feedDicts = rootDict[@"feed"];
    }else if (type == 2){
        feedDicts = rootDict[@"info"];
    }
    NSLog(@"%@",feedDicts);
    // Convert to `FDFeedEntity`
    NSMutableArray *entities = @[].mutableCopy;
    
    [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (type == 1) {
            [entities addObject:[[menuModel alloc] initWithDictionary:obj]];
        }else if (type == 2){
            [entities addObject:[[personModel alloc] initWithDictionary:obj]];
        }
        
    }];
    self.JSONArray = entities;
    NSLog(@"%@",self.JSONArray);
    return self.JSONArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
