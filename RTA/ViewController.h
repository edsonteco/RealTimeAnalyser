//
//  ViewController.h
//  RTA
//
//  Created by Edson Teco on 22/04/13.
//  Copyright (c) 2013 EdsonTeco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grafico.h"
#include "bass.h"

@interface ViewController : UIViewController {
    DWORD chan;
}
@property (strong, nonatomic) Grafico *grafico;
@property (strong, nonatomic) NSTimer *timerUpdate;

@end
