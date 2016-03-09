//
//  CategoryStepsViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/17/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "StepDescriptionViewController.h"
#import "DemoViewController.h"

@interface CategoryStepsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate *delegate;
    DemoViewController *demoController;
    StepDescriptionViewController *destViewController;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet NSString *strTitle;
@property (nonatomic, readwrite)  NSInteger pid;
@end
