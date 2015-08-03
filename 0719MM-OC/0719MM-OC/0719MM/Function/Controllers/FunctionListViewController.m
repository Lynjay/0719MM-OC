//
//  FunctionListViewController.m
//  0719MM-OC
//
//  Created by gwchina on 15/8/3.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "FunctionListViewController.h"

@interface FunctionListViewController ()

@end

@implementation FunctionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setNavigationBarLeftView:nil];
}

- (id) initWithTabTitle:(NSString *)title TabbarHidden:(BOOL)hidden {
    
    if(self = [super initWithTabTitle:title TabbarHidden:hidden]) {
        self.hidesBottomBarWhenPushed = NO;

    }
    return self;
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
