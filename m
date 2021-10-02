Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986FC41FC3B
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Oct 2021 15:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhJBNYw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 Oct 2021 09:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbhJBNYv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 Oct 2021 09:24:51 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61C9C0613EC;
        Sat,  2 Oct 2021 06:23:05 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso15183234otb.11;
        Sat, 02 Oct 2021 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QBSl8KLZfvvqBorGkoZwonl+sNhMvfAEnMRg2p1fh00=;
        b=VgoiZLtFojg4+m6RAGiiJpQseva6KA7EgzFdEPWjbvjmVs0KV2rZz3PyGzMaCBmDwz
         Yx5g8KHsqWe6GUsMDbFavI659xyroK0+9F9Q0kVblI6iZzsq0BUwEvy4CeQaGC13BQUi
         VkM2CNQaEnpGILbNIcWBftR5UPpTDzquAkJPivB91uuTp9LkUpZ+HLyQCURMiiC0AjeW
         XvN6fpXGPEW/0tTz7oSRmw2x4NxuczSH0hVCWuJ6x1VTTKQ1jakXN5c7W4Ji9N4uRmhN
         Z+W7Ak1EKFIr5Y0AkBjilpGX2rlNjdUnGmqeg15Tp9J63cT8y5vpDBCvNb4JCYTO6dUk
         xp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=QBSl8KLZfvvqBorGkoZwonl+sNhMvfAEnMRg2p1fh00=;
        b=ZUMWKvvaznkVUCIRlqXZupU3SciJ/7tBnmlRdb5u0tTLyb6nRdUTtWdjq37EXWaWv6
         /JV77mhnzYy6gt/k73X3jMW++KvuGJV6OwwiqFsGPlUHCGwP5Bkio4uJl3/GtbtnKUj0
         WwrbD4bzVEM5tP1EhRXdnXdUbN5Pcj1/YCIrBc7QipxznMS/w8eZyJNgsr3LqRakGRlb
         /rX/AtFSQCl1yVpYOfkYJcKDjpcJxibkD4xuVXwcrswqP3bOTGS/M+hUCUtzocyJ8O7U
         5U7tvurVQymen9lkGHwCaxKDZhoQJnD2pySQlG7OJyaE18lk/kYSOkfIAflmfojujebk
         z0fg==
X-Gm-Message-State: AOAM530no64GjaxXV5SIkvsSaxYUaM2e4GGiMtxXK/gWhOCGvFvq7SRX
        cSdEeoA7HAt8CamiToLUnQ4=
X-Google-Smtp-Source: ABdhPJyVWpOqfZJ4P92MN5f9r4FgT3LbAzaQYR48vXPrJSsWBIJ+hBZ1Vb6vSZWdscZQCAoTZUD9eQ==
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr2709896otb.254.1633180985182;
        Sat, 02 Oct 2021 06:23:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f61sm1735254otf.73.2021.10.02.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 06:23:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 2 Oct 2021 06:23:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: iTCO_wdt: Full reinitialize on resume
Message-ID: <20211002132303.GB4023280@roeck-us.net>
References: <20210928165343.23401-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210928165343.23401-1-linux@weissschuh.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 28, 2021 at 06:53:43PM +0200, Thomas Weiﬂschuh wrote:
> The Thinkpad T460s always needs driver-side suspend-resume handling.
> If the watchdog is not stopped before suspend then the system will hang
> on resume.
> If the interval is not set before starting the watchdog then the machine
> will instantly be reset after resume.
> 
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=198019

The Fixes: tag references a SHA, not a bugzilla bug.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  drivers/watchdog/iTCO_wdt.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 643c6c2d0b72..2297a0a1e5fc 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -47,6 +47,7 @@
>  /* Includes */
>  #include <linux/acpi.h>			/* For ACPI support */
>  #include <linux/bits.h>			/* For BIT() */
> +#include <linux/dmi.h>			/* For DMI matching */
>  #include <linux/module.h>		/* For module specific items */
>  #include <linux/moduleparam.h>		/* For new moduleparam's */
>  #include <linux/types.h>		/* For standard types (like size_t) */
> @@ -605,9 +606,20 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>   */
>  
>  #ifdef CONFIG_ACPI
> +static const struct dmi_system_id iTCO_wdt_force_suspend[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad T460s"),
> +		},
> +	},
> +	{ },
> +};
> +
>  static inline bool need_suspend(void)
>  {
> -	return acpi_target_system_state() == ACPI_STATE_S0;
> +	return acpi_target_system_state() == ACPI_STATE_S0 ||
> +		dmi_check_system(iTCO_wdt_force_suspend);
>  }
>  #else
>  static inline bool need_suspend(void) { return true; }
> @@ -631,8 +643,10 @@ static int iTCO_wdt_resume_noirq(struct device *dev)
>  {
>  	struct iTCO_wdt_private *p = dev_get_drvdata(dev);
>  
> -	if (p->suspended)
> +	if (p->suspended) {
> +		iTCO_wdt_set_timeout(&p->wddev, p->wddev.timeout);
>  		iTCO_wdt_start(&p->wddev);
> +	}
>  
>  	return 0;
>  }
> 
> base-commit: 41e73feb1024929e75eaf2f7cd93f35a3feb331b
> -- 
> 2.33.0
> 
