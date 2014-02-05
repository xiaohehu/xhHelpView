//
//  xhHelpData.h
//  xhHelpView
//
//  Created by Xiaohe Hu on 2/5/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xhHelpData : NSObject
{
    NSString    *frame;
    NSString    *helpText;
//    BOOL        *interaction;
}
@property (nonatomic) BOOL interaction;

-(void)setFrame:(NSString*)frame;
-(NSString*)frame;

-(void)setHelpText:(NSString *)helpText;
-(NSString*)helpText;

-(void)setInteraction:(BOOL)interact;
@end
