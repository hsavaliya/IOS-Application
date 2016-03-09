//
//  DWCategoryViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/16/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWCategoryViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSString *TitleName;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
