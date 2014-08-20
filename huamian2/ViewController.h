//
//  ViewController.h
//  huamian2
//
//  Created by Mwave on 14-7-25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditCardVerificationView.h"
#import "OtherEnquiry.h"

@interface ViewController : UIViewController<CreditCardVerificationViewDelegate,OtherEnquiryDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *showSubviewbtn;
@property (strong,nonatomic)NSMutableArray *slideImages;

- (IBAction)showSubview:(id)sender;
- (IBAction)showSubview2:(id)sender;

@end
