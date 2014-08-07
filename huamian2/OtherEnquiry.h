//
//  OtherEnquiry.h
//  huamian2
//
//  Created by Mwave on 14-7-28.
//  Copyright (c) 2014年 Mwave. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OtherEnquiry;

@protocol OtherEnquiryDelegate <NSObject>

- (void) otherEnquiryDidCancel:(OtherEnquiry*)controller;

@end

@interface OtherEnquiry : UIViewController<OtherEnquiryDelegate,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>

@property (nonatomic,weak) id<OtherEnquiryDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UITextView *messageText;- (IBAction)close:(id)sender;
- (IBAction)select:(UIButton *)sender;
@property (weak, nonatomic) UITableView* showTableView;
@end
