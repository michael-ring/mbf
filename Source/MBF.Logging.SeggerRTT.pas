unit MBF.Logging.SeggerRTT;

{$mode objfpc}{$H+}

(*********************************************************************
*               SEGGER MICROCONTROLLER GmbH & Co. KG                 *
*       Solutions for real time microcontroller applications         *
**********************************************************************
*                                                                    *
*       (c) 2014 - 2016  SEGGER Microcontroller GmbH & Co. KG        *
*                                                                    *
*       www.segger.com     Support: support@segger.com               *
*                                                                    *
**********************************************************************
*                                                                    *
*       SEGGER RTT * Real Time Transfer for embedded targets         *
*                                                                    *
**********************************************************************
*                                                                    *
* All rights reserved.                                               *
*                                                                    *
* SEGGER strongly recommends to not make any changes                 *
* to or modify the source code of this software in order to stay     *
* compatible with the RTT protocol and J-Link.                       *
*                                                                    *
* Redistribution and use in source and binary forms, with or         *
* without modification, are permitted provided that the following    *
* conditions are met:                                                *
*                                                                    *
* o Redistributions of source code must retain the above copyright   *
*   notice, this list of conditions and the following disclaimer.    *
*                                                                    *
* o Redistributions in binary form must reproduce the above          *
*   copyright notice, this list of conditions and the following      *
*   disclaimer in the documentation and/or other materials provided  *
*   with the distribution.                                           *
*                                                                    *
* o Neither the name of SEGGER Microcontroller GmbH & Co. KG         *
*   nor the names of its contributors may be used to endorse or      *
*   promote products derived from this software without specific     *
*   prior written permission.                                        *
*                                                                    *
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND             *
* CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,        *
* INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF           *
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE           *
* DISCLAIMED. IN NO EVENT SHALL SEGGER Microcontroller BE LIABLE FOR *
* ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR           *
* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT  *
* OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;    *
* OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF      *
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT          *
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE  *
* USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH   *
* DAMAGE.                                                            *
*                                                                    *
**********************************************************************
---------------------------END-OF-HEADER----------------------------*)

