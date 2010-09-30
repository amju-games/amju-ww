//
//  ES1Renderer.m
//  Untitled
//
//  Created by Student on 05/08/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ES1Renderer.h"
#include "StartUp.h"
#include <Game.h>
#include <AmjuGL.h>
#include <AmjuGL-OpenGLES.h>
#include <File.h>
#include <SoundManager.h>
#include <EventPoller.h>
#include <Screen.h>
#include <SoundIPhone.h>
#include <EventPollerImplIPhone.h>
#include <StringUtils.h>

@implementation ES1Renderer

// Create an OpenGL ES 1.1 context
- (id)init
{
    if ((self = [super init]))
    {
        context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];

        if (!context || ![EAGLContext setCurrentContext:context])
        {
            [self release];
            return nil;
        }

        // Create default framebuffer object. The backing will be allocated for the current layer in -resizeFromLayer
        glGenFramebuffersOES(1, &defaultFramebuffer);
        glGenRenderbuffersOES(1, &colorRenderbuffer);
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
        glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
        glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, colorRenderbuffer);
                
        Amju::AmjuGL::SetImpl(new Amju::AmjuGLOpenGLES);
        Amju::AmjuGL::Init();
		
		// Get path to data files
		NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data-iphone" ofType:@"glue"];
		
		// From http://forums.macrumors.com/showthread.php?t=494103
		//NSString *foo = @"your text here";
		//const char *bar = [foo UTF8String];
		
		const char* cFilePath = [filePath UTF8String];
		Amju::File::SetRoot(Amju::GetFilePath(cFilePath), "/");    
		
		Amju::TheSoundManager::Instance()->SetImpl(new Amju::SoundIPhone);
		Amju::TheEventPoller::Instance()->SetImpl(new Amju::EventPollerImplIPhone);
				
        Amju::StartUp();
        
    }

    return self;
}

- (void)render
{
    // This application only creates a single context which is already set current at this point.
    // This call is redundant, but needed if dealing with multiple contexts.
    [EAGLContext setCurrentContext:context];

    // This application only creates a single default framebuffer which is already bound at this point.
    // This call is redundant, but needed if dealing with multiple framebuffers.
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
	
	// Temporarily disable, confusing mouse coords! 
	// Landscape mode
#ifdef LANDSCAPE
	Amju::Screen::SetSize(backingHeight, backingWidth);
	Amju::AmjuGL::SetScreenRotation(90.0f);
#else
	Amju::Screen::SetSize(backingWidth, backingHeight);		
#endif
	
    //glViewport(0, 0, backingWidth, backingHeight);

	// TODO swap, may speed up ?
    Amju::TheGame::Instance()->Update();
    Amju::TheGame::Instance()->Draw();
    Amju::AmjuGL::Flip();     

    // This application only creates a single color renderbuffer which is already bound at this point.
    // This call is redundant, but needed if dealing with multiple renderbuffers.
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
    [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (BOOL)resizeFromLayer:(CAEAGLLayer *)layer
{	
    // Allocate color buffer backing based on the current layer size
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
    [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);

    // Enable depth buffer - From http://forums.toucharcade.com/showthread.php?t=28829
    glGenRenderbuffersOES(1, &depthRenderbuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
    glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);

    if (glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
    {
        NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
        return NO;
    }

    return YES;
}

- (void)dealloc
{
    // Tear down GL
    if (defaultFramebuffer)
    {
        glDeleteFramebuffersOES(1, &defaultFramebuffer);
        defaultFramebuffer = 0;
    }

    if (colorRenderbuffer)
    {
        glDeleteRenderbuffersOES(1, &colorRenderbuffer);
        colorRenderbuffer = 0;
    }

    // Tear down context
    if ([EAGLContext currentContext] == context)
        [EAGLContext setCurrentContext:nil];

    [context release];
    context = nil;

    [super dealloc];
}

@end
