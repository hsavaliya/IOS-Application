//
//  CategoryStepsViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/17/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "CategoryStepsViewController.h"
#import "AboutUsViewController.h"


@interface CategoryStepsViewController ()

@end

@implementation CategoryStepsViewController{
    NSString *_strTitle;
    NSInteger _pid;
    NSMutableArray *arrSubtitles;
    AboutUsViewController *testcontroller;
    NSArray *categoryStepsIcons;
    
}

@synthesize strTitle, pid;


- (void)viewDidLoad
{
    [super viewDidLoad];
    _strTitle=strTitle;
    _pid=pid;
    self.navigationItem.title=_strTitle;
    
    //call database
    delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    arrSubtitles=[[NSMutableArray alloc]init];
    
    arrSubtitles=[delegate getsubtitles:pid];
    
    categoryStepsIcons=[NSArray arrayWithObjects:@"image_bluestar.png", @"image_yellowstar.png",@"image_greenstar.png",@"image_redstar.png",@"image_blackstar.png",@"image_orangestar.png",@"image_bluestar.png", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [arrSubtitles count];
}


- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"StepCell";
    UITableViewCell *cell = [TableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // Configure the cell...
    subtitles *_subtitles=[arrSubtitles objectAtIndex:indexPath.row];
    
    cell.textLabel.text= _subtitles._title;//[strTitle objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[categoryStepsIcons objectAtIndex:indexPath.row]];
    cell.imageView.contentMode=UIViewContentModeScaleAspectFit;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    subtitles *_subtitles=[arrSubtitles objectAtIndex:indexPath.row];
    
    if([_subtitles._title isEqualToString:@"Demo 1"])
    {
        if(!demoController)
            demoController = [self.storyboard instantiateViewControllerWithIdentifier:@"demo1ViewController"];
        
        demoController.strDemoName=_subtitles._title;
        [self.navigationController pushViewController:demoController animated:YES];
    }
    else if([_subtitles._title isEqualToString:@"Demo 2"] || [_subtitles._title isEqualToString:@"Demo 3"] || [_subtitles._title isEqualToString:@"Demo 4"])
    {
        if(!demoController)
            demoController = [self.storyboard instantiateViewControllerWithIdentifier:@"demoViewController"];
        
        demoController.strDemoName=_subtitles._title;
        [self.navigationController pushViewController:demoController animated:YES];
    }
    else
    {
        //if(!destViewController)
            destViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"stepDescriptionViewController"];
        
        
        destViewController.subTitle=_subtitles._title;
        destViewController.subtitle_id=_subtitles._id;
        destViewController.colorcode=[categoryStepsIcons objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:destViewController animated:YES];
    }
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   
    
    
}
@end