interface
const
  //
  // Operating modes. Define behavior if buffer is full (not enough space for entire message)
  //
  SEGGER_RTT_MODE_NO_BLOCK_SKIP         =0;     // Skip. Do not block, output nothing. (Default)
  SEGGER_RTT_MODE_NO_BLOCK_TRIM         =1;     // Trim: Do not block, output as much as fits.
  SEGGER_RTT_MODE_BLOCK_IF_FIFO_FULL    =2;     // Block: Wait until there is space in the buffer.
  SEGGER_RTT_MODE_MASK                  =3;

  SEGGER_RTT_MAX_NUM_UP_BUFFERS         =3;     // Max. number of up-buffers (T->H) available on this target    (Default: 3)
  SEGGER_RTT_MAX_NUM_DOWN_BUFFERS       =3;     // Max. number of down-buffers (H->T) available on this target  (Default: 3)

  BUFFER_SIZE_UP                        =1024;  // Size of the buffer for terminal output of target, up to host (Default: 1k)
  BUFFER_SIZE_DOWN                      =16;    // Size of the buffer for terminal input to target from host (Usually keyboard input) (Default: 16)

  SEGGER_RTT_PRINTF_BUFFER_SIZE         =64;    // Size of buffer for RTT printf to bulk-send chars via RTT     (Default: 64)

  SEGGER_RTT_MODE_DEFAULT               =SEGGER_RTT_MODE_NO_BLOCK_SKIP; // Mode for pre-initialized terminal channel (buffer 0)

  //
  // Control sequences, based on ANSI.
  // Can be used to control color, and clear the screen
  //
  RTT_CTRL_RESET                ='^[[0m';         // Reset to default colors
  RTT_CTRL_CLEAR                ='^[[2J';         // Clear screen, reposition cursor to top left

  RTT_CTRL_TEXT_BLACK           ='^[[2;30m';
  RTT_CTRL_TEXT_RED             ='^[[2;31m';
  RTT_CTRL_TEXT_GREEN           ='^[[2;32m';
  RTT_CTRL_TEXT_YELLOW          ='^[[2;33m';
  RTT_CTRL_TEXT_BLUE            ='^[[2;34m';
  RTT_CTRL_TEXT_MAGENTA         ='^[[2;35m';
  RTT_CTRL_TEXT_CYAN            ='^[[2;36m';
  RTT_CTRL_TEXT_WHITE           ='^[[2;37m';

  RTT_CTRL_TEXT_BRIGHT_BLACK    ='^[[1;30m';
  RTT_CTRL_TEXT_BRIGHT_RED      ='^[[1;31m';
  RTT_CTRL_TEXT_BRIGHT_GREEN    ='^[[1;32m';
  RTT_CTRL_TEXT_BRIGHT_YELLOW   ='^[[1;33m';
  RTT_CTRL_TEXT_BRIGHT_BLUE     ='^[[1;34m';
  RTT_CTRL_TEXT_BRIGHT_MAGENTA  ='^[[1;35m';
  RTT_CTRL_TEXT_BRIGHT_CYAN     ='^[[1;36m';
  RTT_CTRL_TEXT_BRIGHT_WHITE    ='^[[1;37m';

  RTT_CTRL_BG_BLACK             ='^[[24;40m';
  RTT_CTRL_BG_RED               ='^[[24;41m';
  RTT_CTRL_BG_GREEN             ='^[[24;42m';
  RTT_CTRL_BG_YELLOW            ='^[[24;43m';
  RTT_CTRL_BG_BLUE              ='^[[24;44m';
  RTT_CTRL_BG_MAGENTA           ='^[[24;45m';
  RTT_CTRL_BG_CYAN              ='^[[24;46m';
  RTT_CTRL_BG_WHITE             ='^[[24;47m';

  RTT_CTRL_BG_BRIGHT_BLACK      ='^[[4;40m';
  RTT_CTRL_BG_BRIGHT_RED        ='^[[4;41m';
  RTT_CTRL_BG_BRIGHT_GREEN      ='^[[4;42m';
  RTT_CTRL_BG_BRIGHT_YELLOW     ='^[[4;43m';
  RTT_CTRL_BG_BRIGHT_BLUE       ='^[[4;44m';
  RTT_CTRL_BG_BRIGHT_MAGENTA    ='^[[4;45m';
  RTT_CTRL_BG_BRIGHT_CYAN       ='^[[4;46m';
  RTT_CTRL_BG_BRIGHT_WHITE      ='^[[4;47m';

  _aTerminalId: array[0..15] of char = ( '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' );
type
  //
  // Description for a circular buffer (also called 'ring buffer')
  // which is used as up-buffer (T->H)
  //
  TSEGGER_RTT_BUFFER_UP = record
    sName : pChar;           // Optional name. Standard names so far are: 'Terminal', 'SysView', 'J-Scope_t4i4'
    pBuffer : pChar;         // Pointer to start of buffer
    SizeOfBuffer : longWord; // Buffer size in bytes. Note that one byte is lost, as this implementation does not fill up the buffer in order to avoid the problem of being unable to distinguish between full and empty.
    WrOff : longWord;        // Position of next item to be written by either target.
    RdOff : longWord;        // Position of next item to be read by host. Must be volatile since it may be modified by host.
    Flags : longWord;        // Contains configuration flags
  end;
  pTSEGGER_RTT_BUFFER_UP = ^TSEGGER_RTT_BUFFER_UP;

  //
  // Description for a circular buffer (also called 'ring buffer')
  // which is used as down-buffer (H->T)
  //
  TSEGGER_RTT_BUFFER_DOWN = record
    sName : pChar;           // Optional name. Standard names so far are: 'Terminal', 'SysView', 'J-Scope_t4i4'
    pBuffer : pChar;         // Pointer to start of buffer
    SizeOfBuffer : longWord; // Buffer size in bytes. Note that one byte is lost, as this implementation does not fill up the buffer in order to avoid the problem of being unable to distinguish between full and empty.
    WrOff : longWord;        // Position of next item to be written by host. Must be volatile since it may be modified by host.
    RdOff : longWord;        // Position of next item to be read by target (down-buffer).
    Flags : longWord;        // Contains configuration flags
  end;
  pTSEGGER_RTT_BUFFER_DOWN = ^TSEGGER_RTT_BUFFER_DOWN;

  //
  // RTT control block which describes the number of buffers available
  // as well as the configuration for each buffer
  //
  //
  TSEGGER_RTT_CB = record
    acID : array[0..15] of char;  // Initialized to 'SEGGER RTT'
    MaxNumUpBuffers : longWord;   // Initialized to SEGGER_RTT_MAX_NUM_UP_BUFFERS (type. 2)
    MaxNumDownBuffers : longWord; // Initialized to SEGGER_RTT_MAX_NUM_DOWN_BUFFERS (type. 2)
    aUp : array[0..SEGGER_RTT_MAX_NUM_UP_BUFFERS-1] of TSEGGER_RTT_BUFFER_UP; // Up buffers, transferring information up from target via debug probe to host
    aDown : array[0..SEGGER_RTT_MAX_NUM_DOWN_BUFFERS-1] of TSEGGER_RTT_BUFFER_DOWN; // Down buffers, transferring information down from host via debug probe to target
  end;

