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
    SKNode *_backgroundLayer;
}

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        _backgroundLayer = [SKNode node];
        [self addChild:_backgroundLayer];
        
        
        _kiwi = [SKSpriteNode spriteNodeWithImageNamed:@"kiwifrontwalkx4.gif"];
        _kiwi.position = CGPointMake(self.size.width/2, self.size.height/2);
        [_backgroundLayer addChild:_kiwi];
        
        [self addCat];
    }
    return self;
}

- (void)update:(NSTimeInterval)currentTime
{
    
}

- (void)addCat
{
    SKSpriteNode *cat = [SKSpriteNode spriteNodeWithImageNamed:@"catrunx4.gif"];
    CGPoint catScreenPosition = CGPointMake(100, self.size.height/2);
    cat.position = [_backgroundLayer convertPoint:catScreenPosition fromNode:self];
    cat.xScale = 1;
    cat.yScale = 1;
    cat.name = @"cat";
    [_backgroundLayer addChild:cat];
    
    SKAction *remove = [SKAction removeFromParent];
    SKAction *move = [SKAction moveTo:CGPointMake(self.size.width/2, cat.position.y) duration:4.0];
    SKAction *seq = [SKAction sequence:@[move, remove]];
    [cat runAction:seq];
}

@end
