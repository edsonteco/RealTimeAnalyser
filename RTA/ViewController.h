//
//  ViewController.h
//  RTA
//
//  Created by Edson Teco on 22/04/13.
//  Copyright (c) 2013 EdsonTeco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraficEq.h"
#include "bass.h"

@interface ViewController : UIViewController {
    DWORD chan;
}
@property (strong, nonatomic) GraficEq *eq;
@property (strong, nonatomic) NSTimer *timerUpdate;

@end
