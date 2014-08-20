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
    UIPageControl *pgControll;
    UIImageView *imgView;

}

@end

@implementation ViewController

@synthesize slideImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
    slideImages = [[NSMutableArray alloc] init];
    [slideImages addObject:@"1-1.jpg"];
    [slideImages addObject:@"1-2.jpg"];
    [slideImages addObject:@"1-3.jpg"];
    [slideImages addObject:@"1-4.jpg"];
    [slideImages addObject:@"testImg.png"];
    [self addScrollView];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.showSubviewbtn.layer.cornerRadius = 2.5;
    
    workSpaceRect = [[UIScreen mainScreen]applicationFrame];
    myViewWidth = workSpaceRect.size.width - 20;
    myViewHeight = 425;
    
}

-(void)addScrollView{
    viewScroll = [[UIScrollView alloc]initWithFrame:
                    CGRectMake(0, 200, self.view.bounds.size.width, 320)];
    //scrollview setting
    [viewScroll setBackgroundColor:[UIColor blackColor]];
    viewScroll.showsHorizontalScrollIndicator=NO;
    viewScroll.showsVerticalScrollIndicator=NO;
    viewScroll.delegate = self;
    viewScroll.pagingEnabled = YES;
    viewScroll.userInteractionEnabled = YES;
    [self.view addSubview:viewScroll];
    
    pgControll = [[UIPageControl alloc]initWithFrame:CGRectMake(120, 500, 100, 18)];
    //pagecontroll setting
    [pgControll setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [pgControll setBackgroundColor:[UIColor blackColor]];
    [pgControll setPageIndicatorTintColor:[UIColor whiteColor]];
    pgControll.numberOfPages = [self.slideImages count];
    pgControll.currentPage = 0;
    [pgControll addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pgControll];
    
    //create imageview
    for (int i = 0; i<[slideImages count]; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:i]]];
        imageView.frame = CGRectMake((320 * i) + 320, 0, self.view.bounds.size.width, 320);
        [viewScroll addSubview:imageView];
    }
    
    UIImageView *imgView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:([slideImages count]-1)]]];
    imgView1.frame = CGRectMake(0, 0, 320, 320);
    [viewScroll addSubview:imgView1];
    imgView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:0]]];
    imgView1.frame = CGRectMake((320 * ([slideImages count] + 1)) , 0, 320, 320); // 添加第1页在最后 循环
    [viewScroll addSubview:imgView1];
    
    [viewScroll setContentSize:CGSizeMake(320 * ([slideImages count] + 2), 320)]; //  +上第1页和第4页  原理：4-[1-2-3-4]-1
    [viewScroll setContentOffset:CGPointMake(0, 0)];
    [viewScroll scrollRectToVisible:CGRectMake(320,0,320,320) animated:NO]; // 默认从序号1位置放第1页 ，序号0位置位置放第4页

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
//-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    return imgView;
//}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"Did end decelerating");
//    if(scrollView==viewScroll){
//        
//        CGPoint offset = scrollView.contentOffset;
//        pgControll.currentPage = offset.x / (self.view.bounds.size.width);
//        [viewScroll setContentOffset:CGPointMake(self.view.bounds.size.width * (pgControll.currentPage),viewScroll.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
//    }
//}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//     //   NSLog(@"Did scroll");
//}
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
//                 willDecelerate:(BOOL)decelerate{
//    NSLog(@"Did end dragging");
//}
//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"Did begin decelerating");
//}
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"Did begin dragging");
//}
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pagewidth = viewScroll.frame.size.width;
    int page = floor((viewScroll.contentOffset.x - pagewidth/([slideImages count]+2))/pagewidth)+1;
    page --;  // 默认从第二页开始
    pgControll.currentPage = page;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = viewScroll.frame.size.width;
    int currentPage = floor((viewScroll.contentOffset.x - pagewidth/ ([slideImages count]+2)) / pagewidth) + 1;
    //    int currentPage_ = (int)self.scrollView.contentOffset.x/320; // 和上面两行效果一样
    //    NSLog(@"currentPage_==%d",currentPage_);
    if (currentPage==0)
    {
        [viewScroll scrollRectToVisible:CGRectMake(320 * [slideImages count],0,320,460) animated:NO]; // 序号0 最后1页
    }
    else if (currentPage==([slideImages count]+1))
    {
        [viewScroll scrollRectToVisible:CGRectMake(320,0,320,460) animated:NO]; // 最后+1,循环第1页
    }
}


// pagecontrol 选择器的方法
- (void)turnPage
{
    NSInteger page = pgControll.currentPage; // 获取当前的page
    [viewScroll scrollRectToVisible:CGRectMake(320*(page+1),0,320,460) animated:NO]; // 触摸pagecontroller那个点点 往后翻一页 +1
}

@end
