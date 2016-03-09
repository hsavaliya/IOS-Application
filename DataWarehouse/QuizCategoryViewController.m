//
//  QuizCategoryViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/13/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "QuizCategoryViewController.h"
#import "QuestionViewController.h"
#import "AppDelegate.h"
@interface QuizCategoryViewController ()

@end

@implementation QuizCategoryViewController
{
    NSArray *categoryData;
    AppDelegate *appDelegate;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    
    appDelegate =(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden=FALSE;
    self.navigationItem.title=@"QUIZ";
     categoryData=[NSArray arrayWithObjects:@"Datamart Prototype",@"Datamart Refinement",@"EDW:Enterprise Data Warehouse",@"Aggregation", nil];
    
    
    tableView.backgroundView=nil;
    tableView.backgroundColor=[UIColor clearColor];
     [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [categoryData count];
}


- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CategoryCell";
    UITableViewCell *cell = [TableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // Configure the cell...
    //UITableViewCellAccessoryType=[UITableViewCellAccessoryDetailButton];
    cell.textLabel.text=[categoryData objectAtIndex:indexPath.row];
    
    return cell;
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"ShowQuizQsn"]) {
        NSIndexPath *indexPath = [tableView indexPathForSelectedRow];
        QuestionViewController *destViewController = segue.destinationViewController;
        appDelegate.qsncounter=0;
        destViewController.pid=indexPath.row+1;
        
    }
    
}

@end
