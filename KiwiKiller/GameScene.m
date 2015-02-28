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
    float _multiplyer;
}

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:55.0f green:25.0f blue:-16.0f alpha:1.0];
        _backgroundLayer = [SKNode node];
        [self addChild:_backgroundLayer];
        
        _kiwi = [SKSpriteNode spriteNodeWithImageNamed:@"kiwifrontwalkx4.gif"];
        _kiwi.position = CGPointMake(self.size.width/2, self.size.height/2);
        [_backgroundLayer addChild:_kiwi];
        
        
        
        
        
        _multiplyer = 2.0;
        SKAction *spawnCat = [SKAction sequence:@[[SKAction performSelector:@selector(addCat) onTarget:self],
                                                  [SKAction waitForDuration:_multiplyer]]];
        [self runAction:[SKAction repeatActionForever:spawnCat]];
        

    }
    return self;
}

- (void)update:(NSTimeInterval)currentTime
{

}

- (void)didEvaluateActions
{
    [self checkCollisions];
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
    
    SKAction *move = [SKAction moveTo:CGPointMake(self.size.width/2, cat.position.y) duration:4.0];
    SKAction *seq = [SKAction sequence:@[move]];
    [cat runAction:seq];
}

- (void)checkCollisions
{
    [_backgroundLayer enumerateChildNodesWithName:@"cat" usingBlock:^(SKNode *node, BOOL *stop) {
        SKSpriteNode *cat = (SKSpriteNode *)node;
        CGRect catFrame = CGRectInset(cat.frame, 20, 20);
        if (CGRectIntersectsRect(catFrame, _kiwi.frame)) {
            [node runAction:[SKAction removeFromParent]];
            NSLog(@"Game Over");
        }
        
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:positionInScene];
    
    if ([[touchedNode name] isEqualToString:@"cat"]) {
        NSLog(@"Fingered a cat");
    }
}

@end
