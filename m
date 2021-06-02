Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3517F398830
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jun 2021 13:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhFBL0d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Jun 2021 07:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbhFBL0X (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Jun 2021 07:26:23 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16587C061574;
        Wed,  2 Jun 2021 04:24:39 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id d21so2265908oic.11;
        Wed, 02 Jun 2021 04:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lb5hfBQxVsi1Vg1j35N2ywJlavrlJQVrfj0rUb+Ytfc=;
        b=JQ3H8P4T1qVbdFNFdAvk16t/Jn4BEobrG1ALFG+vpTHZx8CHsRz3vzBWGJBEYlCWS7
         v4GTuPAq8N5qwRhE49aL1tO7A74BIQ4ddWVK4CBXnlVe8mUa6jSq+o5fuzCN/4UYpOZt
         lojqe3jBRSJJoBYX7GLDRlswkJhnaEyKSGyv9OXUFrtFNkM6ZJpduW0CtWNj3ITzZ236
         nt5qNpJEoOSiPm6xNV/AyHVtEBg+CnzvLqXDKJt0p22gz9HWbeI0hbP1mcLBhXVXPXkG
         BXJL00577voR219BKpMFesPupvjUw6GXaLBoFR0iJPP9+2h8V3/Zxl/K8tKrdcVhV308
         kY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lb5hfBQxVsi1Vg1j35N2ywJlavrlJQVrfj0rUb+Ytfc=;
        b=RzMab3ubNiIa4v+Knewl+pbADCVEIM75YQ4sTs8mJZrHodjaImLBtlesOCc0apa0vz
         ZW5crRYzQrLsHAzBLePZps01XLso3aP6RnPSNlbaOsjGBhM/T9kuINasgfgbI3tmGskW
         +vor01BUsmGgLyCbd8ywNk98+82eDXUdEiSs8hHdWMcUK6g6xAWjudyL8+GloLKWCrKo
         pnJ6eu5wX9q5Xa5Q/YsS3ngK8DV+JmfAAKN6iKfnTFEGMcXMLRrvuwgREtRzJ0kDjcJY
         bMkrOcGHtGLJ/oS3NOCjqHvwPnJd6bwEerO8AaGluvBuRuSPH/c0pPITm2X/Nk9X4YER
         Q7gA==
X-Gm-Message-State: AOAM53376Rfqe6Y3g3YqSXhS1V/Y5P5EW6rtkMzMBIQE/tKaVtI28oQK
        LVFKgJMUMkSiEvZPMLpottE=
X-Google-Smtp-Source: ABdhPJzsIxF0MwQrfYP8zCdaBaDHCgc83g0HO1dCwLGKRryQN+oGMWHV5biqIT2U/P8PzZ4SzriofQ==
X-Received: by 2002:aca:400b:: with SMTP id n11mr20962335oia.111.1622633078417;
        Wed, 02 Jun 2021 04:24:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t23sm3997565oij.21.2021.06.02.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 04:24:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 04:24:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] watchdog: iTCO_wdt: Account for rebooting on second
 timeout
Message-ID: <20210602112436.GA2280802@roeck-us.net>
References: <0b8bb307-d08b-41b5-696c-305cdac6789c@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b8bb307-d08b-41b5-696c-305cdac6789c@siemens.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, May 30, 2021 at 01:24:23PM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This was already attempted to fix via 1fccb73011ea: If the BIOS did not
> enable TCO SMIs, the timer definitely needs to trigger twice in order to
> cause a reboot. If TCO SMIs are on, as well as SMIs in general, we can
> continue to assume that the BIOS will perform a reboot on the first
> timeout.
> 
> QEMU with its ICH9 and related BIOS falls into the former category,
> currently taking twice the configured timeout in order to reboot the
> machine. For iTCO version that fall under turn_SMI_watchdog_clear_off,
> this is also true and was currently only addressed for v1, irrespective
> of the turn_SMI_watchdog_clear_off value.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v2:
>  - consider GBL_SMI_EN as well
> 
>  drivers/watchdog/iTCO_wdt.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index bf31d7b67a69..3f1324871cfd 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -71,6 +71,8 @@
>  #define TCOBASE(p)	((p)->tco_res->start)
>  /* SMI Control and Enable Register */
>  #define SMI_EN(p)	((p)->smi_res->start)
> +#define TCO_EN		(1 << 13)
> +#define GBL_SMI_EN	(1 << 0)
>  
>  #define TCO_RLD(p)	(TCOBASE(p) + 0x00) /* TCO Timer Reload/Curr. Value */
>  #define TCOv1_TMR(p)	(TCOBASE(p) + 0x01) /* TCOv1 Timer Initial Value*/
> @@ -355,8 +357,12 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>  
>  	tmrval = seconds_to_ticks(p, t);
>  
> -	/* For TCO v1 the timer counts down twice before rebooting */
> -	if (p->iTCO_version == 1)
> +	/*
> +	 * If TCO SMIs are off, the timer counts down twice before rebooting.
> +	 * Otherwise, the BIOS generally reboots when the SMI triggers.
> +	 */
> +	if (p->smi_res &&
> +	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>  		tmrval /= 2;
>  
>  	/* from the specs: */
> @@ -521,7 +527,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  		 * Disables TCO logic generating an SMI#
>  		 */
>  		val32 = inl(SMI_EN(p));
> -		val32 &= 0xffffdfff;	/* Turn off SMI clearing watchdog */
> +		val32 &= ~TCO_EN;	/* Turn off SMI clearing watchdog */
>  		outl(val32, SMI_EN(p));
>  	}
>  
> -- 
> 2.26.2
