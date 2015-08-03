//
//  ControlListViewController.m
//  0719MM-OC
//
//  Created by gwchina on 15/8/3.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "ControlListViewController.h"

#define tableCellIdentifier @"tableCellIdentifier"

@interface ControlListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *mutableArray;

@end

@implementation ControlListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *array = @[@"瀑布流", @"图文混排", @"手势交互", @"导航", @"菜单", @"视图动画", @"特效", @"键盘", @"音频视频", @"数据持久化", @"系统功能", @"日历", @"绘画", @"网络", @"标签", @"按钮", @"分段选择", @"文本输入", @"滑杆", @"开关", @"指示器", @"进度条", @"页数控制", @"文字视图", @"网页视图", @"地图", @"滚动视图", @"选择器", @"搜索框", @"弹出视图", @"列表", @"社交分享", @"刷新控件"];
    
    self.mutableArray = [NSMutableArray arrayWithArray:array];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
    Class tableViewCell = [UITableViewCell class];
    [self.tableView registerClass:tableViewCell forCellReuseIdentifier:tableCellIdentifier];
    self.tableView.separatorColor = kColorTableviewCell;
    self.tableView.tableFooterView = [[UIView alloc] init];
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

#pragma mark TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mutableArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *pCell = [tableView dequeueReusableCellWithIdentifier:tableCellIdentifier forIndexPath:indexPath];
    
    NSInteger nRow = indexPath.row;
    
    pCell.textLabel.text = self.mutableArray[nRow];
    pCell.textLabel.font = kFontSizeNormal;
    pCell.textLabel.textColor = kColorBlackHighlighted;
    
    return pCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
