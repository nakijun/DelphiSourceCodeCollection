�
 TFRMMAIN 0
  TPF0TfrmMainfrmMainLeft� Top� Width�Height�CaptionINDY - SMTP Relay DemoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TLabelLabel1LeftTopWidth7HeightCaption|Demonstrates sending mail directly to a users mailbox on a remote mailserver - this negates the need for a local SMTP serverFont.CharsetDEFAULT_CHARSET
Font.ColorclGrayFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontWordWrap	  TLabelLabel2LeftTop@WidthoHeightCaptionDNS server IP address:  TLabelLabel3LeftTop{WidthhHeightCaptionSender email address:  TLabelLabel4Left Top@Width1HeightCaption
Required !Font.CharsetDEFAULT_CHARSET
Font.ColorclGrayFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel5LeftTop� WidthsHeightCaptionRecipient email address:  TLabelLabel6LeftTop� WidthHHeightCaptionSubject of mail:  TLabelLabel7LeftTop� WidthBHeightCaptionMessage text:  TLabelLabel8LeftTop[Width_HeightCaptionDNS server timeout:  TLabelLabel9LeftPTop|Width1HeightCaption
Required !Font.CharsetDEFAULT_CHARSET
Font.ColorclGrayFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel10LeftPTop� Width1HeightCaption
Required !Font.CharsetDEFAULT_CHARSET
Font.ColorclGrayFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  
TStatusBarsbMainLeft TopfWidth�HeightPanels   TEditedtDNSLeft� Top<Width� HeightTabOrder  TEdit	edtSenderLeft� TopwWidth� HeightTabOrder  TEditedtRecipientLeft� Top� Width� HeightTabOrder  TEdit
edtSubjectLeft� Top� Width� HeightTabOrder  TMemommoMessageTextLeft� Top� Width� HeightqTabOrder  TButtonbtnSendMailLeftTopAWidthKHeightCaptionSend mail !TabOrderOnClickbtnSendMailClick  TButtonbtnExitLeftdTopWidthKHeightCaptionE&xitTabOrderOnClickbtnExitClick  TEdit
edtTimeOutLeft� TopWWidth=HeightTabOrderText5000  
TIdMessage	IdMessageAttachmentEncodingMIMEBccList CCList EncodingmeMIME
Recipients ReplyTo LeftTop�   TIdDNSResolverIdDNSResolverPort5ReceiveTimeout<QueryRecords LeftTop  TIdSMTPIdSMTPMaxLineActionmaExceptionReadTimeout PortAuthenticationTypeatNoneLeftTop�   TIdAntiFreezeIdAntiFreezeLeftTop,   