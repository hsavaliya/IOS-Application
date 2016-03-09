//
//  AboutUsViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/18/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden=FALSE;
    self.navigationItem.title=@"About Us";
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"aboutus"
                                                     ofType:@"html"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    [aboutUsView loadHTMLString:content baseURL:nil];
    
    aboutUsView.opaque=NO;
    aboutUsView.backgroundColor=[UIColor clearColor];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)sendMail:(id)sender{
    NSString *emailTitle = @"Data warehosue courseware feedback";
    // Email Content
    //NSString *messageBody = @"iOS programming is so fun!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"lsavaliya@csus.edu"];
    
    
    mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:emailTitle];
    [mailComposer setToRecipients:toRecipents];
    [mailComposer setMessageBody:@"Testing message for the test mail" isHTML:NO];
    // Present mail view controller on screen
    [self presentViewController:mailComposer animated:YES completion:NULL];
}
     
#pragma mark - mail compose delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
