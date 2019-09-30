Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D45C21AD
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2019 15:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731211AbfI3NRe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Sep 2019 09:17:34 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44850 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3NRe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Sep 2019 09:17:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so5590041pfn.11;
        Mon, 30 Sep 2019 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lyjxLghcbPT/guXD86JE2tkfP9LwZRh+SOW/3r4IE0k=;
        b=K4Me9AbzWb0e36PT1RsITpHnGoILWsd5427QwnSCROrxI8VBVpspAQ6nRIzi7NA8Yn
         57ZD4FqtDnmz5HuabUkCGTso9R7y3I8Vm6mJjZjQR4uJkiflPUKE9KV9JDxz4Ibnuj9P
         K6HdrGOHt2e2MLp8rdaATbgAkLHOwXs6LjtqzM6F4yYSzTZBR6cGMda/6TqP3Iwssc4f
         8EJnd0XT1F73jg0qhZFLTU5EX3Tyrpo//WWQDII+o0x1o+fGsuyi/OrEXu6swwTKEnSn
         w9s15QoapIOOScFiVI+HgZskTz/+kFV72evMnMH6eKX9cE8Q0GF+CsSkTf6OHKz0BcEM
         OTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lyjxLghcbPT/guXD86JE2tkfP9LwZRh+SOW/3r4IE0k=;
        b=WfCDAfuyHh6bFCQAjY6o2Lsi7gp4AdGuqXrXJEf+sAxcsONTnCENupsfjU+ibkMY85
         39Dsn8hFMF3qivwbD/7yq5x+kjExzzCl8aj4oWhjfUi/LIk2HrTfuQEMPHjshvwjpmMe
         29zy7w1RPTYTGoLUudbPQXIbfLsRgIpGSRvjR0LPxWH0os21A6Obbs6Chhs0mVB1tFqP
         tyGvPaUrCdPrlrwLQXpacOByw4M9mUhuT2O5Q5q4gA/vTlX8nc6Bml5XpjYCqrkIycL0
         M5kP1el1j4I6hJj8Dt3ROUii06W0Btr5kTglgaEVnaWMWUQoliVaKB/r6/cmcx/8HNXE
         fZig==
X-Gm-Message-State: APjAAAWzuCFzil2H12S4/WFSHgV1EqsMeVcJlyhPNVWZo5NrZBYvzS94
        ZWBjpWPyNKu17Z6MIMCoCGA=
X-Google-Smtp-Source: APXvYqw2pu0gcwNDmR9jMGGlX/s5QhDeUO87p2+wVCm/9EfBUDnUV9c1aZTkY/ExoTEP0eKPr2VX5Q==
X-Received: by 2002:a63:d05:: with SMTP id c5mr23721805pgl.182.1569849453673;
        Mon, 30 Sep 2019 06:17:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n3sm10936090pff.102.2019.09.30.06.17.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 06:17:33 -0700 (PDT)
Date:   Mon, 30 Sep 2019 06:17:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 2/3] watchdog: imx2_wdt: Use __maybe_unused instead of
 #if CONFIG_PM_SLEEP
Message-ID: <20190930131732.GB29750@roeck-us.net>
References: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
 <1569308828-8320-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569308828-8320-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 24, 2019 at 03:07:07PM +0800, Anson Huang wrote:
> Use __maybe_unused for power management related functions instead
> of #if CONFIG_PM_SLEEP to simply the code.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx2_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index 6711b4e..034f32c 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -358,9 +358,8 @@ static void imx2_wdt_shutdown(struct platform_device *pdev)
>  	}
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  /* Disable watchdog if it is active or non-active but still running */
> -static int imx2_wdt_suspend(struct device *dev)
> +static int __maybe_unused imx2_wdt_suspend(struct device *dev)
>  {
>  	struct watchdog_device *wdog = dev_get_drvdata(dev);
>  	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
> @@ -381,7 +380,7 @@ static int imx2_wdt_suspend(struct device *dev)
>  }
>  
>  /* Enable watchdog and configure it if necessary */
> -static int imx2_wdt_resume(struct device *dev)
> +static int __maybe_unused imx2_wdt_resume(struct device *dev)
>  {
>  	struct watchdog_device *wdog = dev_get_drvdata(dev);
>  	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
> @@ -406,7 +405,6 @@ static int imx2_wdt_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static SIMPLE_DEV_PM_OPS(imx2_wdt_pm_ops, imx2_wdt_suspend,
>  			 imx2_wdt_resume);
> -- 
> 2.7.4
> 
