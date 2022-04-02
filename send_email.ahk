#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

Mail("412832768@qq.com","xiewu5550@163.com","测试" A_Now,"AutoHotkey send email!")
;qq邮箱需要到网页邮箱设置-账户里面开启smtp服务，密码是另外生成的密码
 
Mail(from,to,subject,content,attach*){ ;发件人，收件人，标题，正文，附件文件路径数组 eg:["d:\a.xls","d:\b.doc"]
    NameSpace := "http://schemas.microsoft.com/cdo/configuration/"
    Email := ComObjCreate("CDO.Message")
    Email.From := from
    Email.To := to
    ;Email.Cc := "cc@mail.com" ;抄送
    ;Email.Bcc := "bcc@mail.com" ;暗送
    Email.Subject := subject
    ;Email.Htmlbody := content ;html格式的正文
    Email.Textbody := content ;纯文本格式的正文
    for k,v in attach
    {
    IfExist, % v
    Email.AddAttachment(v)
    }
    Email.Configuration.Fields.Item(NameSpace "sendusing") := 2
    Email.Configuration.Fields.Item(NameSpace "smtpserver") := "smtp.qq.com" ;SMTP服务器地址
    Email.Configuration.Fields.Item(NameSpace "smtpserverport") := 465 ;smtp发送端口 qq：465
    Email.Configuration.Fields.Item(NameSpace "smtpauthenticate") := 1 ;需要验证
    Email.Configuration.Fields.Item(NameSpace "smtpusessl") := true ;使用ssl qq等需要
    Email.Configuration.Fields.Item(NameSpace "sendusername") := "412832768@qq.com" ;邮箱账号
    Email.Configuration.Fields.Item(NameSpace "sendpassword") := "klhsarbswzpbcagb" ;邮箱密码
    Email.Configuration.Fields.update()
     
    Email.Fields.Item("urn:schemas:mailheader:disposition-notification-to") := from ;设置“已读”回执
    Email.Fields.Item("urn:schemas:mailheader:return-receipt-to") := from ;设置“已送达”回执
    Email.Fields.Update()
     
    Email.Send
}