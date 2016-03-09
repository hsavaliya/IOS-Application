//
//  subpages.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/12/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "subpages.h"

@implementation subpages

@synthesize _id, _title, _description, _subtitle_id;

-(id)init{
    
    _id=0;
    _title=@"";
    _description=@"";
    _subtitle_id=0;
    return self;
}

@end
