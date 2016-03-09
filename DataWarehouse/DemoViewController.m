//
//  DemoViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 10/11/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "DemoViewController.h"
#import "SearchResultViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

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
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    //self.scrView.contentSize=CGSizeMake(320, 1500);
    // Do any additional setup after loading the view.
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

- (IBAction)btnSearchClicked:(id)sender {
}
#pragma mark textfield delegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldTextDidChange:(NSNotification *)notification
{
    UITextField *textfield = notification.object;
    
    if(textfield.text.length == 2)
        [self.txtMiles resignFirstResponder];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"SearchByMile"]) {
       
        SearchResultViewController *destViewController = segue.destinationViewController;
        destViewController.strMiles=_txtMiles.text;
        destViewController.strLocation=@"";
        destViewController.strDemoName=self.strDemoName;
        
    }
    if ([segue.identifier isEqualToString:@"SearchByLocation"]) {
        
        SearchResultViewController *destViewController = segue.destinationViewController;
        destViewController.strMiles=@"";
        destViewController.strLocation=_txtLocation.text;
        destViewController.strDemoName=self.strDemoName;
    }
    
}

@end
