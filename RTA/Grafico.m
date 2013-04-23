//
//  Grafico.m
//  RTA
//
//  Created by Edson Teco on 22/04/13.
//  Copyright (c) 2013 EdsonTeco. All rights reserved.
//

#import "Grafico.h"

@implementation Grafico

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)updateFFT:(float*)freq
{
    for (int i=0; i<1024; i++) {
        fft[i] = freq[i];
    }
}

- (void)drawRect:(CGRect)rect
{
    int banda, y, x = 0;
    int b0 = 0, b1;
    float peak;
    
    for (banda=0; banda<BANDS; banda++) {
        
        peak = 0;
        b1 = pow(2, banda*10.0/(BANDS-1));
        if (b1 > 1023) b1 = 1023;
        if (b1 <= b0) b1 = b0 + 1;
        for (; b0<b1; b0++) {
            if (peak < fft[1+b0]) {
                peak = fft[1+b0];   
            }
        }
        
        y = sqrt(peak) * 3 * SPECHEIGHT-4; // scale it (sqrt to make low values more visible)
        if (y > SPECHEIGHT) y = SPECHEIGHT; // cap it
        
        x = x + SPECWIDTH/BANDS;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        // linha preta - limpar barras anteriores
        CGContextSetLineWidth(context, SPECWIDTH/BANDS);
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(context, x, 0);
        CGContextAddLineToPoint(context, x, SPECHEIGHT);
        CGContextStrokePath(context);
        // linha azul
        CGContextSetLineWidth(context, (SPECWIDTH/BANDS)-((SPECWIDTH/BANDS)*0.15));
        CGContextSetRGBStrokeColor(context, 0.6, 0.7, 1.0, 1.0);
        CGContextMoveToPoint(context, x, SPECHEIGHT);
        CGContextAddLineToPoint(context, x, SPECHEIGHT - y);
        CGContextStrokePath(context);
    }
}


@end
