//
//  DWCategoryViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/16/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "DWCategoryViewController.h"
#import "CategoryStepsViewController.h"

@interface DWCategoryViewController ()

@end

@implementation DWCategoryViewController {
    
    NSArray *categoryData;
    NSString *_titleName;
    NSArray *categoryImage;
}
@synthesize TitleName;



- (void)viewDidLoad
{
    [super viewDidLoad];
    _titleName=TitleName;
    
    self.navigationController.navigationBarHidden=FALSE;
    _tableView.backgroundColor=[UIColor clearColor];
    	
    categoryData=[NSArray arrayWithObjects:@"Introduction", @"Data Mart Prototype",@"Data Mart Refinement",@"EDW - Incremental Approach",@"Aggregation", nil];
    categoryImage = [NSArray arrayWithObjects:@"image_introduction.png",@"image_datamart.png",@"image_refinement.png",@"image_edw.png",@"image_aggregation.png", nil];
    
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
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.text=[categoryData objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[categoryImage objectAtIndex:indexPath.row]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
        if ([segue.identifier isEqualToString:@"ShowSteps"]) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            CategoryStepsViewController *destViewController = segue.destinationViewController;
            destViewController.strTitle = [categoryData objectAtIndex:indexPath.row];
            destViewController.pid=indexPath.row;
        }
    
}


@end
