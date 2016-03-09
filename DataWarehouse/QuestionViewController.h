//
//  QuestionViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/14/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController
{
    
    __weak IBOutlet UIButton *btnHome;
    
   
}
@property (weak, nonatomic) IBOutlet UILabel *lblOption1;
@property (weak, nonatomic) IBOutlet UILabel *lblOption2;
@property (weak, nonatomic) IBOutlet UILabel *lblOption3;
@property (weak, nonatomic) IBOutlet UILabel *lblOption4;
@property (weak, nonatomic) IBOutlet UIButton *lblAns;
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UILabel *lblprogressTitle;
@property (readwrite, nonatomic) NSInteger pid;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnFinish;
@property (weak, nonatomic) IBOutlet UIButton *btnOption1;
@property (weak, nonatomic) IBOutlet UIButton *btnOption2;
@property (weak, nonatomic) IBOutlet UIButton *btnOption3;
@property (weak, nonatomic) IBOutlet UIButton *btnOption4;

@property (weak, nonatomic) IBOutlet UIButton *btnhomeClicked;
@property (weak, nonatomic) IBOutlet UIProgressView *quizProgress;


- (IBAction)btnHomeClicked:(id)sender;
- (IBAction)btnNextClicked:(id)sender;
- (IBAction)btnOptionClicked:(id)sender;


@end