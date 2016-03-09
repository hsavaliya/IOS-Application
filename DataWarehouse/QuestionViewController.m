//
//  QuestionViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/14/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "QuestionViewController.h"
#import "AppDelegate.h"
@interface QuestionViewController ()

@end

@implementation QuestionViewController
{
    AppDelegate *_appDelegate;
    quiz *_quiz;
}


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
   // _pid=1;
   
    _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    _quiz =[[quiz alloc]init];
    if(_appDelegate.qsncounter<=0){
        _appDelegate._arrQuiz=[_appDelegate getQuiz:_pid];
    }
    if (_appDelegate._arrQuiz!=nil)
    {
        _quiz = [_appDelegate._arrQuiz objectAtIndex:_appDelegate.qsncounter];
        _lblQuestion.text=_quiz.question;
        _lblOption1.text = _quiz.option1;
        _lblOption2.text = _quiz.option2;
        _lblOption3.text = _quiz.option3;
        _lblOption4.text = _quiz.option4;
        
        [_btnOption1 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
        [_btnOption2 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
        [_btnOption3 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
        [_btnOption4 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
        
        _appDelegate.qsncounter++;
        
    }
   
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    double progresscounter=_appDelegate.qsncounter*1.0/([_appDelegate._arrQuiz count]*1.0);
    _quizProgress.progress=progresscounter;
    
    self.navigationController.navigationBarHidden=TRUE;
    self.lblprogressTitle.text =[NSString stringWithFormat:@"%ld of %ld",(long)_appDelegate.qsncounter,(unsigned long)[_appDelegate._arrQuiz count]];
    
    if(_appDelegate.qsncounter == [_appDelegate._arrQuiz count])
    {
        [_btnFinish setEnabled:FALSE];
        [_btnNext setHidden:TRUE];
        [_btnFinish setHidden:FALSE];
    }
    else
    {
        [_btnNext setEnabled:FALSE];
        [_btnFinish setHidden:TRUE];
        [_btnNext setHidden:FALSE];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (IBAction)btnHomeClicked:(id)sender {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (IBAction)btnNextClicked:(id)sender {
    
    
}

- (IBAction)btnOptionClicked:(id)sender {
    
    UIButton *button = (UIButton *)sender;
   /*
    _lblOption1.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    _lblOption2.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    _lblOption3.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    _lblOption4.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    
    
    switch(button.tag)
    {
        case 1:
            if(_quiz.answer==button.tag)
                _lblOption1.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
            else
                _lblOption1.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
        case 2:
            if(_quiz.answer==button.tag)
                _lblOption2.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
            else
                _lblOption2.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
        case 3:
            if(_quiz.answer==button.tag)
                _lblOption3.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
            else
                _lblOption3.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
        case 4:
            if(_quiz.answer==button.tag)
                _lblOption4.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
            else
                _lblOption4.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
    }
    */
    
    
    [_btnOption1 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
    [_btnOption2 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
    [_btnOption3 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
    [_btnOption4 setImage:[UIImage imageNamed:@"radioOuter.png"] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"radioInner.png"] forState:UIControlStateNormal];
    
    
    
    //save quiz information
    _quiz.mypoll=button.tag;
    [_appDelegate._arrQuiz replaceObjectAtIndex:_appDelegate.qsncounter-1 withObject:_quiz];
    
    if(_appDelegate.qsncounter == [_appDelegate._arrQuiz count])
        [_btnFinish setEnabled:TRUE];
    else
        [_btnNext setEnabled:TRUE];
    
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"ShowQuizQsn"]) {
       // NSIndexPath *indexPath = [tableView indexPathForSelectedRow];
        QuestionViewController *destViewController = segue.destinationViewController;
        
        destViewController.pid=_pid;
        _appDelegate.qsncounter++;
        if(_appDelegate.qsncounter>=[_appDelegate._arrQuiz count])
        {
            //seque.destinationViewController
            
            sleep(1);
        }
        else
        {
            //open same page;
        }
        
    }
    
    
}



@end
