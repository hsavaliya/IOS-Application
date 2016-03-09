//
//  quiz.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/15/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "quiz.h"

@implementation quiz
@synthesize Id,question,option1,option2,option3, option4, answer, pid, mypoll;
-(id)init{
    Id=0;
    question=@"";
    option1=@"";
    option2= @"";
    option3 = @"";
    option4 = @"";
    answer = 0;
    pid = 0;
    mypoll = 0;
    return  self;
}


@end
