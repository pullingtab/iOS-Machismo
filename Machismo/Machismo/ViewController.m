//
//  ViewController.m
//  Machismo
//
//  Created by 爽 张 on 16/1/10.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import "ViewController.h"
#import "PlayingDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) unsigned int flipCount;
@property (nonatomic, strong) Deck* deck;
@property (nonatomic) CardMatchingGame* game;

@end

@implementation ViewController

- (CardMatchingGame*) game{
    if (!_game) {
        _game = [[CardMatchingGame alloc]
                 initWithCardCount:[self.cardButtons count]
                 usingDeck:self.deck];
    }
    
    return _game;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFlipCount:(unsigned int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount = %d", self.flipCount);
}

- (Deck*) deck{
    if (! _deck) {
        _deck = [self createDeck];
    }
    
    return _deck;
}

- (Deck*) createDeck{
    return [[PlayingDeck alloc] init];
}

- (IBAction)touchCard:(UIButton *)sender {
//    // front -> back
//    if ([[sender currentTitle] length]) {
//        UIImage* cardImage = [UIImage imageNamed:@"cardback"];
//        [sender setBackgroundImage:cardImage
//                          forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//        self.flipCount++;
//    }
//    // back -> front
//    else{
//        Card* card = [self.deck drawRandomCard];
//        
//        //flip the card
//        if (card){
//            UIImage* cardImage = [UIImage imageNamed:@"cardfront"];
//            [sender setBackgroundImage:cardImage
//                              forState:UIControlStateNormal];
//            [sender setTitle:card.contents forState:UIControlStateNormal];
//            self.flipCount++;
//        }
//    }
//    
    [self.game chooseCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

-(void) updateUI{
    for (UIButton* cardButton in self.cardButtons) {
        NSUInteger index = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:index];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        [cardButton setEnabled:!card.isMatched];
    }
}

-(NSString*) titleForCard: (Card*) card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage*) backgroundImageForCard: (Card*) card{
    UIImage* backgroundImage = nil;
    backgroundImage = [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
    
    return backgroundImage;
}

@end
