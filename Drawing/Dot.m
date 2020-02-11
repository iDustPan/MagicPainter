//
//  Dot.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import "Dot.h"

@interface Dot ()

@end

@implementation Dot

@synthesize location;
@synthesize size;
@synthesize color;

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitDot:self];
}

- (void)drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x - frameSize * .5f,
                              y - frameSize * .5f,
                              frameSize,
                              frameSize);
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextFillEllipseInRect(context, frame);
}

@end
