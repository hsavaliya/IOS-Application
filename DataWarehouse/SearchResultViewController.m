//
//  SearchResultViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 10/12/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "SearchResultViewController.h"
#import "ResultTableViewCell.h"
#import "restaurants.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

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
    if (!self.tableViewDisplayDataArray) {
        self.tableViewDisplayDataArray = [[NSMutableArray alloc] init];
    }
    
    self.appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.appDelegate updateCurrentLocation];
    
    self.navigationItem.title=self.strDemoName;
    //self.tableView.dataSource=self.tableViewDisplayDataArray;
    
    [self findNearByRestaurantsFromYelpbyCategory:@"Restaurants"];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)findNearByRestaurantsFromYelpbyCategory:(NSString *)categoryFilter {
    if (categoryFilter && categoryFilter.length > 0) {
        
        if(![self.strLocation isEqualToString:@""])
        {
            [self.tableViewDisplayDataArray removeAllObjects];
            [self.tableView reloadData];
            
            self.messageLabel.text = @"Fetching results..";
            self.activityIndicator.hidden = NO;
            
            self.yelpService = [[YelpAPIService alloc] init];
            self.yelpService.delegate = self;
            
            self.searchCriteria = categoryFilter;
            
            [self.yelpService searchNearByRestaurantsByFilter:[categoryFilter lowercaseString] andLocation:[[self.strLocation lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""]];
        }
        else
        {
        /*
         //For Device
         
         if (([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied)
         && self.appDelegate.currentUserLocation &&
         self.appDelegate.currentUserLocation.coordinate.latitude) {
         
         */
        
        
        [self.tableViewDisplayDataArray removeAllObjects];
        [self.tableView reloadData];
        
        self.messageLabel.text = @"Fetching results..";
        self.activityIndicator.hidden = NO;
        
        self.yelpService = [[YelpAPIService alloc] init];
        self.yelpService.delegate = self;
        
        self.searchCriteria = categoryFilter;
        
        [self.yelpService searchNearByRestaurantsByFilter:[categoryFilter lowercaseString] radius:(CGFloat)[self.strMiles floatValue] atLatitude:self.appDelegate.currentUserLocation.coordinate.latitude andLongitude:self.appDelegate.currentUserLocation.coordinate.longitude];
        /*}
         
         else {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location is Disabled"
         message:@"Enable it in settings and try again"
         delegate:nil
         cancelButtonTitle:@"OK"
         otherButtonTitles:nil];
         [alert show];
         }*/
        }
    }
}
# pragma mark - Yelp API Delegate Method

-(void)loadResultWithDataArray:(NSArray *)resultArray {
    self.messageLabel.text = @"Tap on the mic";
    self.activityIndicator.hidden = YES;
    
    self.tableViewDisplayDataArray = [resultArray copy];//[resultArray mutableCopy];
    [self.tableView reloadData];
    
    
    
    if ([self.tableViewDisplayDataArray count] > 0) {
        self.messageLabel.text =[NSString stringWithFormat:@""];
    }
    
    else {
        self.messageLabel.text =[NSString stringWithFormat:@"I could not find any  restaurants"];
    }
}

# pragma mark - TableView Datasource and Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableViewDisplayDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ResultTableViewCell *cell = (ResultTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SearchResultTableViewCell" forIndexPath:indexPath];
    
    restaurants *restaurantObj = (restaurants *)[self.tableViewDisplayDataArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = restaurantObj.name;
    cell.addressLabel.text = [NSString stringWithFormat:@"%@ %@, %@", restaurantObj.address, restaurantObj.city, restaurantObj.state_code];
    cell.phoneLable.text = restaurantObj.display_phone;
    cell.reviewLable.text = @"";
    
    if([self.strDemoName isEqualToString:@"Demo 3"] || [self.strDemoName isEqualToString:@"Demo 4"])
    {
        cell.reviewLable.text = [NSString stringWithFormat:@"Reviews %@",restaurantObj.review_count?restaurantObj.review_count:@"none"];
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *thumbImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:restaurantObj.thumbURL]];
        NSData *ratingImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:restaurantObj.ratingURL]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.thumbImage.image = [UIImage imageWithData:thumbImageData];
            cell.ratingImage.image = [UIImage imageWithData:ratingImageData];
            cell.ratingImage.hidden = true;
            if([self.strDemoName isEqualToString:@"Demo 4"])
                cell.ratingImage.hidden = false;
        });
    });
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    restaurants *restaurantObj = (restaurants *)[self.tableViewDisplayDataArray objectAtIndex:indexPath.row];
    
    if (restaurantObj.yelpURL) {
        UIApplication *app = [UIApplication sharedApplication];
        [app openURL:[NSURL URLWithString:restaurantObj.yelpURL]];
    }
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
