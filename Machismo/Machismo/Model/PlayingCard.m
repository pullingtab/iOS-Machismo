//
//  PlayingCard.m
//  Hello world
//
//  Created by 爽 张 on 16/1/10.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import "PlayingCard.h"

//char* rankStrings[] = {"?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"};


@implementation PlayingCard
-(NSString*)contents{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuit] containsObject:suit])
        _suit = suit;
}

+(NSArray*) rankStrings{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSArray*) validSuit{
    return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}

+(NSUInteger) maxRank{
    return [[PlayingCard rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (int) match:(NSArray*)otherCards{
    int score = -0;
    
    for (PlayingCard* card in otherCards) {
        if([card.suit isEqualToString:self.suit])
            score += 1;
        else if (card.rank==self.rank)
            score += 4;
    }
    
    return score;
}

@end
