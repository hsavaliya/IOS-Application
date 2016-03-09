//
//  restaurants.h
//  SingleView
//
//  Created by Hetal Savaliya on 10/10/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface restaurants : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *thumbURL;
@property (nonatomic, strong) NSString *ratingURL;
@property (nonatomic, strong) NSString *yelpURL;
@property (nonatomic, strong) NSString *review_count;
@property (nonatomic, strong) NSString *display_phone;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state_code;

@end
