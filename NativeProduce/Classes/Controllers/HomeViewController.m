//
//  HomeViewController.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+AutoLayout.h"
#import "HomeViewModel.h"
#import "CountryCell.h"
#import "UINavigationBar+HYBackground.h"

#define NAVBAR_CHANGE_POINT 64

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate, HomeViewModelPresenter>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeViewModel *viewModel;

@end

@implementation HomeViewController

static NSString *const kHomeCellID = @"HomeCell";
static void *countriesContext = &countriesContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Home";
        self.viewModel = [HomeViewModel new];
        self.viewModel.presenter = self;
    }
    return self;
}

- (void)dealloc {
    [self.viewModel removeObserver:self forKeyPath:@"countries"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeView];
    
    [self addRightButton];
    
    [self addTableview];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeView {
    self.view.backgroundColor = HEXRGB(0xFFFFFF);
    
    [self.navigationController.navigationBar hy_setBackgroundColor:[UIColor redColor]];
    [self.navigationController.navigationBar hy_setElementsAlpha:1.0f];
}

- (void)addTableview {
    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.tableView];
    
    [self.view addConstraints:[self.tableView constraintsFillWidth]];
    [self.view addConstraints:[self.tableView constraintsFillHeight]];
}

- (void)loadData {
    [self.viewModel fetchedCountries];
}

- (void)addRightButton {
    UIButton *moonButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moonButton setBackgroundImage:[UIImage imageNamed:@"ButtonSetting"] forState:UIControlStateNormal];
    [moonButton setBackgroundImage:[UIImage imageNamed:@"ButtonSetting"] forState:UIControlStateHighlighted];
    [moonButton sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moonButton];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.countryArrayCount();
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CountryCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeCellID];
    if (!cell){
        cell = [[CountryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeCellID];
    }
    
    cell.backgroundColor = [UIColor blueColor];
    NSString *countryName = self.viewModel.countryName(indexPath.row);
    NSString *countryCode = self.viewModel.countryCode(indexPath.row);
    
    cell.updateCountryName(countryName).updateCountryCode(countryCode);
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        if (offsetY >= 44) {
            [self setNavigationBarTransformProgress:1];
        } else {
            [self setNavigationBarTransformProgress:(offsetY / 44)];
        }
    } else {
        [self setNavigationBarTransformProgress:0];
    }
    
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY <= NAVBAR_CHANGE_POINT) {
//        CGFloat alpha = MIN(1, ABS(1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64)));
//        [self setNavigationBarTransformProgress:alpha];
//    }
//    else {
//        [self setNavigationBarTransformProgress:0.0f];
//    }
}

- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    // [self.navigationController.navigationBar hy_setTranslationY:(-44 * progress)];
    [self.navigationController.navigationBar hy_setElementsAlpha:(1-progress)];
}

#pragma mark - HomeViewModelPresenter

- (void)showAlertWithError:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
}

- (void)showAlertWithMessage:(NSString *)message {
    [SVProgressHUD showSuccessWithStatus:message];
}

- (void)reloadData {
    [self.tableView reloadData];
}

@end
