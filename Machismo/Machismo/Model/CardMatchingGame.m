//
//  CardMatchingGame.m
//  Machismo
//
//  Created by 爽 张 on 16/1/14.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic) NSMutableArray* cards;

@end

@implementation CardMatchingGame

-(NSMutableArray*) cards{
    if (! _cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck*)deck{
    if (self = [super init]) {
        _score = 0;
        for (int i = 0; i < count; ++i) {
            Card* card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(void)chooseCardAtIndex: (NSUInteger)index{
    if (index < [self.cards count]) {
        Card* card = self.cards[index];
        
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card* otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore ) {
                        self.score += matchScore;
                        card.matched = YES;
                        otherCard.matched = YES;
                        break;
                    } else {
                        self.score -= 2;
                        otherCard.chosen = NO;
                    }
                }
            }
            card.chosen = YES;
            self.score -= 1;
        }
    }
}

-(Card*)cardAtIndex: (NSUInteger)index{
    Card* card = nil;
    if (index < [self.cards count]) {
        card = self.cards[index];
    }
    
    return card;
}

@end
