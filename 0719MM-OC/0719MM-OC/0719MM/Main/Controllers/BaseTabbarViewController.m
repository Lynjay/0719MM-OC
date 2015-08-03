//
//  BaseTabbarViewController.m
//  0719MM-OC
//
//  Created by gwchina on 15/8/3.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "BaseTabbarViewController.h"
#import "ControlListViewController.h"
#import "FunctionListViewController.h"
#import "OtherListViewController.h"

@interface BaseTabbarViewController ()

@property (nonatomic, retain) ControlListViewController *controlList;
@property (nonatomic, retain) FunctionListViewController *functionList;
@property (nonatomic, retain) OtherListViewController *otherList;

@end

@implementation BaseTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
}

- (void)setupSubviews {
    //    self.tabBar.backgroundImage = [[UIImage imageNamed:@"tabbarBackground"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    //    self.tabBar.selectionIndicatorImage = [[UIImage imageNamed:@"tabbarSelectBg"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    
    self.controlList = [[ControlListViewController alloc] initWithTabTitle:@"控件列表" TabbarHidden:NO];
//    self.controlList = [[ControlListViewController alloc] init];
    self.controlList.tabBarItem = [[UITabBarItem alloc] init];
    self.controlList.tabBarItem.title = @"控件列表";
    self.controlList.tabBarItem.selectedImage = [[UIImage imageNamed:@"i_baby_tab_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    self.controlList.tabBarItem.image = [[UIImage imageNamed:@"i_baby_tab_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    studentHomeWork.tabBarItem.imageInsets = UIEdgeInsetsMake(6,0,-6,0);
    //    [studentHomeWork.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0,-3)];
    [self unSelectedTapTabBarItems:self.controlList.tabBarItem];
    [self selectedTapTabBarItems:self.controlList.tabBarItem];
    UINavigationController *controlListNav = [[UINavigationController alloc] initWithRootViewController:self.controlList];
    
    self.functionList = [[FunctionListViewController alloc] initWithTabTitle:@"功能列表" TabbarHidden:NO];
//    self.functionList = [[FunctionListViewController alloc] init];
    self.functionList.tabBarItem = [[UITabBarItem alloc] init];
    self.functionList.tabBarItem.title = @"功能列表";
    self.functionList.tabBarItem.selectedImage = [[UIImage imageNamed:@"i_baby_tab_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    self.functionList.tabBarItem.image = [[UIImage imageNamed:@"i_baby_tab_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self unSelectedTapTabBarItems:self.functionList.tabBarItem];
    [self selectedTapTabBarItems:self.functionList.tabBarItem];
    UINavigationController *functionListNav = [[UINavigationController alloc] initWithRootViewController:self.functionList];
    
    self.otherList = [[OtherListViewController alloc] initWithTabTitle:@"其他列表" TabbarHidden:NO];
//    self.otherList = [[OtherListViewController alloc] init];
    self.otherList.tabBarItem = [[UITabBarItem alloc] init];
    self.otherList.tabBarItem.title = @"其他列表";
    self.otherList.tabBarItem.selectedImage = [[UIImage imageNamed:@"i_baby_tab_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    self.otherList.tabBarItem.image = [[UIImage imageNamed:@"i_baby_tab_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    studentView.tabBarItem.badgeValue=@"21";
    //    studentView.tabBarItem.imageInsets = UIEdgeInsetsMake(6,0,-6,0);
    //    [studentView.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0,-3)];
    [self unSelectedTapTabBarItems:self.otherList.tabBarItem];
    [self selectedTapTabBarItems:self.otherList.tabBarItem];
    UINavigationController *otherListNav = [[UINavigationController alloc] initWithRootViewController:self.otherList];

    NSArray *list = @[controlListNav, functionListNav, otherListNav];
    self.viewControllers = list;
    [self selectedTapTabBarItems:controlListNav.tabBarItem];
}

-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem {
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14], UITextAttributeFont,UIColorFromRGB(0x999999, 1),UITextAttributeTextColor,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem {
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14],
                                        UITextAttributeFont,UIColorFromRGB(0x57cd29, 1),UITextAttributeTextColor,
                                        nil] forState:UIControlStateSelected];
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 0) {
        
    }else if (item.tag == 1){
        
    }else if (item.tag == 2){
        
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [viewController viewWillAppear:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.selectedViewController viewWillAppear:animated];
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
