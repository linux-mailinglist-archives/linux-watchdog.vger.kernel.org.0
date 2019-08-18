Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6F591920
	for <lists+linux-watchdog@lfdr.de>; Sun, 18 Aug 2019 21:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHRTAd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 18 Aug 2019 15:00:33 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43921 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfHRTAd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 18 Aug 2019 15:00:33 -0400
Received: by mail-pg1-f195.google.com with SMTP id k3so5588796pgb.10;
        Sun, 18 Aug 2019 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mFXULAn7ELutBem8f4viP3aSr6X1LYAUc/zcz1ZhBSI=;
        b=VSGvMj31C1ExOp9gVidC1e0eiiRZBHzrtjqDwPg77P6r0cOVTrQX3yfoZk/zCH78ga
         RRszMzlVpOw9eEY7mM45BMSGG5dw0CUhR6drMlqTzPLry5h26pByGQv63ETMcKekaViW
         ocCHRbe9IgDKifJcql/tDQfA1GYSKZFPS/8uQg4F6XWRctmuEBcsUxF0QVMjd566AvUO
         XYr+/CTSQjPBmLrQmg1XDBhdBDph3ZfHQTV8cglfZgY5fsLvO49mLwH0KH4TcSuH8IGt
         uFxls9dFu5m4h/vfyC8hRBDAwqNKNbLAOt9gn0Y+FWiA+BdAZeiCQKdHKvEFD5id0mAd
         s6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mFXULAn7ELutBem8f4viP3aSr6X1LYAUc/zcz1ZhBSI=;
        b=npRYn4ZNa3vS/8yA6Angclzm3SezUv/a3G2k0RxrlUoeUNRJKjR7ziFbgaP5K853gi
         VAAI/MuVHLARjrvn6hYT6MTd0akHR2zXGCAwRMaL82OLi1kZNNKtPhAbqYXUCCJlZIQW
         gpKq6KBP5LQqluGBmIJ0zd4eomS2XrCnjXkKojasf+SquR7kWzxY38vaSW5Gdfq7X2iV
         Q9qQRNvNgEdL5lg4hYWW1nzlwh8ZjLz3dNNH3D5x7yJCTp8/Rrxkflvdqhv0I9Wxi0XA
         RFq57ff0G3A24u1Ku7GBLpaxbrdWGG26ZaskLE/ugRXSQYlMkP6+/32NnNQS0bs4+kvG
         q1LQ==
X-Gm-Message-State: APjAAAUrFqjj2XshVPUtUtQ3F+tuhtgnhvS2P/m9Xj5gqPMvLd8HDarK
        urvS4aKAnmdIOWjTjsPPt7xPicDJ
X-Google-Smtp-Source: APXvYqyEzykMz+CQXmFeC70LG5pnlYh7XYrhhSr2pllQisQCbCjf3PSy0nrlOnx69GxhtiLFkROvmw==
X-Received: by 2002:a63:b555:: with SMTP id u21mr17004499pgo.222.1566154832462;
        Sun, 18 Aug 2019 12:00:32 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id u24sm12587674pgk.31.2019.08.18.12.00.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2019 12:00:31 -0700 (PDT)
Subject: Re: [PATCH] watchdog: renesas_wdt: support handover from bootloader
To:     Wolfram Sang <wsa@the-dreams.de>, linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190818180007.2258-1-wsa@the-dreams.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7d1611dd-4f9f-6385-8454-22edf778d6e5@roeck-us.net>
Date:   Sun, 18 Aug 2019 12:00:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818180007.2258-1-wsa@the-dreams.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/18/19 11:00 AM, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Support an already running watchdog by checking its enable bit and set
> up the status accordingly before registering the device. Introduce a new
> flag to remember all this to keep RPM calls balanced.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since RFC:
> 
> * Geert ensured that the module clock for the RWDT will stay active
>    during the boot process because clock will only be stopped at the end
>    of init if there is no refcnt for this clk.
> 
> * So, we make sure to have a refcnt when FW enabled the wdog. Once the
>    first call to open comes, we "transfer" the refcnt to that call.
>    (Is that the correct behaviour? I think it is a tad better than to
>     place the balancing RPM call in remove, but I am open here)
> 
> * Tested with "open_timeout" kernel parameter. System can now reboot
>    if userspace hasn't taken over the watchdog with <n> seconds.
> 
> 
>   drivers/watchdog/renesas_wdt.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 00662a8e039c..11cef69f329b 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -50,6 +50,7 @@ struct rwdt_priv {
>   	struct watchdog_device wdev;
>   	unsigned long clk_rate;
>   	u8 cks;
> +	bool started_by_fw;
>   };
>   
>   static void rwdt_write(struct rwdt_priv *priv, u32 val, unsigned int reg)
> @@ -85,7 +86,11 @@ static int rwdt_start(struct watchdog_device *wdev)
>   	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
>   	u8 val;
>   
> -	pm_runtime_get_sync(wdev->parent);
> +	if (priv->started_by_fw)
> +		/* we already called this function and RPM is active */
> +		priv->started_by_fw = false;

If the HW watchdog is running, the start function should not be called
on open. It would be called after the watchdog was stopped and is then
started again. With that, opening the watchdog the first time would not
call this function, and started_by_fw would remain true. Closing it would
then stopp the watchdog and call pm_runtime_put(). The next open() would
hit the above case, and not call pm_runtime_get_sync(). pm would then be
out of sync.

What am I missing ?

Guenter

> +	else
> +		pm_runtime_get_sync(wdev->parent);
>   
>   	/* Stop the timer before we modify any register */
>   	val = readb_relaxed(priv->base + RWTCSRA) & ~RWTCSRA_TME;
> @@ -194,6 +199,7 @@ static int rwdt_probe(struct platform_device *pdev)
>   	struct clk *clk;
>   	unsigned long clks_per_sec;
>   	int ret, i;
> +	u8 csra;
>   
>   	if (rwdt_blacklisted(dev))
>   		return -ENODEV;
> @@ -213,8 +219,8 @@ static int rwdt_probe(struct platform_device *pdev)
>   	pm_runtime_enable(dev);
>   	pm_runtime_get_sync(dev);
>   	priv->clk_rate = clk_get_rate(clk);
> -	priv->wdev.bootstatus = (readb_relaxed(priv->base + RWTCSRA) &
> -				RWTCSRA_WOVF) ? WDIOF_CARDRESET : 0;
> +	csra = readb_relaxed(priv->base + RWTCSRA);
> +	priv->wdev.bootstatus = csra & RWTCSRA_WOVF ? WDIOF_CARDRESET : 0;
>   	pm_runtime_put(dev);
>   
>   	if (!priv->clk_rate) {
> @@ -252,6 +258,14 @@ static int rwdt_probe(struct platform_device *pdev)
>   	/* This overrides the default timeout only if DT configuration was found */
>   	watchdog_init_timeout(&priv->wdev, 0, dev);
>   
> +	/* Check if FW enabled the watchdog */
> +	if (csra & RWTCSRA_TME) {
> +		/* Ensure properly initialized dividers */
> +		rwdt_start(&priv->wdev);
> +		set_bit(WDOG_HW_RUNNING, &priv->wdev.status);
> +		priv->started_by_fw = true;
> +	}
> +
>   	ret = watchdog_register_device(&priv->wdev);
>   	if (ret < 0)
>   		goto out_pm_disable;
> 

