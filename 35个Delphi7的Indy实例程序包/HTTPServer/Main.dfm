�
 TFMHTTPSERVERMAIN 0	  TPF0TfmHTTPServerMainfmHTTPServerMainLeft�Top� Width�HeightBiDiModebdLeftToRightBorderIconsbiSystemMenu
biMinimize CaptionHTTP Server demoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderParentBiDiModeOnCloseQueryFormCloseQueryOnCreate
FormCreate	OnDestroyFormDestroy
DesignSize��  PixelsPerInch`
TextHeight TLabel	LabelRootLeftTopUWidthHeightCaptionRoot  TLabelLabel1LeftTop
WidthHeightCaptionPort:  TEditedPortLeft TopWidth)HeightTabOrder Text80OnChangeedPortChangeOnExit
edPortExit
OnKeyPressedPortKeyPress  	TCheckBoxcbActiveLeft Top WidthIHeightAction
acActivateTabOrder  
TStatusBar
StatusBar1Left Top� Width�HeightPanels SimplePanel  TEditedRootLeft%TopPWidth`HeightAnchorsakLeftakTopakRight TabOrderTextc:\  	TCheckBoxcbAuthenticationLeft� TopWidth� HeightCaptionRequire authenticationTabOrder  	TCheckBoxcbManageSessionsLeft� TopWidth� HeightCaptionManage user sessionsTabOrder  	TCheckBoxcbEnableLogLeft� Top(Width� HeightCaption
Enable logChecked	State	cbCheckedTabOrder  TPanelPanel1Left TopmWidth�HeightkAlignalBottomAnchorsakLeftakTopakRightakBottom 
BevelOuterbvNoneCaptionPanel1TabOrder 	TSplitter	Splitter1Left� Top WidthHeightkCursorcrHSplitAlignalRight  TListBoxlbLogLeft Top Width� HeightkAlignalClient
ItemHeightTabOrder   TListBoxlbSessionListLeft� Top Width� HeightkAlignalRight
ItemHeightTabOrder
OnDblClicklbSessionListDblClick   TIdHTTPServer
HTTPServerOnStatusHTTPServerStatusBindings CommandHandlers Greeting.NumericCode�MaxConnectionReply.NumericCode 	OnConnectHTTPServerConnect	OnExecuteHTTPServerExecuteOnDisconnectHTTPServerDisconnectReplyExceptionCode 
ReplyTexts ReplyUnknownCommand.NumericCode AutoStartSession	OnSessionStartHTTPServerSessionStartOnSessionEndHTTPServerSessionEndSessionTimeOut�O OnCommandOtherHTTPServerCommandOtherOnCommandGetHTTPServerCommandGetLeft� Top�   TActionList	alGeneralLeft(Top�  TAction
acActivateCaption	&Activate	OnExecuteacActivateExecute    