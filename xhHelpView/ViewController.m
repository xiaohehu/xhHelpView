//
//  ViewController.m
//  xhHelpView
//
//  Created by Xiaohe Hu on 2/5/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import "ViewController.h"
#import "xhHelpView.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray       *arr_helpViews;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _arr_helpViews = [[NSMutableArray alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
    xhHelpView *helpView1 = [[xhHelpView alloc] initWithFrame:CGRectMake(100.0, 100.0, 200.0, 200.0)];
    helpView1.isTappable = YES;
    helpView1.dictKey = @"Fenway";
    helpView1.delegate = self;
    helpView1.backgroundColor = [UIColor redColor];
    [self.view addSubview: helpView1];
    [_arr_helpViews addObject: helpView1];
    
    xhHelpView *helpView2 = [[xhHelpView alloc] initWithFrame:CGRectMake(500.0, 100.0, 200.0, 200.0)];
    helpView2.isTappable = NO;
    helpView2.dictKey = @"Building";
    helpView2.delegate = self;
    helpView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview: helpView2];
    [_arr_helpViews addObject: helpView2];
    
    xhHelpView *helpView3 = [[xhHelpView alloc] initWithFrame:CGRectMake(100.0, 500.0, 200.0, 200.0)];
    helpView3.isTappable = YES;
    helpView3.dictKey = @"Location";
    helpView3.delegate = self;
    helpView3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview: helpView3];
    [_arr_helpViews addObject: helpView3];

    [self initControlBtn];
}

-(void)initControlBtn
{
    UIButton *controlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    controlBtn.frame = CGRectMake(700.0, 600.0, 140.0, 40.0);
    [controlBtn setTitle:@"Control" forState:UIControlStateNormal];
    controlBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview: controlBtn];
    [controlBtn addTarget:self action:@selector(hide_Unhide) forControlEvents:UIControlEventTouchDown];
}

-(void)hide_Unhide
{
    for (xhHelpView *tmp in _arr_helpViews){
        if (tmp.hidden) {
            tmp.hidden = NO;
        }
        else
        {
            tmp.hidden = YES;
        }
    }
}
#pragma mark - Help View Delegate
-(void)removeHelpView:(xhHelpView *)customView
{
    if ([_arr_helpViews count] == 1)
    {
        for (xhHelpView *tmp in _arr_helpViews) {
            tmp.hidden = YES;
        }
    }
    else if ([_arr_helpViews count] > 1)
    {
        return;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
