Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA42214D3A
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Jul 2020 16:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgGEOtl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Jul 2020 10:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgGEOtk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Jul 2020 10:49:40 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A822FC061794;
        Sun,  5 Jul 2020 07:49:40 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id k27so1145016pgm.2;
        Sun, 05 Jul 2020 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WxUo/BWpif7dA8qqdOiGfk3KcUDPY7ZlwEmiGmL009k=;
        b=PozhM0vxa4gRPR+hrxboq3ZNOYSVsLKleRac3CX+07bDwpMmSiItfsQ2HOYN8YgX5o
         fK0Q6H2E5kdIdtoW3VKnhVBeZY2F4lnVckRwGZZUiEZHCGPyUrHH9ecuUwSQChN7r9cW
         7A4MiWa0UdD+dZmZYjWduyxUaa9mnGGfDV/HD4sHd3P/5mlnbCQzkA/xoo7yld4yWbnW
         6d2jDBQKDmHEHkqaO4ctgm9dVAr1gY3nx/Ju+pE1YDvuedgeac1OqY6wZm1QiiDXUNHu
         28EYxSA2Jf5tNNUraJaVfSmPc7NERc3Oa4q0TEsxZ/8TMZ98vwiR4oRaIVcuBeITbnV9
         o46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WxUo/BWpif7dA8qqdOiGfk3KcUDPY7ZlwEmiGmL009k=;
        b=OAN4hlLm9fhKbbiJOlYxgpB2lLbJheZZkzVW0qPRXBRAF6mQ9/C1wjvgf4n0P2pPW0
         26JQSA3T8pRuB8SfM26BcJJjqr4CTGHPhrXPFkh9DBh41uxnMqiOmEYDfj+H139hAZYe
         TNdVY4BypIrfL+kBg8ebCOHfTpCC1dO4cOvotr1xU8XawFFtfbVv2uEKHcsgCB9YlLmv
         jDm3nlbHH0UZpzH4WBFQw82mCa2PWfC/8rj/OynPz6Ez1qrG44Hd5GdUYb3k1OJ4M/18
         nzQm5gkNuaJ3ZQpVKqTrzO1Z8eafn3zfLXXfqAE2dGcT16EHwmRI8UF/RaitXmgzYKeL
         Qhaw==
X-Gm-Message-State: AOAM532RThjWm1K1xR4DtSb6FjmGNJjExHTQ88b04gB7ejHWAlgUZR6L
        7TuRqNlF7mOahxDbWUN9e28=
X-Google-Smtp-Source: ABdhPJx/utwpAFRiywr/Ao44HkufHb1ctjp4h85nObIcIfB1vMEamY5g9H/sKkbOldojNJA9v2nF4g==
X-Received: by 2002:a63:1548:: with SMTP id 8mr12062793pgv.172.1593960580184;
        Sun, 05 Jul 2020 07:49:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f18sm16278300pgv.84.2020.07.05.07.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 07:49:39 -0700 (PDT)
Subject: Re: [PATCHv2 3/5] watchdog: rti-wdt: add support for window size
 configuration
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jan.kiszka@siemens.com
References: <20200703120406.7092-1-t-kristo@ti.com>
 <20200703120406.7092-4-t-kristo@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <74679c9b-eb33-1a95-60f4-49575ee71a34@roeck-us.net>
