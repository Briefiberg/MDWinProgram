Procedure ResizeWebWindow()
  ResizeGadget(10, #PB_Ignore, #PB_Ignore, WindowWidth(0), WindowHeight(0)-52)
EndProcedure


If OpenWindow(0, 100, 200, 500, 300, "MDWin 2023", #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget | #PB_Window_SizeGadget)

  CreateStatusBar(0, WindowID(0))
    AddStatusBarField(#PB_Ignore)
    StatusBarText(0, 0, "MDWin Cursor Downloading Software!", 0)

  If WebGadget(10, 0, 31, 0, 0, "file:///C:/Program%20Files/MDWin/MDWin.html") = 0
    
    CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
      ; Linux and OX uses Webkit
      MessageRequester("Error", "Webkit library not found", 0)
    CompilerEndIf
    
    End ; Quit
  EndIf
  
  AddKeyboardShortcut(0, #PB_Shortcut_Return, 0)
  
  ; Use bindevent() to have a realtime window resize
  ;
  BindEvent(#PB_Event_SizeWindow, @ResizeWebWindow())
  ResizeWebWindow() ; Adjust the gadget to the current window size
    
  Repeat
    Event = WaitWindowEvent()
    
    Select Event
      Case #PB_Event_Gadget
      
        Select EventGadget()
          Case 1
            SetGadgetState(10, #PB_Web_Back)
          
          Case 2
            SetGadgetState(10, #PB_Web_Forward)
          
          Case 3
            SetGadgetState(10, #PB_Web_Stop)
          
          Case 5
            SetGadgetText(10, GetGadgetText(4))
            
        EndSelect
      
      Case #PB_Event_Menu ; We only have one shortcut
        SetGadgetText(10, GetGadgetText(4))
     
    EndSelect
      
  Until Event = #PB_Event_CloseWindow
   
EndIf
; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 3
; Folding = -
; EnableXP
; DPIAware
; UseIcon = ..\..\..\Program Files\MDWin\Icon.ico
; Executable = MDWin64.exe
; IncludeVersionInfo
; VersionField0 = 1.0
; VersionField1 = 1.0
; VersionField2 = Briefiberg
; VersionField3 = MDWin
; VersionField4 = 1.0
; VersionField5 = 1.0
; VersionField6 = MDWin
; VersionField7 = MDWin Cursor Downloader Software
; VersionField8 = MDWin.exe
; VersionField9 = Briefiberg Software
; VersionField10 = Briefiberg Software
; VersionField11 = No