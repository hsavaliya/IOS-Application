//
//  PageContentViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/17/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "subpages.h"

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblLable;
@property (weak, nonatomic) IBOutlet UITextView *txtDesc;
@property (weak, nonatomic) IBOutlet UIWebView *webDescView;
@property (weak, nonatomic) IBOutlet UIImageView *imgTheme;




@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *description;
@property NSString *colorcode;


@end
