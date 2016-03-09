//
//  AboutUsViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/18/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface AboutUsViewController : ViewController<MFMailComposeViewControllerDelegate>{

    IBOutlet UIWebView *aboutUsView;
    MFMailComposeViewController *mailComposer;
}

-(IBAction)sendMail:(id)sender;
@end
