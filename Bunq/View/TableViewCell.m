//
//  TableViewCell.m
//  Bunq
//
//  Created by Taha Darendeli on 30.05.2020.
//  Copyright © 2020 Taha Darendeli. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

NSString* const cellIdentifier = @"cell_identifier";
@synthesize employee = _employee;

- (void)setEmployee:(Employee *)employee
{
    if (employee==nil) return;

    _employee = employee;
}

- (void)layoutSubviews
{
    self.backgroundColor = [UIColor colorWithRed:199/255.0 green:78/255.0 blue:78/255.0 alpha:1.0];
    
    [self.employeeView removeFromSuperview];
    self.employeeView = [[EmployeeView alloc] initWithEmployee:_employee frame:CGRectMake(self.contentView.frame.origin.x + 10,
                                                                                          self.contentView.frame.origin.y + 5,
                                                                                          self.contentView.frame.size.width - 20,
                                                                                          self.contentView.frame.size.height - 10)];
    
    [self.contentView addSubview:self.employeeView];
}

@end
