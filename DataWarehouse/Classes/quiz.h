//
//  quiz.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/15/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface quiz : NSObject

@property (nonatomic, readwrite) NSInteger Id;
@property (nonatomic, readwrite) NSString *question;
@property (nonatomic, readwrite) NSString *option1;
@property (nonatomic, readwrite) NSString *option2;
@property (nonatomic, readwrite) NSString *option3;
@property (nonatomic, readwrite) NSString *option4;
@property (nonatomic, readwrite) NSInteger answer;
@property (nonatomic, readwrite) NSInteger pid;
@property (nonatomic, readwrite) NSInteger mypoll;
@end
