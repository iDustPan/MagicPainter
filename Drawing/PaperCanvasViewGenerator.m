//
//  PaperCanvasViewGenerator.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import "PaperCanvasViewGenerator.h"

@implementation PaperCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    return [[PaperCanvasView alloc] initWithFrame:aFrame];
}

@end
