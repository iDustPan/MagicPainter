//
//  Scribble.m
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"

@interface Scribble ()

@property (nonatomic, strong) id<Mark> mark;

@end

@implementation Scribble

- (instancetype)init {
    if (self = [super init]) {
        self.mark = [[Stroke alloc] init];
    }
    return self;
}

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    [self willChangeValueForKey:@"mark"];
    if (shouldAddToPreviousMark) {
        [[self.mark lastChild] addMark:aMark];
    }else{
        [self.mark addMark:aMark];
    }
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)mark {
    if (mark == self.mark) {
        return;
    }
    [self willChangeValueForKey:@"mark"];
    [self.mark removeMark:mark];
    [self didChangeValueForKey:@"mark"];
}


@end
