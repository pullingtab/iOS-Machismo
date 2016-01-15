//
//  Deck.m
//  Hello world
//
//  Created by 爽 张 on 16/1/9.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property(nonatomic, strong) NSMutableArray* cards;
@end

@implementation Deck

-(instancetype)init{
    if(self = [super init]){
        _cards = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addCard:(Card*)card atTop:(BOOL)atTop{
    if(atTop)
        [[self cards] insertObject:card atIndex:0];
    else
        [[self cards] addObject:card];
}

-(void)addCard:(Card*)card{
    [self addCard:card atTop:NO];
}

-(Card*)drawRandomCard{
    Card* card = nil;
    if ([self.cards count]) {
        unsigned int index = arc4random()%[self.cards count];
        card = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return card;
}
@end
