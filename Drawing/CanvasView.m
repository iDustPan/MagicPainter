//
//  CanvasView.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRender.h"

@implementation CanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    MarkRender *render = [[MarkRender alloc] initWithCGContext:context];
    [self.mark acceptMarkVisitor:render];
}

@end
