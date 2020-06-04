//
//  TableViewCell.h
//  Bunq
//
//  Created by Taha Darendeli on 30.05.2020.
//  Copyright © 2020 Taha Darendeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "EmployeeView.h"

@interface TableViewCell : UITableViewCell

extern NSString* const cellIdentifier;

@property (nonatomic, strong) IBOutlet EmployeeView *employeeView;
@property (nonatomic, strong) Employee *employee;

@end

