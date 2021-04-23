Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE3E369467
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 16:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhDWOL3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Apr 2021 10:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhDWOL2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Apr 2021 10:11:28 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB74C061574;
        Fri, 23 Apr 2021 07:10:52 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso12431431otp.7;
        Fri, 23 Apr 2021 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qak1guLsFaVMEg76NWs9738tomTF2Dz1lxZ3efNAG0U=;
        b=jS9/Z3CCoeecneKXeYcJbiT0ZSETuulNxBA2Rks2IKP0nYOr+IJk/acLov7r0lRWiY
         XptUVazd19lCfjGWxOKlOwYv5H/G7GCg/0bSxU3mX43YOM4N1uVvQYSn0xm7+g1sP+8A
         xt3hyaBl4Ymb1qelw5VA44anr6Btfwdfp35/pSy7mbcq+LSdaJSP5+p1lU32MFVXbRUc
         AUdAfiHADCHTjHbZVkZ8lMqwd9XtqRPJXe/IWnGj40ELcKM1dcWEjtTX+3VzvG7CDR3l
         oeRa/4wm0eHSR3SagsNkZ1O/6eeO48Uj+uIVPrrt3lWpAd/MZbAVK0nWNfKY4OrW5GbI
         2YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=qak1guLsFaVMEg76NWs9738tomTF2Dz1lxZ3efNAG0U=;
        b=C1/ZipoJijsQ+LDMtprCIFJI3PcX9qT9LkONh/FXgD0V4woODBNe9T8Bzk2B4mptK0
         9WFa0HzOJu2p0GJfS7lMBTkX9S73L1rAXm1nq1GMh2P+sDJlKWJAoEuiMDBfAceU6TMT
         3nJPaFzqym9xVXKWcjv/BypZa+mQN1+Tn5hzFsHac0T8HcZ/WuNpVtQeoqzIdk39sY3K
         pO9KIdY/K0+7hdzeg5EpuFpuUfuDrUcNBIIp2CMeJYC62Qd2Cd406s8sJiAO9lkZwRLa
         gdK/LTlY1MBOfKkHjLfMnc//2byEkQnYGnw5X4Ed5EUfeEzOfF2KNIcShqC+IOIVH1Y2
         JgPg==
X-Gm-Message-State: AOAM532wqkQJLXrkTbfc54YWDhSJdpN4Gv9cgLjYWTWI4L14wGZOF8dp
        Eu8nqnmsIKMjEdXhj8IDVyYrAe4t6o0=
X-Google-Smtp-Source: ABdhPJzSVkLH9+HgtRnqrxQZiXB8Wq3cxnjPCT8u2XksDMM50cM6xpu4hbW3pFN1lfgpHrF1XnUuxw==
X-Received: by 2002:a9d:6842:: with SMTP id c2mr3690276oto.139.1619187051462;
        Fri, 23 Apr 2021 07:10:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v81sm1275222oie.13.2021.04.23.07.10.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 07:10:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 23 Apr 2021 07:10:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?utf-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH V7 1/2] watchdog: mtk: support pre-timeout when the
 bark irq is available
Message-ID: <20210423141048.GA135134@roeck-us.net>
References: <3acb9bb1-763b-5af7-de3c-d7d8d3f5b2f7@roeck-us.net>
 <AGAAwgADDgCvfda5u2TY64qq.3.1619161944242.Hmail.wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AGAAwgADDgCvfda5u2TY64qq.3.1619161944242.Hmail.wangqing@vivo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 23, 2021 at 03:12:24PM +0800, 王擎 wrote:
