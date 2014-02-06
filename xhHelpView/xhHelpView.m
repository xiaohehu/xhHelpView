//
//  xhHelpView.m
//  xhHelpView
//
//  Created by Xiaohe Hu on 2/5/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import "xhHelpView.h"
#import "embSimpleScrollView.h"
@interface xhHelpView ()

@property (nonatomic, strong) NSArray           *arr_imageData;
@property (nonatomic, strong) UILabel           *uil_helpText;
@property (nonatomic, strong) NSDictionary      *dict_helpBoxData;
@end

@implementation xhHelpView

@synthesize dictKey = _dictKey;
//@synthesize frameValue = _frameValue;
@synthesize uiv_detailInfo = _uiv_detailInfo;
@synthesize str_helpText = _str_helpText;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
			[self getData];
		});
        
    }
    return self;
}


-(void)getData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"helpBoxes" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    _dict_helpBoxData = [dict objectForKey:_dictKey];
    [self updateHelpBox:_dict_helpBoxData];
}

-(void)updateHelpBox:(NSDictionary *) dict_data
{
    _uil_helpText = [[UILabel alloc] initWithFrame:self.bounds];
    _uil_helpText.text = [dict_data objectForKey:@"text"];
    _uil_helpText.backgroundColor = [UIColor clearColor];
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
        
        UILabel *uil_tappable = [[UILabel alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
        [uil_tappable setText:@"--->"];
        uil_tappable.backgroundColor = [UIColor clearColor];
        [uil_tappable setTextAlignment:NSTextAlignmentRight];
        [self insertSubview:uil_tappable aboveSubview:_uil_helpText];
    }
}
-(void)openDetail
{
    _arr_imageData = [[NSArray alloc] initWithArray:[_dict_helpBoxData objectForKey:@"images"]];
    embSimpleScrollView *uis_images = [[embSimpleScrollView alloc] initWithFrame:self.superview.bounds closeBtnLoc:CGRectZero btnImg:nil boolBtn:NO bgImg:nil andArray:_arr_imageData andTag:1];

    
    _uiv_detailInfo = [[UIView alloc] initWithFrame:self.superview.bounds];
    _uiv_detailInfo.backgroundColor = [UIColor blueColor];
    [_uiv_detailInfo addSubview:uis_images];
    [self.superview addSubview:_uiv_detailInfo];
    UITapGestureRecognizer *tapToRemove = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeDetail)];
    tapToRemove.delegate = self;
    [_uiv_detailInfo addGestureRecognizer:tapToRemove];
}
-(void)removeDetail
{

    [_uiv_detailInfo removeFromSuperview];
    _uiv_detailInfo = nil;
    [self closeDetailView];
}
-(void)closeDetailView
{
    [self.delegate removeHelpView:self];
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
