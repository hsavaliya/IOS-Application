//
//  ResultViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/16/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "ResultViewController.h"
#import "QsnReviewViewController.h"
#import "AppDelegate.h"

@interface ResultViewController ()

@end

@implementation ResultViewController
{
    NSMutableArray *arrQuiz;
    AppDelegate *appDelegate;
    int ResultPercentage;
}

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
    appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    arrQuiz=appDelegate._arrQuiz.copy;
    self.navigationController.navigationBarHidden=TRUE;
    
    ResultPercentage=0;
    self.lblResultPercentage.text=@"100% Correct";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return [arrQuiz count];
}


- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cellQsnReview";
    UITableViewCell *cell = [TableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // Configure the cell...
    
    quiz *_quiz = [arrQuiz objectAtIndex:indexPath.row];
    
    cell.textLabel.text=_quiz.question;
    if(_quiz.answer==_quiz.mypoll){
        cell.imageView.image = [UIImage imageNamed:@"correct_icon.png"];
        ResultPercentage++;
    }
    else
        cell.imageView.image = [UIImage imageNamed:@"wrong_icon.png"];
    
    if(indexPath.row == [arrQuiz count]-1)
    {
        self.lblResultPercentage.text =[NSString stringWithFormat:@"%lu %@ Correct", (unsigned long)(ResultPercentage*100/[arrQuiz count]), @"%"];
    }
    
    return cell;
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"QsnReview"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        QsnReviewViewController *destinationViewcontroller=segue.destinationViewController;
        destinationViewcontroller.selectedQuestion= (int)(indexPath.row);
        
    }
}


- (IBAction)btnHomeClicked:(id)sender {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (IBAction)btnShareClicked:(id)sender {
}
@end