> 
> >On 4/22/21 8:48 PM, 王擎 wrote:
> >> 
> >>> On 4/22/21 7:53 PM, Wang Qing wrote:
> >>>> Use the bark interrupt as the pretimeout notifier if available.
> >>>>
> >>>> When the watchdog timer expires in dual mode, an interrupt will be
> >>>> triggered first, then the timing restarts. The reset signal will be
> >>>> initiated when the timer expires again.
> >>>>
> >>>> The pretimeout notification shall occur at timeout-sec/2.
> >>>>
> >>>> V2:
> >>>> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
> >>>>
> >>>> V3:
> >>>> - Modify the pretimeout behavior, manually reset after the pretimeout
> >>>> - is processed and wait until timeout.
> >>>>
> >>>> V4:
> >>>> - Remove pretimeout related processing. 
> >>>> - Add dual mode control separately.
> >>>>
> >>>> V5:
> >>>> - Fix some formatting and printing problems.
> >>>>
> >>>> V6:
> >>>> - Realize pretimeout processing through dualmode.
> >>>>
> >>>> V7:
> >>>> - Add set_pretimeout().
> >>>>
> >>>> Signed-off-by: Wang Qing <wangqing@vivo.com>
> >>>> ---
> >>>>  drivers/watchdog/mtk_wdt.c | 76 +++++++++++++++++++++++++++++++++++++++++++---
> >>>>  1 file changed, 71 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> >>>> index 97ca993..ab3ac5d
> >>>> --- a/drivers/watchdog/mtk_wdt.c
> >>>> +++ b/drivers/watchdog/mtk_wdt.c
> >>>> @@ -25,6 +25,7 @@
> >>>>  #include <linux/reset-controller.h>
> >>>>  #include <linux/types.h>
> >>>>  #include <linux/watchdog.h>
> >>>> +#include <linux/interrupt.h>
> >>>>  
> >>>>  #define WDT_MAX_TIMEOUT		31
> >>>>  #define WDT_MIN_TIMEOUT		1
> >>>> @@ -184,15 +185,23 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
> >>>>  {
> >>>>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> >>>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
> >>>> +	unsigned int timeout_interval = timeout;
> >>>>  	u32 reg;
> >>>>  
> >>>>  	wdt_dev->timeout = timeout;
> >>>> -
> >>>> +	/*
> >>>> +	 * In dual mode, irq will be triggered at timeout / 2
> >>>> +	 * the real timeout occurs at timeout
> >>>> +	 */
> >>>> +	if (wdt_dev->pretimeout) {
> >>>> +		wdt_dev->pretimeout = timeout / 2;
> >>>
> >>> min_timeout is set to 1. I don't this works well if timeout == 1.
> >>> You'll either need to set min_timeout to 2, or handle that case.
> >> 
> >> It is appropriate to change min_timeout  to 2.
> >> 
> >>>
> >>>> +		timeout_interval = wdt_dev->pretimeout;
> >>>
> >>> timeout_interval is unnecessary. Just update timeout accordingly.
> >>> It needs to take the situation of timeout == 1 into account, though.
> 
> I plan to remove timeout_interval and directly use (timeout-pretimeout)
> update timeout.
> 
> >> 
> >> timeout represents the reset time. When the user calls timeout_show, 
> >> He hopes to get the configured timeout, not the value changed
> >> by pre-timeout.
> >> I modify it like this more in line with the original intention.
> >> 
> >>>
> >>>> +	}
> >>>>  	/*
> >>>>  	 * One bit is the value of 512 ticks
> >>>>  	 * The clock has 32 KHz
> >>>>  	 */
> >>>> -	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
> >>>> +	reg = WDT_LENGTH_TIMEOUT(timeout_interval << 6) | WDT_LENGTH_KEY;
> >>>>  	iowrite32(reg, wdt_base + WDT_LENGTH);
> >>>>  
> >>>>  	mtk_wdt_ping(wdt_dev);
> >>>> @@ -239,13 +248,46 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
> >>>>  		return ret;
> >>>>  
> >>>>  	reg = ioread32(wdt_base + WDT_MODE);
> >>>> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> >>>> +	if (wdt_dev->pretimeout)
> >>>> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> >>>> +	else
> >>>> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> >>>>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
> >>>>  	iowrite32(reg, wdt_base + WDT_MODE);
> >>>>  
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> +static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
> >>>> +					unsigned int timeout)
> >>>> +{
> >>>> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
> >>>> +	void __iomem *wdt_base = mtk_wdt->wdt_base;
> >>>> +	u32 reg = ioread32(wdt_base + WDT_MODE);
> >>>> +
> >>>> +	if (timeout && !wdd->pretimeout) {
> >>>> +		wdd->pretimeout = wdd->timeout / 2;
> >>>> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> >>>> +	} else if (!timeout && wdd->pretimeout) {
> >>>> +		wdd->pretimeout = 0;
> >>>> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> >>>> +	} else
> >>>> +		return 0;

Please run your patch through checkpatch; the above results
in a note about a missing { }.

> >>>> +
> >>>> +	iowrite32(reg, wdt_base + WDT_MODE);
> >>>
> >>> What is the point of setting the mode here ? It will
> >>> be set again in mtk_wdt_set_timeout(). Seems to me all
> >>> you need to do here is to set wdd->pretimeout,
> >>> then call mtk_wdt_set_timeout().
> >> 
> >> mtk_wdt_set_timeout() only set timeout and ping().
> >> Here also need to config to the dualmode or not.
> >> 
> >Ah, you are correct. Sorry, I confused this with the start function.
> >That makes me wonder if it would be better to extract a separate
> >function, mtk_wdt_set_mode(), for that purpose. Thoughts ?
> 
> I have done this, but I found there is no good abstract method, 
> because wdt mode is used in combination, for example：
> WDT_MODE_EN is included in start(), and here is not.
> And the judgment of pretimeout here is also different.
> 
Ok, makes sense. Another minor comment above, though.

Thanks,
Guenter

> Thanks,
> Qing
> 
> >
> >Thanks,
> >Guenter
> >
> >> Thanks,
> >> Qing
> >>>
> >>> Guenter
> >>>
> >>>> +
> >>>> +	return mtk_wdt_set_timeout(wdd, wdd->timeout);
> >>>> +}
> >>>> +
> >>>> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
> >>>> +{
> >>>> +	struct watchdog_device *wdd = arg;
> >>>> +
> >>>> +	watchdog_notify_pretimeout(wdd);
> >>>> +
> >>>> +	return IRQ_HANDLED;
> >>>> +}
> >>>> +
> >>>>  static const struct watchdog_info mtk_wdt_info = {
> >>>>  	.identity	= DRV_NAME,
> >>>>  	.options	= WDIOF_SETTIMEOUT |
> >>>> @@ -253,12 +295,21 @@ static const struct watchdog_info mtk_wdt_info = {
> >>>>  			  WDIOF_MAGICCLOSE,
> >>>>  };
> >>>>  
> >>>> +static const struct watchdog_info mtk_wdt_pt_info = {
> >>>> +	.identity	= DRV_NAME,
> >>>> +	.options	= WDIOF_SETTIMEOUT |
> >>>> +			  WDIOF_PRETIMEOUT |
> >>>> +			  WDIOF_KEEPALIVEPING |
> >>>> +			  WDIOF_MAGICCLOSE,
> >>>> +};
> >>>> +
> >>>>  static const struct watchdog_ops mtk_wdt_ops = {
> >>>>  	.owner		= THIS_MODULE,
> >>>>  	.start		= mtk_wdt_start,
> >>>>  	.stop		= mtk_wdt_stop,
> >>>>  	.ping		= mtk_wdt_ping,
> >>>>  	.set_timeout	= mtk_wdt_set_timeout,
> >>>> +	.set_pretimeout	= mtk_wdt_set_pretimeout,
> >>>>  	.restart	= mtk_wdt_restart,
> >>>>  };
> >>>>  
> >>>> @@ -267,7 +318,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >>>>  	struct device *dev = &pdev->dev;
> >>>>  	struct mtk_wdt_dev *mtk_wdt;
> >>>>  	const struct mtk_wdt_data *wdt_data;
> >>>> -	int err;
> >>>> +	int err, irq;
> >>>>  
> >>>>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> >>>>  	if (!mtk_wdt)
> >>>> @@ -279,7 +330,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >>>>  	if (IS_ERR(mtk_wdt->wdt_base))
> >>>>  		return PTR_ERR(mtk_wdt->wdt_base);
> >>>>  
> >>>> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> >>>> +	irq = platform_get_irq(pdev, 0);
> >>>> +	if (irq > 0) {
> >>>> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
> >>>> +					&mtk_wdt->wdt_dev);
> >>>> +		if (err)
> >>>> +			return err;
> >>>> +
> >>>> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
> >>>> +		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
> >>>> +	} else {
> >>>> +		if (irq == -EPROBE_DEFER)
> >>>> +			return -EPROBE_DEFER;
> >>>> +
> >>>> +		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> >>>> +	}
> >>>> +
> >>>>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
> >>>>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
> >>>>  	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
> >>>>
> >>>
> >> 
> >> 
> >
> 
> 