procedure SEGGER_RTT_Write(const s : string);
procedure SEGGER_RTT_WriteLn(const s : string);

var
  _SEGGER_RTT : TSEGGER_RTT_CB; //public name '_SEGGER_RTT';

implementation
var
  _acUpBuffer : array[0..BUFFER_SIZE_UP-1] of byte;
  _acDownBuffer : array[0..BUFFER_SIZE_DOWN-1] of byte;

(*
procedure SeggerRTT; assembler; nostackframe;
label _SEGGER_RTT;
asm
  .data
  .section "SEGGER_RTT_SECTION"
_SEGGER_RTT:
  .long 0 //acID
  .long 0
  .long 0
  .long 0

  .long 0 //MaxNumUpBuffers
  .long 0 //MaxNumDownBuffers

  .long 0 //aUp
  .long 0
  .long 0

  .long 0 //aDown
  .long 0
  .long 0

  .text
end;
*)

function min(a,b : longint) : longint;{$ifdef USEINLINE}inline;{$endif}
begin
  if a<=b then
    min:=a
  else
    min:=b;
end;

procedure memcpy(pTarget,pSource:pChar;NumBytesToWrite:longWord);
var
  i : longWord;
begin
  for i := 0 to NumBytesToWrite-1 do
    pTarget[i] := pSource[i];
end;
procedure _doInit;
begin
  _SEGGER_RTT.aUp[0].sName := 'Terminal';
  _SEGGER_RTT.aUp[0].pBuffer := @_acUpBuffer;
  _SEGGER_RTT.aUp[0].sizeOfBuffer := BUFFER_SIZE_UP;
  _SEGGER_RTT.aUp[0].RdOff := 0;
  _SEGGER_RTT.aUp[0].WrOff := 0;
  _SEGGER_RTT.aUp[0].Flags := SEGGER_RTT_MODE_DEFAULT;

  _SEGGER_RTT.aDown[0].sName := 'Terminal';
  _SEGGER_RTT.aDown[0].pBuffer := @_acDownBuffer;
  _SEGGER_RTT.aDown[0].sizeOfBuffer := BUFFER_SIZE_DOWN;
  _SEGGER_RTT.aDown[0].RdOff := 0;
  _SEGGER_RTT.aDown[0].WrOff := 0;
  _SEGGER_RTT.aDown[0].Flags := SEGGER_RTT_MODE_DEFAULT;
  _SEGGER_RTT.acID[0] := 'S';
  _SEGGER_RTT.acID[1] := 'E';
  _SEGGER_RTT.acID[2] := 'G';
  _SEGGER_RTT.acID[3] := 'G';
  _SEGGER_RTT.acID[4] := 'E';
  _SEGGER_RTT.acID[5] := 'R';
  _SEGGER_RTT.acID[6] := ' ';
  _SEGGER_RTT.acID[7] := 'R';
  _SEGGER_RTT.acID[8] := 'T';
  _SEGGER_RTT.acID[9] := 'T';
  _SEGGER_RTT.acID[10] := #0;
