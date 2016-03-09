//
//  subtitles.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/12/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface subtitles : NSObject
{
    NSInteger _id;
    NSString *_title;
    NSInteger _pid;
}
@property(nonatomic, readwrite)NSInteger _id;
@property (nonatomic, retain)NSString *_title;
@property (nonatomic, readwrite) NSInteger _pid;

@end