Date:   Sun, 5 Jul 2020 07:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703120406.7092-4-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/3/20 5:04 AM, Tero Kristo wrote:
> RTI watchdog can support different open window sizes. Add support for
> these and add a new module parameter to configure it. The default open
> window size for the driver still remains at 50%.
> 
> Also, modify the margin calculation logic a bit for 32k source clock,
> instead of adding a margin to every window config, assume the 32k source
> clock is running slower.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/watchdog/rti_wdt.c | 112 +++++++++++++++++++++++++++++++------
>  1 file changed, 95 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index d456dd72d99a..110bfc8d0bb3 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -19,7 +19,8 @@
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
>  
> -#define DEFAULT_HEARTBEAT 60
> +#define DEFAULT_HEARTBEAT	60
> +#define DEFAULT_WINDOWSIZE	50
>  
>  /* Max heartbeat is calculated at 32kHz source clock */
>  #define MAX_HEARTBEAT	1000
> @@ -35,9 +36,13 @@
>  
>  #define RTIWWDRX_NMI	0xa
>  
> -#define RTIWWDSIZE_50P	0x50
> +#define RTIWWDSIZE_50P		0x50
> +#define RTIWWDSIZE_25P		0x500
> +#define RTIWWDSIZE_12P5		0x5000
> +#define RTIWWDSIZE_6P25		0x50000
> +#define RTIWWDSIZE_3P125	0x500000
>  
> -#define WDENABLE_KEY	0xa98559da
> +#define WDENABLE_KEY		0xa98559da
>  
>  #define WDKEY_SEQ0		0xe51a
>  #define WDKEY_SEQ1		0xa35c
> @@ -48,7 +53,8 @@
>  
>  #define DWDST			BIT(1)
>  
> -static int heartbeat;
> +static int heartbeat =		DEFAULT_HEARTBEAT;
> +static u32 wsize =		DEFAULT_WINDOWSIZE;
>  
>  /*
>   * struct to hold data for each WDT device
> @@ -62,34 +68,93 @@ struct rti_wdt_device {
>  	struct watchdog_device	wdd;
>  };
>  
> +static int rti_wdt_convert_wsize(void)
> +{
> +	if (wsize >= 50) {
> +		wsize = RTIWWDSIZE_50P;
> +	} else if (wsize >= 25) {
> +		wsize = RTIWWDSIZE_25P;
> +	} else if (wsize > 12) {
> +		wsize = RTIWWDSIZE_12P5;
> +	} else if (wsize > 6) {
> +		wsize = RTIWWDSIZE_6P25;
> +	} else if (wsize > 3) {
> +		wsize = RTIWWDSIZE_3P125;
> +	} else {
> +		pr_err("%s: bad windowsize: %d\n", __func__, wsize);

Please do not use pr_ functions. Pass the watchdog device as argument
and use dev_err().

Also, this function modifies the wsize parameter. When called
again, that parameter will have a  totally different meaning, and
the second call to this function will always set the window size
to 50.

On top of all that, window sizes larger than 50 are set to 50,
window sizes between 4 and 49 are adjusted, and window sizes <= 3
are rejected. That is not exactly consistent.

Does this module parameter really add value / make sense ?
What is the use case ? We should not add such complexity without
use case.

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rti_wdt_setup_hw_hb(struct watchdog_device *wdd)
> +{
> +	/*
> +	 * RTI only supports a windowed mode, where the watchdog can only
> +	 * be petted during the open window; not too early or not too late.
> +	 * The HW configuration options only allow for the open window size
> +	 * to be 50% or less than that.
> +	 */
> +	switch (wsize) {
> +	case RTIWWDSIZE_50P:
> +		/* 50% open window => 50% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 500 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_25P:
> +		/* 25% open window => 75% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 750 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_12P5:
> +		/* 12.5% open window => 87.5% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 875 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_6P25:
> +		/* 6.5% open window => 93.5% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 935 * heartbeat;
> +		break;
> +
> +	case RTIWWDSIZE_3P125:
> +		/* 3.125% open window => 96.9% min heartbeat */
> +		wdd->min_hw_heartbeat_ms = 969 * heartbeat;
> +		break;
> +
> +	default:
> +		pr_err("%s: Bad watchdog window size!\n", __func__);

Same here.

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rti_wdt_start(struct watchdog_device *wdd)
>  {
>  	u32 timer_margin;
>  	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> +	int ret;
>  
>  	/* set timeout period */
> -	timer_margin = (u64)wdd->timeout * wdt->freq;
> +	timer_margin = (u64)heartbeat * wdt->freq;
>  	timer_margin >>= WDT_PRELOAD_SHIFT;
>  	if (timer_margin > WDT_PRELOAD_MAX)
>  		timer_margin = WDT_PRELOAD_MAX;
>  	writel_relaxed(timer_margin, wdt->base + RTIDWDPRLD);
>  
> -	/*
> -	 * RTI only supports a windowed mode, where the watchdog can only
> -	 * be petted during the open window; not too early or not too late.
> -	 * The HW configuration options only allow for the open window size
> -	 * to be 50% or less than that; we obviouly want to configure the open
> -	 * window as large as possible so we select the 50% option. To avoid
> -	 * any glitches, we accommodate 5% safety margin also, so we setup
> -	 * the min_hw_hearbeat at 55% of the timeout period.
> -	 */
> -	wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
> +	ret = rti_wdt_convert_wsize();
> +	if (ret)
> +		return ret;
> +
> +	ret = rti_wdt_setup_hw_hb(wdd);
> +	if (ret)
> +		return ret;
>  

This is the wrong place to validate the window size. It should be done
only once, in the probe function. The start function should not fail
because of a bad window size.

With such parameters, the wsize written into the chip should be kept
in struct rti_wdt_device if it needs to be set more than once.
The module parameter should not be changed, and it should not be used
to store the register value. min_hw_heartbeat_ms needs to be set in the
probe function, not in the start function. Sorry that I didn't notice
that before.

>  	/* Generate NMI when wdt expires */
>  	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>  
> -	/* Open window size 50%; this is the largest window size available */
> -	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
> +	writel_relaxed(wsize, wdt->base + RTIWWDSIZECTRL);
>  
>  	readl_relaxed(wdt->base + RTIWWDSIZECTRL);
>  
> @@ -169,6 +234,14 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * If watchdog is running at 32k clock, it is not accurate.
> +	 * Adjust frequency down in this case so that we don't pet
> +	 * the watchdog too often.
> +	 */
> +	if (wdt->freq > 30000 && wdt->freq < 32768)
> +		wdt->freq = 30000;
> +

Combining that with a window size of 96.9% min heartbeat is asking
for trouble. It will be all but impossible to catch the window with
such constraints if the frequency is really that inaccurate.

>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret) {
> @@ -251,5 +324,10 @@ MODULE_PARM_DESC(heartbeat,
>  		 __MODULE_STRING(MAX_HEARTBEAT) ", default "
>  		 __MODULE_STRING(DEFAULT_HEARTBEAT));
>  
> +module_param(wsize, uint, 0);
> +MODULE_PARM_DESC(wsize,
> +		 "Watchdog open window size in percentage from 3 to 50, "
> +		 "default " __MODULE_STRING(DEFAULT_WINDOW_SIZE));
> +
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:rti-wdt");
> 

