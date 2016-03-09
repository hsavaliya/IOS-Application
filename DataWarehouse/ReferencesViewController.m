//
//  ReferencesViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/18/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "ReferencesViewController.h"

@interface ReferencesViewController ()

@end

@implementation ReferencesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = FALSE;
    self.navigationItem.title = @"References";

    NSString* path = [[NSBundle mainBundle] pathForResource:@"references"
                                                     ofType:@"html"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    self.txtReferences.text=[NSString stringWithString:content];
    
   // self.txtReferences.text=@"1. Database Data Warehousing Guide \n\
    http://docs.oracle.com/database/121/DWHSG/concept.htm#DWHSG001 \n\
\n\
2. Jiawei Han, Micheline Kambe, “Data Mining: Concepts and Techniques”, 3rd Edition, Morgan Kaufmann Publishers, 2011. \n\
\n\
3. Data Warehouse info\n\
   http://datawarehouse4u.info/ \n\
\n\
4. Oracle® Business Intelligence Standard Edition One Tutorial Release 10g (10.1.3.2.1) \n\
   http://docs.oracle.com/html/E10312_01/toc.htm ch9 \n\
\n\
5. An Overview of Data Warehouse Design Approaches and Techniques by Alejandro Gutiérrez, Adriana Marotta \n\
   http://www.fing.edu.uy/inco/grupos/csi/esp/Publicaciones/pub_csi2001/rt1_tecnicasDisDW.pdf \n\
\n\
6. Data Modeling Techniques for Data Warehousing by Chuck Ballard, Dirk Herreman, Don Schau, Rhonda Bell, Eunsaeng Kim, Ann Valencic \n\
   http://www.redbooks.ibm.com/redbooks/pdfs/sg242238.pdf \n\
\n\
7. Data warehouse toolkit \n\
\n\
8. Christopher Adamson, Michael Venerable, “Data Warehouse Design Solutions”, Wiley Publishing Inc., 1998 \n\
\n\
9. Data Modeling Techniques for Data Warehousing, An IBM Redbooks publication \n\
   http://www.redbooks.ibm.com/abstracts/sg242238.html?Open \n\
\n\
10. A Courseware for Data Warehousing \n\
    http://athena.ecs.csus.edu/~enroll/enrollDW/Intro.php \n\
\n\
11. Prof. Lu, CSc -177 Lecture Notes, Spring 2010. \n\
    http://http://athena.ecs.csus.edu/~mei/177/csc177.html \n\
\n\
12. Clickstream Data Warehousing \n\
    http://www.clickstreamdatawarehousing.com/aggregate_article.html";
                
    /*
    //References:
    1. Database Data Warehousing Guide
        http://docs.oracle.com/database/121/DWHSG/concept.htm#DWHSG001
    
    2. Jiawei Han, Micheline Kambe, “Data Mining: Concepts and Techniques”, 3rd Edition, Morgan Kaufmann Publishers, 2011.
    
    3. Data Warehouse info
        http://datawarehouse4u.info/
    
    4. Oracle® Business Intelligence Standard Edition One Tutorial Release 10g (10.1.3.2.1)
        http://docs.oracle.com/html/E10312_01/toc.htm ch9
    
    5. An Overview of Data Warehouse Design Approaches and Techniques by Alejandro Gutiérrez, Adriana Marotta
        http://www.fing.edu.uy/inco/grupos/csi/esp/Publicaciones/pub_csi2001/rt1_tecnicasDisDW.pdf
    
    6.Data Modeling Techniques for Data Warehousing by Chuck Ballard, Dirk Herreman, Don Schau, Rhonda Bell, Eunsaeng Kim, Ann Valencic
        http://www.redbooks.ibm.com/redbooks/pdfs/sg242238.pdf
    
    7. Data warehouse toolkit
    
    8. Christopher Adamson, Michael Venerable, “Data Warehouse Design Solutions”, Wiley Publishing Inc., 1998.
    
    9. Data Modeling Techniques for Data Warehousing, An IBM Redbooks publication
        http://www.redbooks.ibm.com/abstracts/sg242238.html?Open
    
    10. A Courseware for Data Warehousing
        http://athena.ecs.csus.edu/~enroll/enrollDW/Intro.php
    //http://www.databaseanswers.org/data_models/restaurant_guide/data_mart.htm
    
    11. Prof. Lu, CSc -177 Lecture Notes, Spring 2010.
        http://http://athena.ecs.csus.edu/~mei/177/csc177.html
    
    12. Clickstream Data Warehousing
        http://www.clickstreamdatawarehousing.com/aggregate_article.html
    */
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
