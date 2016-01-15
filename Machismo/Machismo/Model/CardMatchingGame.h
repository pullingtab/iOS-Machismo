//
//  CardMatchingGame.h
//  Machismo
//
//  Created by 爽 张 on 16/1/14.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck;
@class Card;

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck*)deck;

-(void)chooseCardAtIndex: (NSUInteger)index;
-(Card*)cardAtIndex: (NSUInteger)index;

@property (nonatomic, readonly) NSUInteger score;

@end
