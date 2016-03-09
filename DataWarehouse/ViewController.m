//
//  ViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/16/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "ViewController.h"
#import "DWCategoryViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *Titles;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Titles=[NSArray arrayWithObjects:@"Data Warehouse",@"Quiz", @"About us", @"Refferences", nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    
}
@end
