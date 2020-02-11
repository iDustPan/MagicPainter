//
//  ViewController.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import "ViewController.h"
#import "CanvasViewGenerator.h"
#import "Scribble.h"
#import "Stroke.h"
#import "Dot.h"


@interface ViewController ()

@property (nonatomic, weak) CanvasView *canvasView;

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;
@property (nonatomic, strong) Scribble *scribble;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.strokeColor = [UIColor blackColor];
    self.strokeSize = 4;
    
    CanvasViewGenerator *defaultGenerator = [CanvasViewGenerator new];
    [self loadCanvasViewWithGenerator:defaultGenerator];
    
    Scribble *scribble = [Scribble new];
    self.scribble = scribble;
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [self.canvasView removeFromSuperview];
    CanvasView *canvasView = [generator canvasViewWithFrame:self.view.bounds];
    [self.view addSubview:canvasView];
    self.canvasView = canvasView;
}

- (void)setScribble:(Scribble *)scribble {
    if (_scribble == scribble) { return; }
    _scribble = scribble;
    [_scribble addObserver:self
                forKeyPath:@"mark"
                   options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                   context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:Scribble.class] &&
        [keyPath isEqualToString:@"mark"]) {
        id<Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        [self.canvasView setMark:mark];
        [self.canvasView setNeedsDisplay];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = [touches.anyObject locationInView:self.canvasView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [touches.anyObject previousLocationInView:self.canvasView];
    if (CGPointEqualToPoint(lastPoint, self.startPoint)) {
        id<Mark> newStroke = [Stroke new];
        [newStroke setColor:self.strokeColor];
        [newStroke setSize:self.strokeSize];
        [self.scribble addMark:newStroke shouldAddToPreviousMark:NO];
    }
    
    CGPoint thisPoint = [touches.anyObject locationInView:self.canvasView];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    [self.scribble addMark:vertex shouldAddToPreviousMark:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [touches.anyObject previousLocationInView:self.canvasView];
    CGPoint thisPoint = [touches.anyObject locationInView:self.canvasView];
    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        Dot *singleDot = [[Dot alloc] initWithLocation:thisPoint];
        [singleDot setColor:self.strokeColor];
        [singleDot setSize:self.strokeSize];
        [self.scribble addMark:singleDot shouldAddToPreviousMark:NO];
    }
    self.startPoint = CGPointZero;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = CGPointZero;
}

@end
