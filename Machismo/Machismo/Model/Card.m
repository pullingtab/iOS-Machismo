//
//  Card.m
//  Hello world
//
//  Created by 爽 张 on 16/1/9.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize contents;
@synthesize chosen;
@synthesize matched;

- (int) match:(NSArray*)otherCards{
    int score = -0;
    
    for (Card* card in otherCards) {
        if([[card contents] isEqualToString:[self contents]])
            score = 1;
    }
    
    return score;
}

@end
