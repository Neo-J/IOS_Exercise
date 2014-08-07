//
//  ViewController.m
//  huamian2
//
//  Created by Mwave on 14-7-25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "CreditCardVerificationView.h"
#import "OtherEnquiry.h"
#import "Shadow.h"

@interface ViewController (){
    //subview1
    CreditCardVerificationView *myView;
    //subview2
    OtherEnquiry *myView2;
    //shadow
    Shadow *shadowView;
    
    CGRect workSpaceRect;
    NSInteger myViewWidth,myViewHeight;
    UIScrollView *viewScroll;
    UIImageView *imgView;

}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addScrollView];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.showSubviewbtn.layer.cornerRadius = 2.5;
    
    workSpaceRect = [[UIScreen mainScreen]applicationFrame];
    myViewWidth = workSpaceRect.size.width - 20;
    myViewHeight = 425;
    
}

-(void)addScrollView{
    viewScroll = [[UIScrollView alloc]initWithFrame:
                    CGRectMake(20, 200, 280, 420)];
    imgView = [[UIImageView alloc]initWithImage:
               [UIImage imageNamed:@"testImg.png"]];
    [viewScroll addSubview:imgView];
    viewScroll.contentSize = CGSizeMake(imgView.frame.size.width,
                                          imgView.frame.size.height);
    viewScroll.userInteractionEnabled = NO;
    viewScroll.delegate = self;
    [self.view addSubview:viewScroll];
}

//************addSubview button start********************
- (IBAction)showSubview:(id)sender{
    //[self.view addSubview:myView.view];
    shadowView = [[Shadow alloc]init];
    shadowView.view.alpha = 0;
    myView = [[CreditCardVerificationView alloc]init];
    myView.delegate = self;
    myView.view.frame = CGRectMake(10, 568, myViewWidth , myViewHeight);
    
    [self.view addSubview:shadowView.view];
    [UIView animateWithDuration:0.6 animations:^{shadowView.view.alpha = 0.5;} completion:nil];
    CGPoint point = myView.view.center;
    point.y -= 489;
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{myView.view.center =point;} completion:nil];
    [self.view addSubview:myView.view];
    [UIView commitAnimations];
    
}

- (IBAction)showSubview2:(id)sender {
    shadowView = [[Shadow alloc]init];
    shadowView.view.alpha = 0;
    myView2 = [[OtherEnquiry alloc]init];
    myView2.delegate = self;
    myView2.view.frame = CGRectMake(10, 568, myViewWidth , myViewHeight);
    
    [self.view addSubview:shadowView.view];
    [UIView animateWithDuration:0.6 animations:^{shadowView.view.alpha = 0.5;} completion:nil];
    CGPoint point = myView2.view.center;
    point.y -= 489;
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{myView2.view.center =point;} completion:nil];
    [self.view addSubview:myView2.view];
    [UIView commitAnimations];

}
//*************addSubview button end*********************

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//*************CancelSubview delegate start***************
- (void)creditCardVerificationViewDidCancel:(CreditCardVerificationView *)controller{
    
    CGPoint point = controller.view.center;
    point.y += 489;
    [UIView animateWithDuration:0.6 animations:^{
        controller.view.center =point;
    } completion:^(BOOL finished) {
        [controller.view removeFromSuperview];    }];
   // [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{controller.view.center =point;} completion:^{[controller.view removeFromSuperview];}];
    [UIView animateWithDuration:0.6 animations:^{
        shadowView.view.alpha = 0;
    }completion:^(BOOL finished) {
        [shadowView.view removeFromSuperview];     }];
    [UIView commitAnimations];
   
}
- (void)otherEnquiryDidCancel:(OtherEnquiry *)controller{
    
    CGPoint point = controller.view.center;
    point.y += 489;
    [UIView animateWithDuration:0.6 animations:^{
        controller.view.center =point;
    } completion:^(BOOL finished) {
        [controller.view removeFromSuperview];    }];
    // [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{controller.view.center =point;} completion:^{[controller.view removeFromSuperview];}];
    [UIView animateWithDuration:0.6 animations:^{
        shadowView.view.alpha = 0;
    }completion:^(BOOL finished) {
        [shadowView.view removeFromSuperview];     }];
    [UIView commitAnimations];
    
}
//*************CancelSubview delegate end***************

//ScrollView Delegate function
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imgView;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did end decelerating");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
     //   NSLog(@"Did scroll");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    NSLog(@"Did end dragging");
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did begin decelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"Did begin dragging");
}

@end
