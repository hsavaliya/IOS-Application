//
//  QsnReviewViewController.m
//  DataWarehouse
//
//  Created by Hetal Savaliya on 9/18/14.
//  Copyright (c) 2014 Hetal Savaliya. All rights reserved.
//

#import "QsnReviewViewController.h"
#import "AppDelegate.h"

@interface QsnReviewViewController ()

@end

@implementation QsnReviewViewController
{
    AppDelegate *appDelegate;
}
@synthesize selectedQuestion;

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    quiz *_quiz=[appDelegate._arrQuiz objectAtIndex:selectedQuestion];
    
    _lblQsn.text=_quiz.question;
    _lblOption1.text = _quiz.option1;
    _lblOption2.text = _quiz.option2;
    _lblOption3.text = _quiz.option3;
    _lblOption4.text = _quiz.option4;
    
    _lblOption1.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    _lblOption2.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    _lblOption3.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    _lblOption4.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    
    switch(_quiz.mypoll)
    {
        case 1:
            if(_quiz.answer==_quiz.mypoll)
                _lblOption1.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
            else
                _lblOption1.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
        case 2:
            if(_quiz.answer==_quiz.mypoll)
                _lblOption2.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
            else
                _lblOption2.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
        case 3:
            if(_quiz.answer==_quiz.mypoll)
                _lblOption3.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
            else
                _lblOption3.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
        case 4:
            if(_quiz.answer==_quiz.mypoll)
                _lblOption4.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
            else
                _lblOption4.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
            break;
    }
    UIImage *image = [UIImage imageNamed:@"correct_icon.png"];
    switch(_quiz.answer)
    {
        case 1:
            _lblOption1.textColor = [UIColor greenColor];
            [_btnOption1 setImage:image forState:UIControlStateNormal];
            break;
        case 2:
            _lblOption2.textColor = [UIColor greenColor];
            [_btnOption2 setImage:image forState:UIControlStateNormal];
            break;
        case 3:
            _lblOption3.textColor = [UIColor greenColor];
            [_btnOption3 setImage:image forState:UIControlStateNormal];
            break;
        case 4:
            _lblOption4.textColor = [UIColor greenColor];
            [_btnOption4 setImage:image forState:UIControlStateNormal];
            break;
            
    }
    /*
    switch(_quiz.mypoll)
    {
        case 1:
            _lblOption1.textColor = [UIColor redColor];
            break;
        case 2:
            _lblOption2.textColor = [UIColor redColor];
            break;
        case 3:
            _lblOption3.textColor = [UIColor redColor];
            break;
        case 4:
            _lblOption4.textColor = [UIColor redColor];
            break;
    }
    UIImage *image = [UIImage imageNamed:@"correct_icon.png"];
    switch(_quiz.answer)
    {
        case 1:
            _lblOption1.textColor = [UIColor greenColor];
            [_btnOption1 setImage:image forState:UIControlStateNormal];
            break;
        case 2:
            _lblOption2.textColor = [UIColor greenColor];
            [_btnOption2 setImage:image forState:UIControlStateNormal];
            break;
        case 3:
            _lblOption3.textColor = [UIColor greenColor];
            [_btnOption3 setImage:image forState:UIControlStateNormal];
            break;
        case 4:
            _lblOption4.textColor = [UIColor greenColor];
            [_btnOption4 setImage:image forState:UIControlStateNormal];
            break;
            
    }*/
    
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

- (IBAction)btnCancelClicked:(id)sender {
    //[self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
