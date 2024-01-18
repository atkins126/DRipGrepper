unit RipGrepper.Common.Types;

interface

uses
	System.Classes;

const
	CR = #13;
	LF = #10;
	CRLF = sLineBreak;
	BUFF_LENGTH = 1024;

	RIPGREP_ERROR = 1;
	RIPGREP_NO_MATCH = 2;

	DRAW_RESULT_ON_EVERY_LINE_COUNT = 100;

	IMG_IDX_SHOW_ABS_PATH = 11;
	IMG_IDX_SHOW_RELATIVE_PATH = 12;
	IMG_IDX_SHOW_FILE_ICON_TRUE = 5;
	IMG_IDX_SHOW_FILE_ICON_FALSE = 2;

	IMAGE_IDX_UNSORTED = 3;
	IMAGE_IDX_DESCENDING_SORTED = 4;
	IMAGE_IDX_ASCENDING_SORTED = 5;

	LV_IMAGE_IDX_OK = 0;
	LV_IMAGE_IDX_ERROR = 1;
	LV_IMAGE_IDX_INFO = 2;
	SAllAlphaNumericChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';

	RG_NECESSARY_PARAMS : TArray<string> = ['--vimgrep', '--line-buffered' // ,// some big search couldn't be catched without this
	// '--pretty' // TODO: parse color escape
		];

	RG_MATCH_LINE_REGEX = '^(\w:)?(.+?):(\d+):(\d+):(.+)$';

type

	// TNewLineEventHandler = procedure(_obj : INewLineEventHandler; const _s : string);
	// TTerminateEventProducer = function(_obj : ITerminateEventProducer) : boolean;

	TSortDirectionType = (stUnsorted, stAscending, stDescending);
	TParserType = (ptRipGrepSearch, ptRipGrepVersion, ptRipGrepError, ptRipGrepHelp);
	TFileNameType = (ftAbsolute, ftRelative);

implementation

uses
	System.SysUtils;

end.
