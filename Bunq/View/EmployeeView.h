//
//  EmployeeView.h
//  Bunq
//
//  Created by Taha Darendeli on 30.05.2020.
//  Copyright © 2020 Taha Darendeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface EmployeeView : UIView

@property (nonatomic, strong) IBOutlet UILabel *labelName;
@property (nonatomic, strong) IBOutlet UILabel *labelBirthdate;
@property (nonatomic, strong) IBOutlet UILabel *labelSalary;

-(instancetype)initWithEmployee:(Employee*)employee frame:(CGRect)frame;
- (void)setEmployee:(Employee *)employee;

@end
