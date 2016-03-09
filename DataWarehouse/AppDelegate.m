//
//  AppDelegate.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 8/16/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize _arrQuiz;
@synthesize qsncounter;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    
    //Set page controller
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    
    //Set current location
    self.customLocationManager = [[CLLocationManager alloc] init];
    self.customLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.customLocationManager.delegate = self;
    [self.customLocationManager startUpdatingLocation];
    
    [self CreateDatabaseIfNeeded];
    // Override point for customization after application launch.
    return YES;
}
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return (UIInterfaceOrientationMaskAll);
}
#pragma mark - set mode
- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
# pragma mark - Updates user's current location

-(void)updateCurrentLocation {
    [self.customLocationManager startUpdatingLocation];
}

-(void)stopUpdatingCurrentLocation {
    [self.customLocationManager stopUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    self.currentUserLocation = newLocation;
    
    [self.customLocationManager stopUpdatingLocation];
    self.currentUserLocation = [[CLLocation alloc] initWithLatitude:newLocation.coordinate.latitude
                                                          longitude:newLocation.coordinate.longitude];
}

#pragma mark  -
#pragma mark DATABASE MANAGEMENT
- (void) CreateDatabaseIfNeeded
{
	BOOL success = NO;
	NSError *pError;
    databasename = @"DW.db";
	
	NSFileManager *pFileManager = [NSFileManager defaultManager];
	
	NSArray *pUsrDocPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *pDocsDir = [pUsrDocPath objectAtIndex:0];
	
	NSString *pDbPath = [pDocsDir stringByAppendingPathComponent:databasename];
	
	success = [pFileManager fileExistsAtPath:pDbPath];
	
	if(success){
		if(sqlite3_open([pDbPath UTF8String], &database)!=SQLITE_OK)
			sqlite3_close(database);
		return;
	}
	
	NSString *pDatabasePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databasename];
	
	success = [pFileManager copyItemAtPath: pDatabasePath toPath: pDbPath error:&pError];
	
	if(!success)
		NSAssert1(0, @"Failed to copy the database. Errror: %@.", [pError localizedDescription]);
	else{
		//success = [pFileManager copyItemAtPath: pSoundResourcePath toPath: pSoundDocPath error:&pError];
		if(sqlite3_open([pDbPath UTF8String], &database)!=SQLITE_OK)
			sqlite3_close(database);
	}
	
}


-(NSMutableArray *)getsubtitles:(NSInteger)pid
{
	NSMutableArray *arrsubTitles=nil;
	sqlite3_stmt *selectedStatement = nil;
	NSString *sql= [NSString stringWithFormat:@"select id, title, pid from demo_subtitle where pid = %@ ",[@(pid) stringValue]];
    
	int returnValue = sqlite3_prepare_v2(database, [sql UTF8String], -1, &selectedStatement, NULL);
	if(returnValue == SQLITE_OK)
	{
        //sqlite3_bind_text(selectedStatement, 1, [WhereClause UTF8String], -1,SQLITE_TRANSIENT);
        
		arrsubTitles = [[NSMutableArray alloc]init];
		while(sqlite3_step(selectedStatement)==SQLITE_ROW)
		{
			subtitles *_subtitles=[[subtitles alloc]init];
			_subtitles._id=sqlite3_column_int(selectedStatement, 0);
			_subtitles._title=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 1) encoding:NSUTF8StringEncoding];
            _subtitles._pid=sqlite3_column_int(selectedStatement, 2);
			
			[arrsubTitles addObject:_subtitles];
		}
	}
	return arrsubTitles;
}

-(NSMutableArray *)getsubpages:(NSInteger)subtitle_id
{
	NSMutableArray *arrsubPages=nil;
	sqlite3_stmt *selectedStatement = nil;
	NSString *sql= [NSString stringWithFormat:@"select id, title, description, subtitle_id from demo_subpages where subtitle_id = %@ ",[@(subtitle_id) stringValue]];
    
	int returnValue = sqlite3_prepare_v2(database, [sql UTF8String], -1, &selectedStatement, NULL);
	if(returnValue == SQLITE_OK)
	{
        //sqlite3_bind_text(selectedStatement, 1, [WhereClause UTF8String], -1,SQLITE_TRANSIENT);
        
		arrsubPages = [[NSMutableArray alloc]init];
		while(sqlite3_step(selectedStatement)==SQLITE_ROW)
		{
			subpages *_subpages=[[subpages alloc]init];
			_subpages._id=sqlite3_column_int(selectedStatement, 0);
			_subpages._title=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 1) encoding:NSUTF8StringEncoding];
            _subpages._description=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 2) encoding:NSUTF8StringEncoding];
            _subpages._subtitle_id=sqlite3_column_int(selectedStatement, 3);
			
			[arrsubPages addObject:_subpages];
		}
	}
	return arrsubPages;
}

-(NSMutableArray *)getQuiz:(NSInteger)pid
{
	_arrQuiz=nil;
    qsncounter=0;
	sqlite3_stmt *selectedStatement = nil;
	NSString *sql= [NSString stringWithFormat:@"select id, question, option1, option2, option3, option4, answer, pid from quiz where pid = %@ ",[@(pid) stringValue]];
    
	int returnValue = sqlite3_prepare_v2(database, [sql UTF8String], -1, &selectedStatement, NULL);
	if(returnValue == SQLITE_OK)
	{
        //sqlite3_bind_text(selectedStatement, 1, [WhereClause UTF8String], -1,SQLITE_TRANSIENT);
        
		_arrQuiz= [[NSMutableArray alloc]init];
		while(sqlite3_step(selectedStatement)==SQLITE_ROW)
		{
            
			quiz *_quiz=[[quiz alloc]init];
			_quiz.Id=sqlite3_column_int(selectedStatement, 0);
			_quiz.question=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 1) encoding:NSUTF8StringEncoding];
            _quiz.option1=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 2) encoding:NSUTF8StringEncoding];
            _quiz.option2=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 3) encoding:NSUTF8StringEncoding];
            _quiz.option3=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 4) encoding:NSUTF8StringEncoding];
            _quiz.option4=[NSString stringWithCString:(char *)sqlite3_column_text(selectedStatement, 5) encoding:NSUTF8StringEncoding];
            _quiz.answer=sqlite3_column_int(selectedStatement, 6);
            _quiz.pid=sqlite3_column_int(selectedStatement, 7);
			
			[_arrQuiz addObject:_quiz];
		}
	}
	return _arrQuiz;
}


@end
