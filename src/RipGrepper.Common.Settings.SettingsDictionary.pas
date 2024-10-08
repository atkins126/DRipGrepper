unit RipGrepper.Common.Settings.SettingsDictionary;

interface

uses
	RipGrepper.Common.Settings.SettingVariant,
	System.Generics.Collections;

type
	TSettingsDictionary = class(TDictionary<string, ISettingVariant>)

		public
			constructor Create;
			destructor Destroy; override;
			procedure AddOrChange(const Key : string; const Value : ISettingVariant);
	end;

implementation

constructor TSettingsDictionary.Create;
begin
	inherited;
end;

destructor TSettingsDictionary.Destroy;
begin
	for var key in Keys do begin
		Self[key] := nil;
	end;
	inherited;
end;

procedure TSettingsDictionary.AddOrChange(const Key : string; const Value : ISettingVariant);
var
	setting : ISettingVariant;
begin
	self.TryGetValue(Key, setting);
	if Assigned(setting) and (not setting.Equals(Value)) then begin
		self[Key] := nil;
	end;
	AddOrSetValue(Key, Value);
end;

end.
