//
//  MarkRender.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/7.
//  Copyright © 2020 pan. All rights reserved.
//

#import "MarkRender.h"

@interface MarkRender ()

@property (nonatomic, assign) BOOL shouldMoveContextToDot;
@property (nonatomic, assign) CGContextRef context;

@end

@implementation MarkRender

- (instancetype)initWithCGContext:(CGContextRef)context {
    if (self = [super init]) {
        self.context = context;
        self.shouldMoveContextToDot = YES;
    }
    return self;
}

- (void)visitMark:(id)mark {}

- (void)visitDot:(Dot *)dot {
    CGFloat x = dot.location.x;
    CGFloat y = dot.location.y;
    CGFloat frameSize = dot.size;
    CGRect frame = CGRectMake(x - frameSize*.5f,
                              y - frameSize*.5f,
                              frameSize,
                              frameSize);
    CGContextSetFillColorWithColor(self.context, [dot color].CGColor);
    CGContextFillEllipseInRect(self.context, frame);
}

- (void)visitStroke:(Stroke *)stroke {
    CGContextSetStrokeColorWithColor(self.context, [stroke color].CGColor);
    CGContextSetLineCap(self.context, kCGLineCapRound);
    CGContextSetLineWidth(self.context, stroke.size);
    CGContextStrokePath(self.context);
    self.shouldMoveContextToDot = YES;
}

- (void)visitVertex:(Vertex *)vertex {
    CGFloat x = vertex.location.x;
    CGFloat y = vertex.location.y;
    if (self.shouldMoveContextToDot) {
        CGContextMoveToPoint(self.context, x, y);
        self.shouldMoveContextToDot = NO;
    }else{
        CGContextAddLineToPoint(self.context, x, y);
    }
}

@end