end;

(*********************************************************************
*
*       _WriteBlocking()
*
*  Function description
*    Stores a specified number of characters in SEGGER RTT ring buffer
*    and updates the associated write pointer which is periodically
*    read by the host.
*    The caller is responsible for managing the write chunk sizes as
*    _WriteBlocking() will block until all data has been posted successfully.
*
*  Parameters
*    pRing        Ring buffer to post to.
*    pBuffer      Pointer to character array. Does not need to point to a \0 terminated string.
*    NumBytes     Number of bytes to be stored in the SEGGER RTT control block.
*
*  Return value
*    >= 0 - Number of bytes written into buffer.
*)
function _WriteBlocking(pRing : pTSEGGER_RTT_BUFFER_UP; const pBuffer : pChar; NumBytes : longWord):longWord;
var
  NumBytesToWrite : longWord;
  NumBytesWritten : longWord;
  RdOff : longWord;
  WrOff : longWord;
  pBufferTmp : pChar;
begin
  //
  // Write data to buffer and handle wrap-around if necessary
  //
  pBufferTmp := pBuffer;
  NumBytesWritten := 0;
  WrOff := pRing^.WrOff;
  repeat
    RdOff := pRing^.RdOff;                         // May be changed by host (debug probe) in the meantime
    if RdOff > WrOff then
      NumBytesToWrite := RdOff - WrOff - 1
    else
      NumBytesToWrite := pRing^.SizeOfBuffer - (WrOff - RdOff + 1);

    NumBytesToWrite := min(NumBytesToWrite, (pRing^.SizeOfBuffer - WrOff));      // Number of bytes that can be written until buffer wrap-around
    NumBytesToWrite := min(NumBytesToWrite, NumBytes);
    memcpy(pRing^.pBuffer + WrOff, pBufferTmp, NumBytesToWrite);
    NumBytesWritten := NumBytesWritten + NumBytesToWrite;
    pBufferTmp         := pBufferTmp + NumBytesToWrite;
    NumBytes        := NumBytes - NumBytesToWrite;
    WrOff           := WrOff + NumBytesToWrite;
    if WrOff = pRing^.SizeOfBuffer then
      WrOff := 0;
    pRing^.WrOff := WrOff;
  until NumBytes = 0;

  result := NumBytesWritten;
end;

(*********************************************************************
*
*       _WriteNoCheck()
*
*  Function description
*    Stores a specified number of characters in SEGGER RTT ring buffer
*    and updates the associated write pointer which is periodically
*    read by the host.
*    It is callers responsibility to make sure data actually fits in buffer.
*
*  Parameters
*    pRing        Ring buffer to post to.
*    pBuffer      Pointer to character array. Does not need to point to a \0 terminated string.
*    NumBytes     Number of bytes to be stored in the SEGGER RTT control block.
*
*  Notes
*    (1) If there might not be enough space in the "Up"-buffer, call _WriteBlocking
*)
procedure _WriteNoCheck(pRing : pTSEGGER_RTT_BUFFER_UP; const pData : pChar; NumBytes : longWord);
var
  NumBytesAtOnce : longWord;
  WrOff : longWord;
  Rem : longWord;

begin
  WrOff := pRing^.WrOff;
  Rem := pRing^.SizeOfBuffer - WrOff;
  if Rem > NumBytes then
  begin
    //
    // All data fits before wrap around
    //
    memcpy(pRing^.pBuffer + WrOff, pData, NumBytes);
    pRing^.WrOff := WrOff + NumBytes;
  end
  else
  begin
    //
    // We reach the end of the buffer, so need to wrap around
    //
    NumBytesAtOnce := Rem;
    memcpy(pRing^.pBuffer + WrOff, pData, NumBytesAtOnce);
    NumBytesAtOnce := NumBytes - Rem;
    memcpy(pRing^.pBuffer, pData + Rem, NumBytesAtOnce);
    pRing^.WrOff := NumBytesAtOnce;
  end;
