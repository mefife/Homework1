//
//  MEFAppDelegate.h
//  Homework1
//
//  Created by Matthew Fife on 6/29/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MEFAppDelegate : NSObject <NSApplicationDelegate, NSSpeechSynthesizerDelegate>

@property (assign) IBOutlet NSWindow *window;
@property IBOutlet NSTextField *Synthesizertext;
@property IBOutlet NSButton* speakButton;
@property IBOutlet NSButton* BoeingMissionButton;
@property IBOutlet NSButton* UWFightSongButton;
@property IBOutlet NSSegmentedControl* voiceButton;
@property NSSpeechSynthesizer *synthesizer;
@property NSMutableArray *voiceArray;
@property NSNumberFormatter *myNumberFormatted;
@property IBOutlet NSTextField *outputNumber;
@property IBOutlet NSTextField *inputNumber;
@property IBOutlet NSMatrix *radioButtons;
@property IBOutlet NSCell *radioWritten;
@property IBOutlet NSCell *radioDecimal;
@property IBOutlet NSCell *radioScience;
@property IBOutlet NSSlider *numberSlider;
@property IBOutlet NSTextField *Colortext;

@end
