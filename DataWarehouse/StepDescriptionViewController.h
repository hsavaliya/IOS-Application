//
//  StepDescriptionViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/17/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface StepDescriptionViewController :UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;


@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSString *subTitle;
@property (strong, nonatomic) NSString *colorcode;
@property (readwrite, nonatomic) NSInteger subtitle_id;



@property (strong, nonatomic) NSMutableArray *arrPages;
@end
