Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46405B167F
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2019 00:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfILW4J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Sep 2019 18:56:09 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33091 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfILW4J (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Sep 2019 18:56:09 -0400
Received: by mail-qt1-f193.google.com with SMTP id r5so31677100qtd.0
        for <linux-watchdog@vger.kernel.org>; Thu, 12 Sep 2019 15:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9NWnNVgY46MWHRXDeQuOe4RyI978hp0KMY9NEZkdyzc=;
        b=pzm0JwXLGxqxafpFrf7m1pw8rul28NCOUrQAd+QOxQ2vc/BKmh5k1Ytg/FDsNZfwDx
         TnzwGctnBHQp8O2vPYCVh/A0Ik4VE9RyekgrQP7CSz7hs9MCcslTZrJc9fqs4Qx3vYNg
         Vl6HN3UEJZDNcbohHCm+Ah4dWBlCeEdJEedzA4ciyo9rJURKqgQCezU1U+zPB/p9HOLu
         AqofDGISpIBe2cvDPeMqRYDvaWDJtwZq8HFyhRekqSBbL+qu2TJrvjnPIN4irx38FPoU
         jErbGTae/n7nGMYfOQwXt67zr69o0WSfzdd5LLkjMUkm/yLHRtUGhT/XtkKxAnPlBRo0
         vE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9NWnNVgY46MWHRXDeQuOe4RyI978hp0KMY9NEZkdyzc=;
        b=ZHLnL9RTS227rTsAUqUL0Ytzx54j9KvuyXdewRopd40hvYg3tVFMlqal09g8yHWW5p
         gci962T/rIQQekXQ5HtM5KCVqSIO14AzCpl3q23jzVKfxrRPc9Rc+m0Y7fhoXzVqsGrw
         btmItipeXCR5b1L57NmebWNc+iZaZyw2NhtJOXkenxf0YD/P0Xwv6koFxHLRGLNcFeSr
         NZc3JVwGRaBKo2WHVwfo4T2wtXJ1qPWsEDzsIPPUzkkKo8OKKeRglLoJRSTj3Wcs/c/W
         MV7C6UtKuypXSo4qd7QCH78qiH1g76wm6/LF8lAX/fqEg0ewxBlYkO5/0Qdl3ugYkRNH
         4Vaw==
X-Gm-Message-State: APjAAAWZAVZCCcG+qgAicl4EHEaR3+AVwPA8stqyydPh0XDWUPcOcN4Y
        U3VFXfhRuBYt3mITaGzU95AdOg==
X-Google-Smtp-Source: APXvYqzSTywME30/SZ/nHNk3h9um0nT/5KnTol4NNiDZIsPAX0iZn5ISK3uMDo2zqZzqRkKwdZ6fbQ==
X-Received: by 2002:a05:6214:370:: with SMTP id t16mr29194618qvu.245.1568328968134;
        Thu, 12 Sep 2019 15:56:08 -0700 (PDT)
Received: from [172.16.3.132] (96-94-100-129-static.hfc.comcastbusiness.net. [96.94.100.129])
        by smtp.googlemail.com with ESMTPSA id a36sm14323555qtk.21.2019.09.12.15.56.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 15:56:07 -0700 (PDT)
From:   Jaret Cantu <jaret.cantu@timesys.com>
Subject: Re: [PATCH] watchdog: f71808e_wdt: Add F81803 support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190912175550.9340-1-jaret.cantu@timesys.com>
 <20190912185037.GC5065@roeck-us.net>
Message-ID: <66294009-27e1-cfd8-1e16-475cc51903b8@timesys.com>
Date:   Thu, 12 Sep 2019 18:55:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190912185037.GC5065@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/12/19 2:50 PM, Guenter Roeck wrote:
> On Thu, Sep 12, 2019 at 01:55:50PM -0400, Jaret Cantu wrote:
>> This adds watchdog support for the Fintek F81803 Super I/O chip.
>>
>> Testing was done on the Seneca XK-QUAD.
>>
>> Signed-off-by: Jaret Cantu <jaret.cantu@timesys.com>
> 
> Since there is no datasheet, we can only hope that this works
> for other platforms using the same chip. Nothing we can do
> about that, so

I did get the register descriptions after hounding the vendor's support 
team for a good long while, which is how I was able to get the watchdog 
working in the first place.  Nothing publicly available, however.

The only real difference between this part and others in the family is 
requiring a bank select before setting the WDTRST pin.  (And the 
registers/bits which have to be twiddled to do so, of course.)

> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
>> ---
>>   drivers/watchdog/Kconfig       |  4 ++--
>>   drivers/watchdog/f71808e_wdt.c | 17 ++++++++++++++++-
>>   2 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 8188963a405b..781ff835f2a4 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1046,8 +1046,8 @@ config F71808E_WDT
>>   	depends on X86
>>   	help
>>   	  This is the driver for the hardware watchdog on the Fintek F71808E,
>> -	  F71862FG, F71868, F71869, F71882FG, F71889FG, F81865 and F81866
>> -	  Super I/O controllers.
>> +	  F71862FG, F71868, F71869, F71882FG, F71889FG, F81803, F81865, and
>> +	  F81866 Super I/O controllers.
>>   
>>   	  You can compile this driver directly into the kernel, or use
>>   	  it as a module.  The module will be called f71808e_wdt.
>> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
>> index ff5cf1b48a4d..e46104c2fd94 100644
>> --- a/drivers/watchdog/f71808e_wdt.c
>> +++ b/drivers/watchdog/f71808e_wdt.c
>> @@ -31,8 +31,10 @@
>>   #define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
>>   #define SIO_REG_DEVREV		0x22	/* Device revision */
>>   #define SIO_REG_MANID		0x23	/* Fintek ID (2 bytes) */
>> +#define SIO_REG_CLOCK_SEL	0x26	/* Clock select */
>>   #define SIO_REG_ROM_ADDR_SEL	0x27	/* ROM address select */
>>   #define SIO_F81866_REG_PORT_SEL	0x27	/* F81866 Multi-Function Register */
>> +#define SIO_REG_TSI_LEVEL_SEL	0x28	/* TSI Level select */
>>   #define SIO_REG_MFUNCT1		0x29	/* Multi function select 1 */
>>   #define SIO_REG_MFUNCT2		0x2a	/* Multi function select 2 */
>>   #define SIO_REG_MFUNCT3		0x2b	/* Multi function select 3 */
>> @@ -49,6 +51,7 @@
>>   #define SIO_F71869A_ID		0x1007	/* Chipset ID */
>>   #define SIO_F71882_ID		0x0541	/* Chipset ID */
>>   #define SIO_F71889_ID		0x0723	/* Chipset ID */
>> +#define SIO_F81803_ID		0x1210	/* Chipset ID */
>>   #define SIO_F81865_ID		0x0704	/* Chipset ID */
>>   #define SIO_F81866_ID		0x1010	/* Chipset ID */
>>   
>> @@ -108,7 +111,7 @@ MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
>>   	" given initial timeout. Zero (default) disables this feature.");
>>   
>>   enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
>> -	     f81865, f81866};
>> +	     f81803, f81865, f81866};
>>   
>>   static const char *f71808e_names[] = {
>>   	"f71808fg",
>> @@ -118,6 +121,7 @@ static const char *f71808e_names[] = {
>>   	"f71869",
>>   	"f71882fg",
>>   	"f71889fg",
>> +	"f81803",
>>   	"f81865",
>>   	"f81866",
>>   };
>> @@ -370,6 +374,14 @@ static int watchdog_start(void)
>>   			superio_inb(watchdog.sioaddr, SIO_REG_MFUNCT3) & 0xcf);
>>   		break;
>>   
>> +	case f81803:
>> +		/* Enable TSI Level register bank */
>> +		superio_clear_bit(watchdog.sioaddr, SIO_REG_CLOCK_SEL, 3);
>> +		/* Set pin 27 to WDTRST# */
>> +		superio_outb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
>> +			superio_inb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL));
>> +		break;
>> +
>>   	case f81865:
>>   		/* Set pin 70 to WDTRST# */
>>   		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 5);
>> @@ -809,6 +821,9 @@ static int __init f71808e_find(int sioaddr)
>>   		/* Confirmed (by datasheet) not to have a watchdog. */
>>   		err = -ENODEV;
>>   		goto exit;
>> +	case SIO_F81803_ID:
>> +		watchdog.type = f81803;
>> +		break;
>>   	case SIO_F81865_ID:
>>   		watchdog.type = f81865;
>>   		break;
>> -- 
>> 2.11.0
>>
