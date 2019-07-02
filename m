Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA5B55D0E2
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Jul 2019 15:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfGBNkk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Jul 2019 09:40:40 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34431 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfGBNkk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Jul 2019 09:40:40 -0400
Received: by mail-pg1-f193.google.com with SMTP id p10so7723544pgn.1;
        Tue, 02 Jul 2019 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TG01TGISb1yaWBogYU6mOa7ow9eBYHJfFmPCCNfkb5M=;
        b=smcXrkSUJ7rZrYSKdhGuS234aAc2L4NUovI+9Jh5zaHdqd8Lc2ZLImzROrsYAaRluZ
         hjRjyDZ3IuV7aW2oLPDRhlT38+mFZAoimJPMrL9oa9sI79lrXWiJhK33ucc9HEBRdT/3
         wdMiB+8W7xVE0UCW2Ajunyn0LUBpXKOI8yf2edhyqZLuAhq70tUNf9tzJkuTa9LSuZii
         NO9TRqdLZs30F408XkvP507HQaEXLvPDl/OgiA/W15XNKKlgshlaov5KrWLW2T74Wn/y
         QD7stJDgihpq5zUOuhv0mOX2d14sa3fhvO4BiXEJElF9tk3/FNx3FQU1YOe/RJQPWKuQ
         /W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=TG01TGISb1yaWBogYU6mOa7ow9eBYHJfFmPCCNfkb5M=;
        b=g3W9XBt4B/xAwqnXHFNkMxePezPNRYvzDURcvBNkVWgD10JAQEJmY/eNSpB7zZCqBy
         K+Xzos7QBBDFQ58PHlTEShaT6Z8LT7OKk59tIZPx2Hms8IlMpIsKa3P9q4+XJuuzOnYM
         cZX/4HbPU0yCiiuFvcwIlIa2iFYm8vAEbuCPcFRD95/dxqclcZIDW5mN5OXx5GUAgM7L
         cEmyu/r1mSx3wB3FAG/mUtrcEBRa9U5px1rQIvJQNcwQEpYFVcyKrTcDyg/4rpXxF/ix
         uN2D+QT/lA3lzY5ObdaWHFZ3XkVRBDdJc0d38TVJ8Kn9rhc8sb/1yr/tohz2giilivEA
         LvZA==
X-Gm-Message-State: APjAAAUIa+kRQO/eJ7gThfVHu6WhJOxhZHqLIE1UAznxq2djQPIgOufG
        Mj5hRtJIbGhqRcv+19o9f9c=
X-Google-Smtp-Source: APXvYqywgKjj5HcP6LGVDjHKN+eHEzwJaObV/i9U5epabyKIF9WYhMzD1XH0fJ4ei3TIuE7aNAwsyg==
X-Received: by 2002:a63:4105:: with SMTP id o5mr31798673pga.308.1562074838556;
        Tue, 02 Jul 2019 06:40:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a3sm17913917pfi.63.2019.07.02.06.40.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 06:40:38 -0700 (PDT)
Date:   Tue, 2 Jul 2019 06:40:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ken Sloat <KSloat@aampglobal.com>
Cc:     "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Message-ID: <20190702134037.GA23223@roeck-us.net>
References: <20190614125310.29458-1-ksloat@aampglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614125310.29458-1-ksloat@aampglobal.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 14, 2019 at 12:53:22PM +0000, Ken Sloat wrote:
> From: Ken Sloat <ksloat@aampglobal.com>
> 
> Currently, the atmel-sama5d4-wdt continues to run after system suspend.
> Unless the system resumes within the watchdog timeout period so the
> userspace can kick it, the system will be reset. This change disables
> the watchdog on suspend if it is active and re-enables on resume. These
> actions occur during the late and early phases of suspend and resume
> respectively to minimize chances where a lock could occur while the
> watchdog is disabled.
> 
> Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Changes in v2:
>  -Consolidate resume and resume early statements.
> 
>  drivers/watchdog/sama5d4_wdt.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 111695223aae..0d123f8cbcc6 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -280,7 +280,17 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>  MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
>  
>  #ifdef CONFIG_PM_SLEEP
> -static int sama5d4_wdt_resume(struct device *dev)
> +static int sama5d4_wdt_suspend_late(struct device *dev)
> +{
> +	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int sama5d4_wdt_resume_early(struct device *dev)
>  {
>  	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
>  
> @@ -291,12 +301,17 @@ static int sama5d4_wdt_resume(struct device *dev)
>  	 */
>  	sama5d4_wdt_init(wdt);
>  
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_start(&wdt->wdd);
> +
>  	return 0;
>  }
>  #endif
>  
> -static SIMPLE_DEV_PM_OPS(sama5d4_wdt_pm_ops, NULL,
> -			 sama5d4_wdt_resume);
> +static const struct dev_pm_ops sama5d4_wdt_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(sama5d4_wdt_suspend_late,
> +			sama5d4_wdt_resume_early)
> +};
>  
>  static struct platform_driver sama5d4_wdt_driver = {
>  	.probe		= sama5d4_wdt_probe,
