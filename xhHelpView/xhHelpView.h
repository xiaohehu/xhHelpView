//
//  xhHelpView.h
//  xhHelpView
//
//  Created by Xiaohe Hu on 2/5/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xhHelpView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSString          *helpName;
@property (nonatomic, strong) NSString          *frameValue;
@property (nonatomic)         BOOL              isTappable;
//@property (nonatomic, strong) UIView            *uiv_detailView;
@property (nonatomic, strong) UIView            *uiv_detailInfo;
@property (nonatomic, strong) NSString          *str_helpText;

-(void)setIsTappable:(BOOL)tappable;
@end
