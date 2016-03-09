//
//  QsnReviewViewController.h
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/18/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "ViewController.h"

@interface QsnReviewViewController : ViewController{
    
}

@property (weak, nonatomic) IBOutlet UILabel *lblQsn;
@property (weak, nonatomic) IBOutlet UILabel *lblOption1;
@property (weak, nonatomic) IBOutlet UILabel *lblOption2;
@property (weak, nonatomic) IBOutlet UILabel *lblOption3;
@property (weak, nonatomic) IBOutlet UILabel *lblOption4;
@property (weak, nonatomic) IBOutlet UIButton *btnOption1;
@property (weak, nonatomic) IBOutlet UIButton *btnOption2;
@property (weak, nonatomic) IBOutlet UIButton *btnOption3;

@property (weak, nonatomic) IBOutlet UIButton *btnOption4;
@property (weak, nonatomic) IBOutlet UILabel *lblProgressTitle;
@property (weak, nonatomic) IBOutlet UIProgressView *quizProgress;

@property(nonatomic, readwrite)  int selectedQuestion;


- (IBAction)btnCancelClicked:(id)sender;


@end
