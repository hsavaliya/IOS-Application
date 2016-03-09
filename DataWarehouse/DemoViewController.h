//
//  DemoViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 10/11/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;
@property (weak, nonatomic) IBOutlet UITextField *txtMiles;
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;

@property (strong, nonatomic) NSString *strDemoName;
- (IBAction)btnSearchClicked:(id)sender;

@end
