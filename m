Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4A410EAF5
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 14:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfLBNiF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 08:38:05 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39594 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfLBNiE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 08:38:04 -0500
Received: by mail-ot1-f68.google.com with SMTP id 77so9880285oty.6
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Dec 2019 05:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IjuEa167Bh5HeMX1ILaT+dLmNB7MaoZqyt3FweB2lKI=;
        b=GbCPhOK0VIaZkW0Hm99WKVIRdkShcoR7EbgSwpy5u0WKV/zz9UlIHwOjRMZDgjrCYe
         /WGwIjHSVd+kWdXEvAgpK5DW7nkDmbd4eSZGXYVA8GBzBCKoML9Z6vP/xJKt5yikFFrc
         J3ez0R14j5CDLBLQq3EOmQ4G6WC2/3ZkNS2b6g6h0ppeKnPJj+Ng82P6fZy55pRzjOtm
         fbMJrqfxA5GWvTz3Ujl/YJUqkVkUZXyHu0ZpBgMVXqs6kwCL0M9kcfYSkR/WxdZKQDjt
         0zGI2m5thXjrJ2cPgTBoksbig2y7Xo7QVrnbMqq6+2a5D61ReDc8ElleUshHojxDXLy0
         4ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IjuEa167Bh5HeMX1ILaT+dLmNB7MaoZqyt3FweB2lKI=;
        b=PS/Rs77zjSNj0YBjttZm5jPkACa95UPKUy9OlQRSMRSEihKGvoA1OJDsDyWTrlwk+s
         KCfVxYbGkzOyi0czMuK9/90oXZptRwFLJsQ3pVnmuMh3yG0K2m5tLFTrq7g7T0xZC7rz
         1ZIYLAyilmWS5PYIdgiA/Z8jCj9FJXpiJSlwjL5N7L7d+068UR9h+cKuUxVwak0K8aG4
         rx+fXPTGWVxXuF4J1oPLpSAyJeAtvfF3RD5WMyqpWHlISzo3YhcEoQfOQbMfJYuWnrpd
         b7UwIzxjPDULywn5HY9hfFzqaR1AwSg8q0QCWkio0YrsgarTh9dyijbQY5xkF2fJGoGm
         bnWQ==
X-Gm-Message-State: APjAAAXAcppuOrERereHvFoP5cfHbza9DBOywJJBorcp+VXaMq+L9VTT
        y6wdNWo/QRpw7wulhnYpYko=
X-Google-Smtp-Source: APXvYqzYXJ8EYlanRrCvRMaLXOMc0HHTME71Dg9RJurlPLH8i6yRfQOZ1ew7AVWXnpfs/vuHP1MyTA==
X-Received: by 2002:a9d:3982:: with SMTP id y2mr21776048otb.191.1575293883667;
        Mon, 02 Dec 2019 05:38:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g23sm10805196otl.1.2019.12.02.05.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 05:38:02 -0800 (PST)
Subject: Re: [PATCH] watchdog: da9062: add power management ops
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
 <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202130314.dzne7eh2b5sb46c2@pengutronix.de>
 <AM5PR1001MB099461A4E8253F74FC11D6E480430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1feb2b8e-af46-ffa9-873a-fd9b624294b9@roeck-us.net>
Date:   Mon, 2 Dec 2019 05:38:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB099461A4E8253F74FC11D6E480430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/2/19 5:27 AM, Adam Thomson wrote:
> Hi Marco,
> 
>>> Hmmm. Wouldn't that then be a board specific fix rather than this change?
>>> Am concerned relying on software to reenable the watchdog on resume could
>> allow
>>> for a hang scenario potentially if that code never gets to execute. Other
>>> systems shouldn't need this fix, assuming they don't have issues at the HW
>>> level, so this this seems like it could be making those systems less robust. If
>>> we are to do this at the driver level, maybe this should be an option through DT
>>> to help faulty systems, but I'm thinking this shouldn't be default behaviour.
>>
>> I don't think that we should rely on the OTP values. Those values are
>> set by Dialog, the SoM manufacturers or by the customer itself and the
>> time shows that this is error prone too. At least if the customer or the
>> SoM manufacturer don't ask the Dialog Support..
>>
>> You're right with the (re-)enabling but there are other drivers using
>> such an approach.. IMHO it is safer to go this way rather than trust
>> the OTP and the PCB layout. I would rather add a dt-compatible to tell
>> the driver to do nothing during suspend/resume e.g.:
>>
>>      - dlg,use-hw-pm
>>
>> or something. Because the user needs to validate the PCB and the OTP
>> values.
> 
> The thing is the DT FW is supposed to be fairly static so I would rather not
> enforce this change on users if they adopt a kernel version with this update in.
> I also still think it's safer if the HW does this for us. I would have hoped for
> most designs this would be caught in early bring up where it can be rectified
> with minimal impact, although I'm guessing that's not the case in your scenario.
> 

dla,use-sw-pm ?
dla,hw-pm-broken ?

Guenter

