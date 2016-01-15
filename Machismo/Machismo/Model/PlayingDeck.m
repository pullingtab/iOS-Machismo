//
//  PlayingDeck.m
//  Hello world
//
//  Created by 爽 张 on 16/1/10.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import "PlayingDeck.h"
#import "PlayingCard.h"

@implementation PlayingDeck
-(instancetype)init{
    if (self=[super init]) {
        for (NSString* suit in [PlayingCard validSuit]) {
            for (int rank=1; rank<=[PlayingCard maxRank]; ++rank) {
                PlayingCard* card = [[PlayingCard alloc] init];
                
                [card setSuit:suit];
                [card setRank:rank];
                
                [self addCard:card];
            }
        }
    }
    
    return self;
}
@end
