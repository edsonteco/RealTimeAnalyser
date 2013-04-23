//
//  Grafico.h
//  RTA
//
//  Created by Edson Teco on 22/04/13.
//  Copyright (c) 2013 EdsonTeco. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "bass.h"

#define SPECWIDTH 320	// display width
#define SPECHEIGHT 127	// height (changing requires palette adjustments too)
#define BANDS 56//28

typedef struct {
	BYTE rgbRed,rgbGreen,rgbBlue,Aplha;
} RGBQUAD;

@interface Grafico : UIView {

    float fft[1024];
    
    CGContextRef specdc;
    DWORD specbuf[SPECWIDTH*SPECHEIGHT];
    DWORD palette[256];
}

- (void)updateFFT:(float*)freq;

@end
