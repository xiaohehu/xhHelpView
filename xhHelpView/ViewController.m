//
//  ViewController.m
//  xhHelpView
//
//  Created by Xiaohe Hu on 2/5/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import "ViewController.h"
#import "xhHelpView.h"
#import "xhHelpData.h"
@interface ViewController ()
@property (nonatomic, strong) xhHelpData        *recieveData;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    xhHelpView *helpView = [[xhHelpView alloc] initWithFrame:CGRectZero];
    helpView.helpName = @"Fenway";
    helpView.backgroundColor = [UIColor greenColor];
    UIView *detailView = [[UIView alloc] initWithFrame:self.view.bounds];
    detailView.backgroundColor = [UIColor yellowColor];
    helpView.uiv_detailInfo = detailView;
    [self.view addSubview: helpView];
    
    xhHelpView *helpView2 = [[xhHelpView alloc] initWithFrame:CGRectZero];
    helpView2.helpName = @"Building";
    helpView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview: helpView2];
//    [self addHelpBox];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getHelpBoxData:) name:@"emailData" object:nil];
//    [self addHelpBox];
}

//-(void)addHelpBox
//{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"helpBoxes" ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
//    NSArray *arr_section = [[NSArray alloc] initWithArray:[dict objectForKey:@"Fenway"]];
//    UIView *detailView = [[UIView alloc] initWithFrame:self.view.bounds];
//    detailView.backgroundColor = [UIColor greenColor];
//    for (int i = 0; i < [arr_section count]; i++) {
//        xhHelpView *helpView = [[xhHelpView alloc] initWithFrame:CGRectZero];
//        helpView.dict_helpBoxData = arr_section[i];
//        helpView.uiv_detailInfo = detailView;
//        [self.view addSubview:helpView];
//    }
//}

//-(void)getHelpBoxData:(NSNotification *)pNorification
//{
//    _recieveData = (xhHelpData *)[pNorification object];
//}
//-(void)addHelpBox
//{
//    _recieveData = [[xhHelpData alloc] init];
//    _recieveData.frame = @"100, 100, 200, 200";
//    _recieveData.helpText = @"This is help Box 1";
//    _recieveData.interaction = YES;
//    xhHelpView *helpView = [[xhHelpView alloc] initWithFrame:CGRectZero];
//    [helpView setIsTappable:_recieveData.interaction];
//    helpView.frameValue = _recieveData.frame;
//    helpView.str_helpText = _recieveData.helpText;
////    helpView.isTappable = _recieveData.interaction;
//    helpView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:helpView];
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
