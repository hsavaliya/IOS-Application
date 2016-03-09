//
//  subpages.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/12/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface subpages : NSObject
{
    
    
}
@property (nonatomic, readwrite) NSInteger _id;
@property (nonatomic, retain) NSString *_title;
@property (nonatomic, retain) NSString *_description;
@property (nonatomic, readwrite) NSInteger _subtitle_id;

@end
