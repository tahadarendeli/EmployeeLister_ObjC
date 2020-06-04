//
//  EmployeeView.m
//  Bunq
//
//  Created by Taha Darendeli on 30.05.2020.
//  Copyright © 2020 Taha Darendeli. All rights reserved.
//

#import "EmployeeView.h"

@implementation EmployeeView

-(instancetype)initWithEmployee:(Employee*)employee frame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        
        self.layer.cornerRadius = 10;
        self.backgroundColor = [UIColor whiteColor];
        
        [self setLabels];
        [self setStackViews];
        
        [self setEmployee:employee];
    }
    
    return self;
}

- (void)setEmployee:(Employee *)employee
{
    if (employee==nil) return;
    
    self.labelName.text = employee.name;
    self.labelBirthdate.text = [NSString stringWithFormat:@"%lu", (unsigned long)employee.birthYear];
    if([employee respondsToSelector:employee.salarySelector]) {
        self.labelSalary.text = [employee performSelector:employee.salarySelector];
    }
}

- (void)setLabels
{
    self.labelName = [[UILabel alloc]initWithFrame:CGRectZero];
    self.labelBirthdate = [[UILabel alloc]initWithFrame:CGRectZero];
    self.labelSalary = [[UILabel alloc]initWithFrame:CGRectZero];
    
    self.labelName.textAlignment = NSTextAlignmentCenter;
    self.labelBirthdate.textAlignment = NSTextAlignmentCenter;
    self.labelSalary.textAlignment = NSTextAlignmentCenter;
    
    self.labelName.backgroundColor = [UIColor clearColor];
    self.labelBirthdate.backgroundColor = [UIColor clearColor];
    self.labelSalary.backgroundColor = [UIColor clearColor];
    
    self.labelName.textColor = [UIColor blackColor];
    self.labelBirthdate.textColor = [UIColor blackColor];
    self.labelSalary.textColor = [UIColor colorWithRed:19/255.0 green:120/255.0 blue:41/255.0 alpha:1.0];
    
    self.labelName.font = [UIFont boldSystemFontOfSize:21.0];
    self.labelBirthdate.font = [UIFont systemFontOfSize:14];
    self.labelSalary.font = [UIFont systemFontOfSize:18];
}

- (void)setStackViews
{
    UIStackView *mainStackView = [[UIStackView alloc] initWithFrame:CGRectMake(10, 5, self.frame.size.width - 20,  self.frame.size.height - 10)];
    mainStackView.axis = UILayoutConstraintAxisHorizontal;
    mainStackView.distribution = UIStackViewDistributionEqualSpacing;
    mainStackView.alignment = UIStackViewAlignmentFill;
    mainStackView.spacing = 10;
    
    UIStackView *innerStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    innerStackView.axis = UILayoutConstraintAxisVertical;
    innerStackView.distribution = UIStackViewDistributionFill;
    innerStackView.alignment = UIStackViewAlignmentLeading;
    innerStackView.spacing = 5;
    
    [innerStackView addArrangedSubview:_labelName];
    [innerStackView addArrangedSubview:_labelBirthdate];
    [mainStackView addArrangedSubview:innerStackView];
    [mainStackView addArrangedSubview:_labelSalary];
    
    [self addSubview:mainStackView];
}

@end
