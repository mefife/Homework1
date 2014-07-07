//
//  MEFAppDelegate.m
//  Homework1
//
//  Created by Matthew Fife on 6/29/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MEFAppDelegate.h"

@implementation MEFAppDelegate

//- (NSSpeechSynthesizer *)applicationDidFinishLaunching:(NSNotification *)aNotification
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.synthesizer = [[NSSpeechSynthesizer alloc] initWithVoice: @"com.apple.speech.synthesis.voice.Fred"];
    self.synthesizer.delegate = self;
    self.myNumberFormatted =[[NSNumberFormatter alloc] init];
    //self.numberSlider = [[NSSlider alloc] init];
//    return _synthesizer;
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    //reset the buttons to their original state pg. 102 of book
    
    self.speakButton.enabled = YES;
    self.voiceButton.enabled = YES;
    self.UWFightSongButton.enabled = YES;
    self.BoeingMissionButton.enabled = YES;
    
}

- (IBAction)numberFieldChanged:(id)sender
{
    self.outputNumber.stringValue = self.inputNumber.stringValue;
}

- (IBAction)sliderChanged:(id)sender
{
    self.outputNumber.intValue = self.numberSlider.intValue;
}

- (IBAction)radioWritten:(id)sender
{
    //NSLog(@"Written");
    self.outputNumber.objectValue = [self.myNumberFormatted numberFromString:self.outputNumber.stringValue];
    [self.myNumberFormatted setNumberStyle:NSNumberFormatterSpellOutStyle];
    //self.outputNumber.stringValue = [self.myNumberFormatted stringFromNumber:(NSNumber *)self.outputNumber.objectValue];
    self.outputNumber.formatter = self.myNumberFormatted;
    //NSLog(@"%@", [self.myNumberFormatted stringFromNumber:(NSNumber *) @"45.0"]);
    //NSLog(@"%@", (NSString *)[self.myNumberFormatted numberFromString:self.outputNumber.stringValue] );

}

- (IBAction)radioDecimal:(id)sender
{
    //NSLog(@"Decimal");
    //[self.myNumberFormatted numberFromString:self.outputNumber.stringValue];
    self.outputNumber.objectValue = [self.myNumberFormatted numberFromString:self.outputNumber.stringValue];
    [self.myNumberFormatted setNumberStyle:NSNumberFormatterDecimalStyle];
    self.outputNumber.formatter = self.myNumberFormatted;
    //[self.outputNumber setStringValue:[self.myNumberFormatted numberFromString:self.outputNumber.stringValue]];
    //NSLog(@"%@", (NSString *)[self.myNumberFormatted numberFromString:self.outputNumber.stringValue] );
}

- (IBAction)radioScience:(id)sender
{
    //NSLog(@"Science");
    //[self.myNumberFormatted numberFromString:self.outputNumber.stringValue];
    self.outputNumber.objectValue = [self.myNumberFormatted numberFromString:self.outputNumber.stringValue];
    [self.myNumberFormatted setNumberStyle:NSNumberFormatterScientificStyle];
    self.outputNumber.formatter = self.myNumberFormatted;
    //NSLog(@"%@", [self.myNumberFormatted numberFromString:self.outputNumber.stringValue]);
    //self.outputNumber.stringValue = (NSString *)[self.myNumberFormatted numberFromString:self.outputNumber.stringValue];
    //NSLog(@"%@", (NSString *)[self.myNumberFormatted numberFromString:self.outputNumber.stringValue] );
}

- (IBAction)speakButtonpushed:(id)sender
{
    [self.synthesizer startSpeakingString:self.Synthesizertext.stringValue];
    
    self.speakButton.enabled = NO;
    self.voiceButton.enabled = NO;
    self.UWFightSongButton.enabled = NO;
    self.BoeingMissionButton.enabled = NO;
}


-(IBAction)boeingMissionPressed:(id)sender
{
    //[[self.Synthesizertext cell] setWraps:YES];
    //[[self.Synthesizertext cell] setLineBreakMode:NSLineBreakByWordWrapping];
    self.Synthesizertext.stringValue = @"People working together as a global enterprise for aerospace industry leadership.";
}

-(IBAction)uwFightSongPressed:(id)sender
{
    //[[self.Synthesizertext cell] setWraps:YES];
    //[[self.Synthesizertext cell] setLineBreakMode:NSLineBreakByWordWrapping];
    self.Synthesizertext.stringValue = @"Bow Down to Washington, Bow Down to Washington. Mighty Are the Men Who Wear Purple and the Gold!";
}

-(IBAction)VoiceSelectionPressed:(id)sender
{
    
    long clickedSegment = [sender selectedSegment];
    long clickedSegmentTag = [[sender cell] tagForSegment:clickedSegment];
    
    if (clickedSegmentTag == 0) {
        [_synthesizer setVoice:@"com.apple.speech.synthesis.voice.Zarvox"];
        }
    
    if (clickedSegmentTag == 1) {
        [_synthesizer setVoice:@"com.apple.speech.synthesis.voice.Kathy"];
    }
    
    if (clickedSegmentTag == 2) {
        [_synthesizer setVoice:@"com.apple.speech.synthesis.voice.Fred"];
    }
    
}

-(IBAction)ColorButtonPressed:(id)sender
{
    self.Colortext.textColor = [NSColor redColor];
}
@end
