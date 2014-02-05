//
//  xhHelpView.m
//  xhHelpView
//
//  Created by Xiaohe Hu on 2/5/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import "xhHelpView.h"

@interface xhHelpView ()

@property (nonatomic, strong) NSArray           *arr_sectionData;
@property (nonatomic, strong) UILabel           *uil_helpText;
@end

@implementation xhHelpView

@synthesize helpName = _helpName;
@synthesize frameValue = _frameValue;
//@synthesize uiv_detailView = _uiv_detailView;
@synthesize dict_helpBoxData = _dict_helpBoxData;
@synthesize uiv_detailInfo = _uiv_detailInfo;
@synthesize str_helpText = _str_helpText;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//			[self getData];
//          [self updataHelpBox:_dict_helpBoxData];
            [self initHelpBox];
		});
        
    }
    return self;
}

-(void)updataHelpBox:(NSDictionary *)dict_data
{
    _frameValue = [dict_data objectForKey:@"frame"];
    
    NSArray *frameArray = [_frameValue componentsSeparatedByString:@", "];
    self.frame = CGRectMake([frameArray[0] floatValue], [frameArray[1] floatValue], [frameArray[2] floatValue], [frameArray[3] floatValue]);
    _uil_helpText = [[UILabel alloc] initWithFrame:self.bounds];
    _uil_helpText.text = [dict_data objectForKey:@"text"];
    _uil_helpText.textAlignment = NSTextAlignmentCenter;
    _uil_helpText.backgroundColor = [UIColor orangeColor];
    [self addSubview:_uil_helpText];
    self.userInteractionEnabled = [[dict_data objectForKey:@"interaction"] boolValue];
    
    if (self.userInteractionEnabled) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDetail)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        UILabel *uil_tappable = [[UILabel alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
        [uil_tappable setText:@"--->"];
        [uil_tappable setTextAlignment:NSTextAlignmentRight];
        [_uil_helpText addSubview: uil_tappable];
    }
//    [self.superview addSubview:self];
}
-(void)initHelpBox
{
    NSArray *frameArray = [_frameValue componentsSeparatedByString:@", "];
    self.frame = CGRectMake([frameArray[0] floatValue], [frameArray[1] floatValue], [frameArray[2] floatValue], [frameArray[3] floatValue]);
    _uil_helpText = [[UILabel alloc] initWithFrame:self.bounds];
    _uil_helpText.text = _str_helpText;
    _uil_helpText.textAlignment = NSTextAlignmentCenter;
    _uil_helpText.backgroundColor = [UIColor orangeColor];
    [self addSubview:_uil_helpText];
    
    [self checkTapple];
}

-(void)checkTapple
{
    self.userInteractionEnabled = _isTappable;
    if (_isTappable) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDetail)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        UILabel *uil_tappable = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 50, 50)];
        [uil_tappable setText:@"--->"];
        uil_tappable.backgroundColor = [UIColor redColor];
//        [uil_tappable setTextAlignment:NSTextAlignmentRight];
        [self insertSubview:uil_tappable aboveSubview:_uil_helpText];
    }
}

-(void)setIsTappable:(BOOL)tappable
{
    _isTappable = tappable;
//    [self initHelpBox];
}
//-(void)getData
//{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"helpBoxes" ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
//    _arr_sectionData = [dict objectForKey:_helpName];
//    [self updateHelpBox:_arr_sectionData];
//}
//
//-(void)updateHelpBox:(NSArray *) arr_data
//{
//    for (int i = 0; i < [arr_data count]; i++)
//    {
//        NSDictionary *dict = arr_data[i];
//        _frameValue = [dict objectForKey:@"frame"];
//
//        NSArray *frameArray = [_frameValue componentsSeparatedByString:@", "];
//        self.frame = CGRectMake([frameArray[0] floatValue], [frameArray[1] floatValue], [frameArray[2] floatValue], [frameArray[3] floatValue]);
//        _uil_helpText = [[UILabel alloc] initWithFrame:self.bounds];
//        _uil_helpText.text = [dict objectForKey:@"text"];
//        [self addSubview:_uil_helpText];
//        self.userInteractionEnabled = [[dict objectForKey:@"interaction"] boolValue];
//        
//        if (self.userInteractionEnabled) {
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDetail)];
//            tap.delegate = self;
//            [self addGestureRecognizer:tap];
//            
//            UILabel *uil_tappable = [[UILabel alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
//            [uil_tappable setText:@"--->"];
//            [uil_tappable setTextAlignment:NSTextAlignmentRight];
//            [_uil_helpText addSubview: uil_tappable];
//        }
//        [self.superview addSubview:self];
//    }
//}

-(void)openDetail
{
    UIView *detailView = [[UIView alloc] initWithFrame:self.superview.bounds];
    detailView.backgroundColor = [UIColor redColor];
    [self.superview addSubview:detailView];
    //    [self.superview addSubview:_uiv_detailInfo];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
