//
//  CreditCardVerificationView.h
//  huamian2
//
//  Created by Mwave on 14-7-25.
//  Copyright (c) 2014年 Mwave. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class CreditCardVerificationView;

@protocol CreditCardVerificationViewDelegate <NSObject>

- (void) creditCardVerificationViewDidCancel:(CreditCardVerificationView*)controller;

@end

@interface CreditCardVerificationView : UIViewController <CreditCardVerificationViewDelegate>

@property (nonatomic,weak) id<CreditCardVerificationViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

-(IBAction)cancelView:(id)sender;

@end
