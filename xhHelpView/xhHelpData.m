//
//  xhHelpData.m
//  xhHelpView
//
//  Created by Xiaohe Hu on 2/5/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import "xhHelpData.h"

@implementation xhHelpData
@synthesize interaction = _interaction;

- (id)init {
    self = [super init];
    if (self) {
		// Delay execution of my block for 0.1 seconds.
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//			[self postEmail];
		});
    }
    return self;
}

-(void)setFrame:(NSString *)_frame
{
    frame = _frame;
}
-(NSString*)frame
{
    return  frame;
}

-(void)setHelpText:(NSString *)_helpText
{
    helpText = _helpText;
}
-(NSString*)helpText
{
    return helpText;
}

-(void)setInteraction:(BOOL)interact
{
    _interaction = interact;
}

-(void)postHelpBox
{
    NSMutableDictionary *dict_helpData = [[NSMutableDictionary alloc] initWithObjectsAndKeys:frame, @"Frame", helpText, @"Text", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"helpBoxData" object:dict_helpData];
}
@end
