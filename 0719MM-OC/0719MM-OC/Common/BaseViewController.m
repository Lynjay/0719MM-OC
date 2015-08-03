//
//  BaseViewController.m
//  0719MM-OC
//
//  Created by gwchina on 15/8/3.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () {
    UIView *emptyViewContainer;/////空界面
}

@end

@implementation BaseViewController
@synthesize totalCount;
@synthesize showTotal;

-(id)initWithTabTitle:(NSString *)title TabbarHidden:(BOOL)hidden
{
    self = [super init];
    if (self) {
        
        tabbarHidden = hidden;
        
        self.title = title;
//        app = [Application theApp];
        tabTitle = [title copy];
        
        showTotal = NO;
        totalCount = @"0";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = kBgColor;
    
    statusBarHeight = 20.0f;
    
    tabBarHeight = self.tabBarController.tabBar.bounds.size.height;
    navHeight = self.navigationController.navigationBar.bounds.size.height;
    
    /*
     解决NavigationBar与UIViewController重叠的问题
     */
    if(IOS7) {
        self.edgesForExtendedLayout= UIRectEdgeBottom;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    ///////
    viewWidth = self.view.frame.size.width;
    viewHeight = self.view.frame.size.height - statusBarHeight - navHeight - tabBarHeight;
    CGRect newFrame = self.view.frame;
    newFrame.size.height = viewHeight;
    self.view.frame = newFrame;
    
    [self hideTabbar:tabbarHidden];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    //    [[UINavigationBar appearance] setBarTintColor:kNavBarColor];
    self.navigationController.navigationBar.barTintColor = kColorNav;
    [self.navigationController.navigationBar setTranslucent:NO];
    
    
    UIImage *backButtonImage = [UIImage imageNamed:@"nav_back"];
    CGRect backButtonFrame = CGRectMake(0, 0, backButtonImage.size.width, backButtonImage.size.height);
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = backButtonFrame;
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateHighlighted];
    backButton.tag = kBackButtonTag;
    [backButton addTarget:self action:@selector(baseButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self setNavigationBarLeftView:backButton];
    
    /*
     在ios7中 navigationbar中间的字体颜色与ios6不一样，这里重新定义一个titleview
     */
    CGRect titleViewFrame = CGRectMake(0.0f, 0.0f, 150.0f, navHeight);
    UIView *titleView = [[UIView alloc] initWithFrame:titleViewFrame];
    titleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleView;
    
    titleLable = [[UILabel alloc] initWithFrame:titleView.bounds];
    titleLable.backgroundColor = [UIColor clearColor];
    titleLable.font = kFontSizeBig;
    titleLable.textColor = kColorMain;
    titleLable.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:titleLable];
    [self refreshTitle];
    
    
    [self hideTabbar:tabbarHidden];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    self.navigationItem.leftBarButtonItem = nil;
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void) baseButtonEvent:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case kBackButtonTag:
        {
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        default:
            break;
    }
}


#pragma mask 设置NavBarItem

- (void) setNavigationBarLeftView:(UIView *)leftView {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = item;
}

- (void) setNavigationBarRightView:(UIView *)rightView {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = item;
}

- (void) setNavigationBarBackView:(UIView *)backView {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backView];
    self.navigationItem.backBarButtonItem = item;
}

- (void) setNavigationBarCenterView:(UIView *)centerView {
    
    self.navigationItem.titleView = centerView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void) refreshTitleWithCount:(NSString *)total {
    
    titleLable.text = self.title;
    
    ////////列表为空的情况
    [self judgeAndCreateEmptyDefaultViewWithTotal:total Tip:@"其实，这里什么也没有" PaddingVer:0.0f];
}

- (void) refreshTitle {
    titleLable.text = self.title;
}




#pragma mask隐藏tabbar

- (void)hideTabbar:(BOOL)hidden {
    
    self.hidesBottomBarWhenPushed = hidden;
    
    CGRect windowFrame = CGRectMake(0.0f, 0.0f, kScreenWidth, kScreenHeight);
    if(hidden) {
        CGRect newFrame = windowFrame;
        newFrame.size.height -= navHeight + statusBarHeight;
        self.view.frame = newFrame;
    }
    else {
        CGRect newFrame = windowFrame;
        newFrame.size.height -= tabBarHeight + navHeight + statusBarHeight;
        self.view.frame = newFrame;
    }
    viewWidth = self.view.frame.size.width;
    viewHeight = self.view.frame.size.height;
}





#pragma mark 列表为空的情况

- (void) judgeAndCreateEmptyDefaultViewWithTotal:(NSString *)total Tip:(NSString *)tip PaddingVer:(float)paddingVer {
    
    if([total intValue] > 0) {
        if(emptyViewContainer) {
            [emptyViewContainer removeFromSuperview]; emptyViewContainer = nil;
        }
        return;
    }
    
    [self createDefaultEmptyViewWithTip:tip ImageName:@"empty.png" PaddingVer:paddingVer];
}

- (void) createDefaultEmptyViewWithTip:(NSString *)tip ImageName:(NSString *)imgName PaddingVer:(float)paddingVer {
    
    if(emptyViewContainer) {
        [emptyViewContainer removeFromSuperview]; emptyViewContainer = nil;
    }
    
    CGRect containerFrame = CGRectMake(0, paddingVer, self.view.frame.size.width, self.view.frame.size.height-paddingVer);
    emptyViewContainer = [[UIView alloc] initWithFrame:containerFrame];
    emptyViewContainer.backgroundColor = kBgColor;
    [self.view addSubview:emptyViewContainer];
    
    float iconHeight = 70.0f;
    float labelHeight = 40.0f;
    
    float width = iconHeight;
    float height = iconHeight*1.2;
    float marginX = (emptyViewContainer.frame.size.width - width)/2;
    float marginY = (emptyViewContainer.frame.size.height - labelHeight - height)/2-60;
    CGRect iconFrame = CGRectMake(marginX, marginY, width, height);
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:iconFrame];
    iconImageView.backgroundColor = [UIColor clearColor];
    iconImageView.image = [UIImage imageNamed:imgName];
    [emptyViewContainer addSubview:iconImageView];
    
    marginX = 0.0f;
    marginY += height;
    width = emptyViewContainer.frame.size.width - 2*marginX;
    height = labelHeight;
    //    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginX, marginY, width, height)];
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, marginY, CGRectGetWidth(self.view.frame)-60, 60)];
    tipLabel.backgroundColor = [UIColor clearColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor grayColor];
    tipLabel.font = [UIFont systemFontOfSize:15.0f];
    tipLabel.numberOfLines = 0;
    tipLabel.text = tip;
    [emptyViewContainer addSubview:tipLabel];
}


@end
