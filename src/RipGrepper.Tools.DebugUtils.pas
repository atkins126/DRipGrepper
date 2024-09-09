unit RipGrepper.Tools.DebugUtils;

interface

type

	TDebugUtils = class(TObject)
		private
			class procedure InnerOutputDebugString(const _s : string);

		public
			class procedure DebugMessage(const _s : string);
			class procedure Msg(const _s : string);
			class procedure DebugMessageFormat(const _s : string; const _args : array of const);
			class procedure MsgFmt(const _s : string; const _args : array of const);
	end;

	TDebugMsgBeginEnd = record

		private
			FProcName : string;

		public
			procedure Msg(const _sMsg : string);
			procedure MsgFmt(const _s : string; const _args : array of const);
			class function New(const _sProcName : string) : TDebugMsgBeginEnd; static;
			class operator Finalize(var Dest : TDebugMsgBeginEnd);
	end;

implementation

uses
	Winapi.Windows,
	System.SysUtils,
	RipGrepper.Common.Settings.RipGrepperSettings,
	System.RegularExpressions;

class procedure TDebugUtils.DebugMessage(const _s : string);
begin
	InnerOutputDebugString(_s);
end;

class procedure TDebugUtils.Msg(const _s : string);
begin
	DebugMessage(_s);
end;

class procedure TDebugUtils.DebugMessageFormat(const _s : string; const _args : array of const);
begin
	InnerOutputDebugString(Format(_s, _args));
end;

class procedure TDebugUtils.InnerOutputDebugString(const _s : string);
begin
	var
	bForce := False;
	{$IFDEF DEBUG}
	bForce := not bForce;
	{$ENDIF}

	if bForce or
	{ } ((Assigned(GSettings) and Assigned(GSettings.RipGrepperSettings) and GSettings.RipGrepperSettings.DebugTrace)) then begin
		// if TRegEx.IsMatch(_s, '') then
		OutputDebugString(PChar(_s));
	end;
end;

class procedure TDebugUtils.MsgFmt(const _s : string; const _args : array of const);
begin
	DebugMessageFormat(_s, _args);
end;

procedure TDebugMsgBeginEnd.Msg(const _sMsg : string);
begin
	TDebugUtils.Msg(FProcName + ' - ' + _sMsg);
end;

procedure TDebugMsgBeginEnd.MsgFmt(const _s : string; const _args : array of const);
begin
	TDebugUtils.MsgFmt(FProcName + ' - ' + _s, _args);
end;

class function TDebugMsgBeginEnd.New(const _sProcName : string) : TDebugMsgBeginEnd;
begin
	Result.FProcName := _sProcName;
	TDebugUtils.DebugMessage(_sProcName + ' - begin');
end;

class operator TDebugMsgBeginEnd.Finalize(var Dest : TDebugMsgBeginEnd);
begin
	TDebugUtils.DebugMessage(Dest.FProcName + ' - end');
end;

end.
