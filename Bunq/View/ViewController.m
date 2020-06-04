//
//  ViewController.m
//  Bunq
//
//  Created by Taha Darendeli on 29.05.2020.
//  Copyright © 2020 Taha Darendeli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

CGFloat const navigationBarHeight = 50.0f;
CGFloat navigationBarOriginX;
CGFloat navigationBarOriginY;
CGFloat navigationBarOriginWidth;
CGFloat navigationBarOriginHeigth;
CGFloat statusBarHeight;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigationBar];
    [self setTableView];
    
    self.directory = [[EmployeeDirectory alloc] init];
    [self.directory update];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadData)
                                                 name:kEmployeeDirectoryDidUpdateNotification
                                               object:nil];
    
    self.view.contentMode = UIViewContentModeScaleToFill;
}

- (void) setTableView
{
    CGRect bounds = self.view.bounds;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(bounds.origin.x,
                                                                   bounds.origin.y + statusBarHeight + navigationBarHeight,
                                                                   bounds.size.width,
                                                                   bounds.size.height - statusBarHeight - navigationBarHeight)
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:199/255.0 green:78/255.0 blue:78/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    [self.view addSubview:_tableView];
}

- (void) setNavigationBar
{
    UIStatusBarManager *manager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
    statusBarHeight = manager.statusBarFrame.size.height;
    
    navigationBarOriginX = 0;
    navigationBarOriginY = statusBarHeight;
    navigationBarOriginWidth = self.view.frame.size.width;
    navigationBarOriginHeigth = navigationBarHeight + statusBarHeight;
    
    UINavigationBar* navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(navigationBarOriginX,
                                                                                       navigationBarOriginY,
                                                                                       navigationBarOriginWidth,
                                                                                       navigationBarOriginHeigth)];
    
    navigationBar.backgroundColor = [UIColor colorWithRed:199/255.0 green:78/255.0 blue:78/255.0 alpha:1.0];
    navigationBar.barTintColor = [UIColor whiteColor];
    navigationBar.translucent = NO;
    navigationBar.tintColor = [UIColor colorWithRed:199/255.0 green:78/255.0 blue:78/255.0 alpha:1.0];
    [[UINavigationBar appearance] setTitleTextAttributes:
        [NSDictionary dictionaryWithObjectsAndKeys:
            [UIColor colorWithRed:199/255.0 green:78/255.0 blue:78/255.0 alpha:1.0], NSForegroundColorAttributeName, nil]];
    
    UINavigationItem* navigationItem = [[UINavigationItem alloc] initWithTitle:@"Employees"];
    UIBarButtonItem *sortButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Sort"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(sortEmployees)];
    
    navigationItem.rightBarButtonItem = sortButton;
    [navigationBar setItems:@[navigationItem]];
    navigationBar.delegate = self;
    [self.view addSubview:navigationBar];
}

- (void) loadData
{
    [self.tableView reloadData];
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

- (void) sortEmployees
{
    [self.directory sortEmployees:^(EmployeeDirectory* result)
    {
        self.directory = result;
        [self loadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return self.directory.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    [cell setEmployee:[self.directory.employees objectAtIndex:indexPath.row]];
    [cell setUserInteractionEnabled:NO];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
