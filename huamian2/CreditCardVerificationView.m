//
//  CreditCardVerificationView.m
//  huamian2
//
//  Created by Mwave on 14-7-25.
//  Copyright (c) 2014年 Mwave. All rights reserved.
//

#import "CreditCardVerificationView.h"

@interface CreditCardVerificationView ()

@end

@implementation CreditCardVerificationView

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
    // Do any additional setup after loading the view from its nib.
    
    self.submitBtn.layer.cornerRadius = 2.5;
    self.cancelBtn.layer.cornerRadius = 2.5;
    
}

- (IBAction)cancelView:(id)sender{
    
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    //[self.view removeFromSuperview];
    [self.delegate creditCardVerificationViewDidCancel:self];
    /*
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view.superview cache:YES];
    [self.view removeFromSuperview];
    [UIView commitAnimations];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
