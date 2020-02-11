//
//  Vertex.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

@synthesize location;

- (instancetype)initWithLocation:(CGPoint)location {
    if (self = [super init]) {
        self.location = location;
    }
    return self;
}

- (void)setColor:(UIColor *)color {}
- (UIColor *)color { return nil; }

- (void)setSize:(CGFloat)size {}
- (CGFloat)size { return .0f; }

- (void)addMark:(id<Mark>)mark {}
- (void)removeMark:(id<Mark>)mark {}
- (id<Mark>)childMarkAtIndex:(NSInteger)index { return nil; }
- (id<Mark>)lastChild { return nil; }
- (NSInteger)count { return 0; }

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitVertex:self];
}

- (void)drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
   
    CGContextAddLineToPoint(context, x, y);
}

@synthesize count;
@synthesize lastChild;

@end
