//
//  Stroke.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import "Stroke.h"

@interface Stroke ()

@property (nonatomic, strong) NSMutableArray<id<Mark>> *children;

@end

@implementation Stroke

@synthesize location;
@synthesize size;
@synthesize color;
@synthesize count;
@synthesize lastChild;

- (void)setLocation:(CGPoint)location {}

- (CGPoint)location {
    if (self.children.count > 0) {
        return self.children.firstObject.location;
    }
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark {
    [self.children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    if ([self.children containsObject:mark]) {
        [self.children removeObject:mark];
    }else{
        [self.children makeObjectsPerformSelector:@selector(removeMark:)
                                       withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSInteger)index {
    if (index <= self.children.count) {
        return [self.children objectAtIndex:index];
    }
    return nil;
}

- (id<Mark>)lastChild {
    return self.children.lastObject;
}

- (NSInteger)count {
    return self.children.count;
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    for (id<Mark> childMark in self.children) {
        [childMark acceptMarkVisitor:visitor];
    }
    [visitor visitStroke:self];
}

- (void)drawWithContext:(CGContextRef)context {
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    for (id<Mark> mark in self.children) {
        [mark drawWithContext:context];
    }
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextSetLineWidth(context, self.size);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
}

- (NSMutableArray *)children {
    if (!_children) {
        _children = [NSMutableArray arrayWithCapacity:1];
    }
    return _children;
}


@end
