//
//  YelpAPIService.m
//  SingleView
//
//  Created by Hetal Savaliya on 10/10/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "YelpAPIService.h"
#import "restaurants.h"

#define SEARCH_RESULT_LIMIT 10

@implementation YelpAPIService

-(void)searchNearByRestaurantsByFilter:(NSString *)categoryFilter radius:(CGFloat)miles atLatitude:(CLLocationDegrees)latitude andLongitude:(CLLocationDegrees)longitude {
    //sort=1=>sort by location
    NSString *urlString = [NSString stringWithFormat:@"%@?term=%@&latitude=%f&longitude=%f&sort=1&radius_filter=%f",
                           @"http://athena.csus.edu/~datamini/Hetal/DataWarehouse/DataWarehouse/api.php?",
                           categoryFilter,
                           latitude,
                           longitude,
                           miles*1600
                           ];
    
    NSURL *URL = [NSURL URLWithString:urlString];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    
    
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (conn) {
        self.urlRespondData = [NSMutableData data];
    }
}

-(void)searchNearByRestaurantsByFilter:(NSString *)categoryFilter andLocation:(NSString *)Location {
    
    NSString *urlString = [NSString stringWithFormat:@"%@?term=%@&location=%@",
                           @"http://athena.csus.edu/~datamini/Hetal/DataWarehouse/DataWarehouse/api.php",
                           categoryFilter,
                           Location
                           ];
    
    NSURL *URL = [NSURL URLWithString:urlString];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    
    
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (conn) {
        self.urlRespondData = [NSMutableData data];
    }
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.urlRespondData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)d {
   // NSString* newStr = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    [self.urlRespondData appendData:d];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:@"Failed to connect to server"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *e = nil;
    
    NSDictionary *resultResponseDict = [NSJSONSerialization JSONObjectWithData:self.urlRespondData
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&e];

    
    
    if (self.resultArray && [self.resultArray count] > 0) {
        [self.resultArray removeAllObjects];
    }
    
    if (!self.resultArray) {
        self.resultArray = [[NSMutableArray alloc] init];
    }
    
    if (resultResponseDict && [resultResponseDict count] > 0) {
        if ([resultResponseDict objectForKey:@"businesses"] &&
            [[resultResponseDict objectForKey:@"businesses"] count] > 0) {
            
            for (NSDictionary *restaurantDict in [resultResponseDict objectForKey:@"businesses"]) {
                restaurants *restaurantObj = [[restaurants alloc] init];
                restaurantObj.name = [restaurantDict objectForKey:@"name"];
                restaurantObj.thumbURL = [restaurantDict objectForKey:@"image_url"];
                restaurantObj.ratingURL = [restaurantDict objectForKey:@"rating_img_url"];
                restaurantObj.yelpURL = [restaurantDict objectForKey:@"url"];
                restaurantObj.address = [[[restaurantDict objectForKey:@"location"] objectForKey:@"address"] componentsJoinedByString:@", "];
                restaurantObj.review_count=[NSString stringWithFormat:@"%@",[restaurantDict objectForKey:@"review_count"]];
                restaurantObj.display_phone=[restaurantDict objectForKey:@"display_phone"];
                restaurantObj.city=[[restaurantDict objectForKey:@"location"] objectForKey:@"city"];
                restaurantObj.state_code=[[restaurantDict objectForKey:@"location"] objectForKey:@"state_code"];
                
                //CGFloat distance = (CGFloat)[[restaurantDict objectForKey:@"distance"] floatValue] ;
                
                [self.resultArray addObject:restaurantObj];
            }
        }
    }
    
    [self.delegate loadResultWithDataArray:self.resultArray];
}



@end
