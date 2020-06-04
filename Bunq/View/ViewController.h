//
//  ViewController.h
//  Bunq
//
//  Created by Taha Darendeli on 29.05.2020.
//  Copyright © 2020 Taha Darendeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDirectory.h"
#import "TableViewCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIBarPositioningDelegate, UINavigationBarDelegate>

extern CGFloat const navigationBarHeight;

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic) EmployeeDirectory *directory;

@end

