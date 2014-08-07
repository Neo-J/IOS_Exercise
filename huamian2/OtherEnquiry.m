//
//  OtherEnquiry.m
//  huamian2
//
//  Created by Mwave on 14-7-28.
//  Copyright (c) 2014年 Mwave. All rights reserved.
//

#import "OtherEnquiry.h"
#import "DropListItem.h"
#import "TableViewCell.h"


@interface OtherEnquiry ()

@end

@implementation OtherEnquiry{
    BOOL open;
    
    //DropListItemsArray
    NSMutableArray *_items;
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _items = [[NSMutableArray alloc]initWithCapacity:20];
    DropListItem *item;
    
    //init array items
    item = [[DropListItem alloc]init];
    item.text = @"test1";
    [_items addObject:item];
    
    item = [[DropListItem alloc]init];
    item.text = @"test2";
    [_items addObject:item];
    
    item = [[DropListItem alloc]init];
    item.text = @"test3";
    [_items addObject:item];
    
    item = [[DropListItem alloc]init];
    item.text = @"test4";
    [_items addObject:item];
    
    item = [[DropListItem alloc]init];
    item.text = @"test5";
    [_items addObject:item];
    
    self.selectBtn.layer.cornerRadius = 2.5;
    self.selectBtn.layer.borderWidth = 1.0;
    self.selectBtn.layer.borderColor = [[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1] CGColor];
    self.submitBtn.layer.cornerRadius = 2.5;
    self.closeBtn.layer.cornerRadius = 2.5;
    self.messageText.layer.borderWidth = 0.5;
    self.messageText.layer.borderColor = [[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1] CGColor];
    self.messageText.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    
    [self.delegate otherEnquiryDidCancel:self];
    
}

- (IBAction)select:(UIButton *)sender {
    if (!open) {
        [self showTableView:sender.frame];
    }else{
        [self closeTable];
    }
    
}

//- (IBAction)select:(id)sender {
//    
//    [self showTableView:sender];
//}

- (void)showTableView:(CGRect)frame{
    
    frame.origin.y += frame.size.height;
    frame.size.height = frame.size.height*5;
    UITableView* table = [[UITableView alloc]initWithFrame:frame];
    table.dataSource = self;
    table.delegate = self;
    table.layer.cornerRadius = 2.5;
    table.layer.borderColor = [[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1] CGColor];
    table.layer.borderWidth = 0.5;
    table.rowHeight = 40;
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.showTableView = table;
    [self.view addSubview:self.showTableView];
    //open flag
    open = YES;
}

- (void)closeTable{
    
    CGRect rect = self.showTableView.frame;
    rect.size.height = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.showTableView.frame = rect;
    } completion:^(BOOL finished) {
        [self.showTableView removeFromSuperview];  }];
    //[self.showTableView removeFromSuperview];
    open = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"TableViewCell";
    //identify cell
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
    }
    
    DropListItem *item = [_items objectAtIndex:indexPath.row];
    cell.titleLable.text = item.text;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    DropListItem *item = [_items objectAtIndex:indexPath.row];

    self.selectBtn.titleLabel.text = item.text;
    [self.selectBtn setTitle:item.text forState:self.selectBtn.highlighted];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self closeTable];
}

- (void)textViewDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up: YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //[self.messageText resignFirstResponder];
    [self.messageText endEditing:YES];
}

- (void)textViewDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up: NO];
}

- (void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}

@end
