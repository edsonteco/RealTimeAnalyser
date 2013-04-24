//
//  Grafico.h
//  RTA
//
//  Created by Edson Teco on 22/04/13.
//  Copyright (c) 2013 EdsonTeco. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "bass.h"

#define FFT_LENGTH 1024
#define DEFAULT_BANDS 28

@interface GraficEq : UIView {
    float fft[FFT_LENGTH];
}
@property (nonatomic) int bands;
@property (nonatomic, strong) UIColor *barColor;

- (void)updateFFT:(float*)freq;

@end
