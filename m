Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96BAF4E3EB3
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Mar 2022 13:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbiCVMpI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Mar 2022 08:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbiCVMpG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Mar 2022 08:45:06 -0400
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com [192.185.148.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DDB13D7A
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Mar 2022 05:43:36 -0700 (PDT)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 57C86929AB
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Mar 2022 07:43:31 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id WdrHnwc08dx86WdrHniEmt; Tue, 22 Mar 2022 07:43:31 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NOG0r8IbDAb6p8u6dWl5ZY8qGYfH+jUePyVup6Q0jb0=; b=uOTNbqB8nPp0Nmv9MeZdeb5xH+
        2q8DEJpFvMLcVtfYGY61s5MldBMTmasr6GtyL+bqSILCR4AVXiQBrKB6VBQulsz0QoLmrQRdQiio2
        sg3hnk/5gqabDO1TWRL8gYYEonLqI2l7uE3iCVcvMM0Jfod6higN0gMIn62/Hewmnl7h37gep2CUi
        9yVTa+qEz/hQnh0ufAgNOc7ul2eI0g+tiQV6JeYwj2wlnFtfpslCdt2onVpnopyb955QCyydnXvd0
        UJB7rk3GWDmAqDV3kwqVwUvdv5r+qNIHYSargiy54UMKQsahIJVwNUEx0TtGnbMcqRhnDGeBiEdBR
        GX4MlCAg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54394)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nWdrG-002MNh-Ts; Tue, 22 Mar 2022 12:43:30 +0000
Message-ID: <42d866cd-c781-5c2a-7f4f-c33cba954843@roeck-us.net>
Date:   Tue, 22 Mar 2022 05:43:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     =?UTF-8?Q?Sondhau=c3=9f=2c_Jan?= <Jan.Sondhauss@wago.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20220322083754.50322-1-jan.sondhauss@wago.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drivers: watchdog: omap_wdt: ensure working trigger
 pattern
In-Reply-To: <20220322083754.50322-1-jan.sondhauss@wago.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nWdrG-002MNh-Ts
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54394
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 10
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/22/22 01:38, Sondhauß, Jan wrote:
> When the watchdog is initialized and triggered before the kernel runs,
> it must be ensured that the kernel uses a different trigger pattern.
> Otherwise the watchdog cannot be kicked.
> 
> Reading the current counter reload trigger pattern from the watchdog
> hardware during probing makes sure that the trigger pattern is different
> from the one previously used.
> 

It is kind of annoying that u-boot uses the same trigger pattern. Question
though: What happens if the register was not initialized by the ROM monitor
and contains the power-up value. Is the chip ok with using that as base ?

If not it might be easier to just use some other pattern like 0xfeedface
or even some pseudo-random value.

Thanks,
Guenter

> Signed-off-by: Jan Sondhauss <jan.sondhauss@wago.com>
> ---
>   drivers/watchdog/omap_wdt.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index 74d785b2b478..680a34588425 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -85,6 +85,13 @@ static void omap_wdt_reload(struct omap_wdt_dev *wdev)
>   	/* reloaded WCRR from WLDR */
>   }
>   
> +static void omap_wdt_init_trgr_pattern(struct omap_wdt_dev *wdev)
> +{
> +	void __iomem    *base = wdev->base;
> +
> +	wdev->wdt_trgr_pattern = readl_relaxed(base + OMAP_WATCHDOG_TGR);
> +}
> +
>   static void omap_wdt_enable(struct omap_wdt_dev *wdev)
>   {
>   	void __iomem *base = wdev->base;
> @@ -238,7 +245,6 @@ static int omap_wdt_probe(struct platform_device *pdev)
>   
>   	wdev->omap_wdt_users	= false;
>   	wdev->dev		= &pdev->dev;
> -	wdev->wdt_trgr_pattern	= 0x1234;
>   	mutex_init(&wdev->lock);
>   
>   	/* reserve static register mappings */
> @@ -253,6 +259,8 @@ static int omap_wdt_probe(struct platform_device *pdev)
>   	wdev->wdog.timeout = TIMER_MARGIN_DEFAULT;
>   	wdev->wdog.parent = &pdev->dev;
>   
> +	omap_wdt_init_trgr_pattern(wdev);
> +
>   	watchdog_init_timeout(&wdev->wdog, timer_margin, &pdev->dev);
>   
>   	watchdog_set_nowayout(&wdev->wdog, nowayout);

