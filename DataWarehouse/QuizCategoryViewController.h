//
//  QuizCategoryViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/13/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizCategoryViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
    __weak IBOutlet UITableView *tableView;
}

@end
