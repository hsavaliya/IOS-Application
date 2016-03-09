//
//  YelpAPIService.h
//  SingleView
//
//  Created by Hetal Savaliya on 10/10/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@protocol YelpAPIServiceDelegate <NSObject>
-(void)loadResultWithDataArray:(NSArray *)resultArray;
@end

@interface YelpAPIService : NSObject <NSURLConnectionDataDelegate>

@property(nonatomic, strong) NSMutableData *urlRespondData;
@property(nonatomic, strong) NSString *responseString;
@property(nonatomic, strong) NSMutableArray *resultArray;

@property (weak, nonatomic) id <YelpAPIServiceDelegate> delegate;

-(void)searchNearByRestaurantsByFilter:(NSString *)categoryFilter radius:(CGFloat)miles atLatitude:(CLLocationDegrees)latitude andLongitude:(CLLocationDegrees)longitude;
-(void)searchNearByRestaurantsByFilter:(NSString *)categoryFilter andLocation:(NSString *)Location;

@end