�
 TFRMCLIENT 0�  TPF0
TfrmClient	frmClientLeft� TopkWidth�Height�CaptionRemote DataSet Demo - ClientColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoDesktopCenterPixelsPerInch`
TextHeight 	TSplitter	Splitter1Left� Top)WidthHeight�CursorcrHSplitBeveled	ColorclGrayParentColor  
TStatusBar
StatusBar1Left Top�Width�HeightPanels SimplePanel  TPanelPanel1Left Top Width�Height)AlignalTop
BevelOuterbvNoneColor��� TabOrder TButtonbtnExitLeftTopWidthKHeightCaptionE&xitTabOrder OnClickbtnExitClick   TPanelPanel2Left Top)Width� Height�AlignalLeft
BevelOuterbvNoneTabOrder 	TSplitter	Splitter2Left Top� Width� HeightCursorcrVSplitAlignalTopBeveled	ColorclGrayParentColor  	TSplitter	Splitter3Left TopWidth� HeightCursorcrVSplitAlignalTopBeveled	ColorclGrayParentColor  TPanelPanel3Left Top Width� HeightAlignalTopCaptionAliasesTabOrder   TPanelPanel5Left TopWidth� HeighthAlignalTopTabOrder TListBox	lstFieldsLeftTopWidth� HeightfAlignalClient
ItemHeightTabOrder    TPanelPanel4Left Top� Width� HeightAlignalTopCaptionTablesTabOrder  TPanelPanel6Left TopWidth� HeightlAlignalTopTabOrder TListBox
lstAliasesLeftTopWidth� HeightjAlignalClient
ItemHeightTabOrder OnClicklstAliasesClick   TPanelPanel7Left TopWidth� HeightAlignalTopCaptionFieldsTabOrder  TPanelPanel8Left Top� Width� HeighthAlignalTopTabOrder TListBox	lstTablesLeftTopWidth� HeightfAlignalClient
ItemHeightTabOrder OnClicklstTablesClick    TPageControlPageControl1Left� Top)Width�Height�
ActivePage	TabSheet1AlignalClient	MultiLine	TabIndexTabOrder 	TTabSheet	TabSheet2CaptionNotes
ImageIndex TMemommoNotesLeft Top Width�HeightmAlignalClientLines.StringsNotes:: GThis demo demonstates a basic means of exchanging database information @between a TCP client and server. To run the demo you *MUST* haveDthe "TKBMMemTable" package installed. This is a third-party package 2and is not part of INDY; it is however opensource. JThe demo shows some basic functions but does not cater for errors that may:occur for example when a fieldname is actually a reserved word (eg: STATE / DATE etc). AThe main concept is using TidTCPClient and TidTCPServer to STREAMFa DataSet rom server to client. This demo could be updated for example;to make local updates reflect back to server database, etc. MTo operate the demo, run the server, then the client. In the SQL/Result tab, Gclick on "Get Meta Data" to retrieve BDE Alias / Table and Table Field Iinformation. To view data from a selected table click the "GET SQL Data" Gbutton. You can also type your own free-text SQL in the SQL window, butAensure you select the correct BDE Alias from the ALIASES listbox.  - Allen O'Neill  April 21 2001 TabOrder    	TTabSheet	TabSheet1CaptionSQL / Data Results TPanelPanel9Left Top Width�HeightmAlignalClient
BevelOuterbvNoneTabOrder  	TSplitter	Splitter4Left Top� Width�HeightCursorcrVSplitAlignalTopBeveled	ColorclGrayParentColor  	TSplitter	Splitter5Left� Top� WidthHeight� CursorcrHSplitBeveled	ColorclGrayParentColor  TPanelPanel10Left Top Width�HeightAlignalTopCaptionSQLTabOrder   TMemommoSQLLeft TopWidth�HeightmAlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont
ScrollBars
ssVerticalTabOrder  TDBGridgrdResultsDataLeft Top� Width� Height� AlignalLeft
DataSourcedsResultDataTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TPanelPanel11Left Top� Width�HeightAlignalTopCaptionResult DataTabOrder  TPanelPanel12Left Top� Width�Height AlignalTop
BevelOuterbvNoneTabOrder TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourcedsResultDataTabOrder   TButtonbtnGetMetaDataLeft� TopWidthYHeightCaptionGet &Meta DataTabOrderOnClickbtnGetMetaDataClick  TButton	btnGetSQLLeftSTopWidthYHeightCaptionGet &SQL dataTabOrderOnClickbtnGetSQLClick   
TScrollBoxSBMainLeft� Top� Width� Height� AlignalClientTabOrder     TkbmMemTable
tblAliasesDesignActivation	AttachedAutoRefresh	AttachMaxCount	FieldDefs 	IndexDefs SortOptions PersistentBackupProgressFlagsmtpcLoadmtpcSavemtpcCopy FilterOptions Version3.00
LanguageID SortID SubLanguageIDLocaleID DefaultFormatkbmBinaryStreamFormat1PersistentFormatkbmBinaryStreamFormat1
FormFormatkbmBinaryStreamFormat1Left[Top  TkbmMemTabletblResultDataDesignActivation	AttachedAutoRefresh	AttachMaxCount	FieldDefs 	IndexDefs SortOptions PersistentBackupProgressFlagsmtpcLoadmtpcSavemtpcCopy FilterOptions Version3.00
LanguageID SortID SubLanguageIDLocaleID DefaultFormatkbmBinaryStreamFormat1PersistentFormatkbmBinaryStreamFormat1
FormFormatkbmBinaryStreamFormat1Left� Top  TDataSourcedsResultDataDataSettblResultDataLeft� Top  TIdTCPClientIdTCPClientMaxLineActionmaExceptionReadTimeout Host	127.0.0.1Port�#Left� Top  TkbmMemTable	tblTablesDesignActivation	AttachedAutoRefresh	AttachMaxCount	FieldDefs 	IndexDefs SortOptions PersistentBackupProgressFlagsmtpcLoadmtpcSavemtpcCopy FilterOptions Version3.00
LanguageID SortID SubLanguageIDLocaleID DefaultFormatkbmBinaryStreamFormat1PersistentFormatkbmBinaryStreamFormat1
FormFormatkbmBinaryStreamFormat1LeftxTop  TkbmMemTable	tblFieldsDesignActivation	AttachedAutoRefresh	AttachMaxCount	FieldDefs 	IndexDefs SortOptions PersistentBackupProgressFlagsmtpcLoadmtpcSavemtpcCopy FilterOptions Version3.00
LanguageID SortID SubLanguageIDLocaleID DefaultFormatkbmBinaryStreamFormat1PersistentFormatkbmBinaryStreamFormat1
FormFormatkbmBinaryStreamFormat1Left� Top  TkbmBinaryStreamFormatkbmBinaryStreamFormat1Version3.00sfUsingIndexsfSaveUsingIndex sfData
sfSaveData
sfLoadData sfCalculated sfLookup sfNonVisiblesfSaveNonVisiblesfLoadNonVisible sfBlobssfSaveBlobssfLoadBlobs sfDef	sfSaveDef	sfLoadDef 
sfIndexDefsfSaveIndexDefsfLoadIndexDef 
sfFilteredsfSaveFiltered sfIgnoreRangesfSaveIgnoreRange sfIgnoreMasterDetailsfSaveIgnoreMasterDetail sfDeltas sfDontFilterDeltas sfAppend sfFieldKindsfSaveFieldKind sfFromStartsfLoadFromStart 
BufferSize @LeftTop   