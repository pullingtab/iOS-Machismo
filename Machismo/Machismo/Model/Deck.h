//
//  Deck.h
//  Hello world
//
//  Created by 爽 张 on 16/1/9.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface Deck : NSObject
-(void)addCard:(Card*)card atTop:(BOOL)atTop;
-(void)addCard:(Card*)card;
-(Card*)drawRandomCard;
@end
