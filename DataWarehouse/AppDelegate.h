//
//  AppDelegate.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/16/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "subtitles.h"
#import "subpages.h"
#import "quiz.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate> {

    sqlite3			  *database;
    NSString           *databasename;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;


@property (strong, nonatomic) NSMutableArray *_arrQuiz;
@property (nonatomic, readwrite) NSInteger qsncounter;
@property (strong, nonatomic) CLLocationManager *customLocationManager;
@property (strong, nonatomic) CLLocation *currentUserLocation;


- (void)updateCurrentLocation;
- (void)stopUpdatingCurrentLocation;

-(NSMutableArray *)getsubtitles:(NSInteger)pid;
-(NSMutableArray *)getsubpages:(NSInteger)subtitle_id;
-(NSMutableArray *)getQuiz:(NSInteger)pid;
@end

