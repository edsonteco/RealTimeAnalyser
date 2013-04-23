//
//  ViewController.m
//  RTA
//
//  Created by Edson Teco on 22/04/13.
//  Copyright (c) 2013 EdsonTeco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// Recording callback - not doing anything with the data
BOOL CALLBACK DuffRecording(HRECORD handle, const void *buffer, DWORD length, void *user)
{
	return TRUE; // continue recording
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // check the correct BASS was loaded
    if (HIWORD(BASS_GetVersion()) != BASSVERSION) {
        NSLog(@"An incorrect version of BASS was loaded");
    }
    
    // initialize BASS recording (default device)
    if (!BASS_RecordInit(-1)) {
        NSLog(@"Can't initialize device");
    }
    // start recording (44100hz mono 16-bit)
    if (!(chan = BASS_RecordStart(44100, 1, 0, DuffRecording, 0))) {
        NSLog(@"Can't start recording");
        BASS_RecordFree();
    }
    
    self.grafico = [[Grafico alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.grafico.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.grafico.bands = 56;
    self.grafico.barColor = [UIColor blueColor];
    [self.view addSubview:self.grafico];
    
    self.timerUpdate = [NSTimer scheduledTimerWithTimeInterval:1.0f/40 target:self selector:@selector(update:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)update:(NSTimer*)timer
{
    float fft[1024];
    BASS_ChannelGetData(chan, fft, BASS_DATA_FFT2048);
    [self.grafico updateFFT:fft];
    [self.grafico setNeedsDisplay];
}

@end
