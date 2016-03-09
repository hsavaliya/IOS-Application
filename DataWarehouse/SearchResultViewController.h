//
//  SearchResultViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 10/12/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import "YelpAPIService.h"

@interface SearchResultViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, YelpAPIServiceDelegate>

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;


@property (strong, nonatomic) YelpAPIService *yelpService;
@property (strong, nonatomic) NSString* searchCriteria;
@property (strong, nonatomic) NSMutableArray *tableViewDisplayDataArray;
@property (strong, nonatomic) AppDelegate *appDelegate;

@property (strong, nonatomic) NSString *strLocation;
@property (strong, nonatomic) NSString *strMiles;
@property(strong, nonatomic) NSString *strDemoName;
@end
