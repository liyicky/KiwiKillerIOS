//
//  GameScene.m
//  KiwiKiller
//
//  Created by Jason Cheladyn on 2/21/15.
//  Copyright (c) 2015 Jason Cheladyn. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
{
    SKSpriteNode *_kiwi;
}

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        
        _kiwi = [SKSpriteNode spriteNodeWithImageNamed:@"kiwifrontwalkx4.gif"];
        _kiwi.position = CGPointMake(50, 50);
        [self addChild:_kiwi];
    }
    return self;
}

@end
