//
//  ResultViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/16/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "ViewController.h"

@interface ResultViewController : ViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lblResultPercentage;


- (IBAction)btnHomeClicked:(id)sender;
- (IBAction)btnShareClicked:(id)sender;

@end