end;


(*********************************************************************
*
*       _GetAvailWriteSpace()
*
*  Function description
*    Returns the number of bytes that can be written to the ring
*    buffer without blocking.
*
*  Parameters
*    pRing        Ring buffer to check.
*
*  Return value
*    Number of bytes that are free in the buffer.
*)
function _GetAvailWriteSpace(pRing : pTSEGGER_RTT_BUFFER_UP) : longWord;
var
  RdOff : longWord;
  WrOff : longWord;
  r : longWord;
begin
  //
  // Avoid warnings regarding volatile access order.  It's not a problem
  // in this case, but dampen compiler enthusiasm.
  //
  RdOff := pRing^.RdOff;
  WrOff := pRing^.WrOff;
  if RdOff <= WrOff then
    r := pRing^.SizeOfBuffer - 1 - WrOff + RdOff
  else
    r := RdOff - WrOff - 1;
  Result := r;
end;

(*********************************************************************
*
*       SEGGER_RTT_WriteNoLock
*
*  Function description
*    Stores a specified number of characters in SEGGER RTT
*    control block which is then read by the host.
*    SEGGER_RTT_WriteNoLock does not lock the application.
*
*  Parameters
*    BufferIndex  Index of "Up"-buffer to be used (e.g. 0 for "Terminal").
*    pBuffer      Pointer to character array. Does not need to point to a \0 terminated string.
*    NumBytes     Number of bytes to be stored in the SEGGER RTT control block.
*
*  Return value
*    Number of bytes which have been stored in the "Up"-buffer.
*
*  Notes
*    (1) If there is not enough space in the "Up"-buffer, remaining characters of pBuffer are dropped.
*    (2) For performance reasons this function does not call Init()
*        and may only be called after RTT has been initialized.
*        Either by calling SEGGER_RTT_Init() or calling another RTT API function first.
*)
function SEGGER_RTT_WriteNoLock(BufferIndex : longWord; const pBuffer : pChar; NumBytes : longWord) : longWord;
var
  Status : longWord;
  Avail : longWord;
  pData : pChar;
  pRing : pTSEGGER_RTT_BUFFER_UP;

begin
  pData := pBuffer;
  //
  // Get "to-host" ring buffer.
  //
  pRing := @_SEGGER_RTT.aUp[BufferIndex];
  //
  // How we output depends upon the mode...
  //
  case pRing^.Flags of
    SEGGER_RTT_MODE_NO_BLOCK_SKIP: begin
      //
      // If we are in skip mode and there is no space for the whole
      // of this output, don't bother.
      //
      Avail := _GetAvailWriteSpace(pRing);
      if Avail < NumBytes then
        Status := 0
      else
        Status := NumBytes;
      _WriteNoCheck(pRing, pData, NumBytes);
    end;
    SEGGER_RTT_MODE_NO_BLOCK_TRIM: begin
      //
      // If we are in trim mode, trim to what we can output without blocking.
      //
      Avail := _GetAvailWriteSpace(pRing);
      if Avail < NumBytes then
        Status := Avail
      else
        Status := NumBytes;
      _WriteNoCheck(pRing, pData, Status);
    end;
    SEGGER_RTT_MODE_BLOCK_IF_FIFO_FULL: begin
      //
      // If we are in blocking mode, output everything.
      //
      Status := _WriteBlocking(pRing, pData, NumBytes);
    end
  else
    Status := 0;
  end;
  //
  // Finish up.
  //
  Result := Status;
end;

procedure SEGGER_RTT_Write(const s : string);
begin
  Segger_RTT_WriteNoLock(0,pChar(s),length(s));
end;

procedure SEGGER_RTT_WriteLn(const s : string);
begin
  Segger_RTT_WriteNoLock(0,pChar(s+#13+#10),length(s)+2);
end;

begin
  _doInit;
end.

