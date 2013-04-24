//
//  Grafico.m
//  RTA
//
//  Created by Edson Teco on 22/04/13.
//  Copyright (c) 2013 EdsonTeco. All rights reserved.
//

#import "GraficEq.h"

@implementation GraficEq

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.bands = DEFAULT_BANDS;
        self.barColor = [UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];
    }
    return self;
}

- (void)updateFFT:(float*)freq
{
    for (int i=0; i<FFT_LENGTH; i++) {
        fft[i] = freq[i];
    }
}

- (void)drawRect:(CGRect)rect
{
    int banda, y, x = 0;
    int b0 = 0, b1;
    float peak;
    float barWidth = self.frame.size.width/(self.bands);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, barWidth-(barWidth*0.15));
    [self.barColor setStroke];
    
    for (banda=0; banda<self.bands; banda++) {
        
        peak = 0;
        b1 = pow(2, banda*10.0/(self.bands-1));
        if (b1 > (FFT_LENGTH-1)) b1 = (FFT_LENGTH-1);
        if (b1 <= b0) b1 = b0 + 1;
        for (; b0<b1; b0++)
            if (peak < fft[1+b0]) peak = fft[1+b0];
        
        y = sqrt(peak) * 3 * self.frame.size.height-4; // scale it (sqrt to make low values more visible)
        if (y > self.frame.size.height) y = self.frame.size.height; // cap it
        
        x = x + barWidth;
        
        CGContextMoveToPoint(context, x, self.frame.size.height);
        CGContextAddLineToPoint(context, x, self.frame.size.height - y);
        CGContextStrokePath(context);
        CGContextMoveToPoint(context, x, self.frame.size.height);
        CGContextAddLineToPoint(context, x, self.frame.size.height - 2);
        CGContextStrokePath(context);
    }
}

@end
