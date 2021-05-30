Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D147F39510A
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 15:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhE3NV3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 09:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE3NV3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 09:21:29 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523DFC061574;
        Sun, 30 May 2021 06:19:50 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so8416567otc.12;
        Sun, 30 May 2021 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QQSxWKn1wzKo9tY4ec3d90ThDOVwMYjdh2MoDNno9JU=;
        b=PZ5K+bo1b3vRehnau9iaTJtjYxxwvs4XoxQZpehkUW6d3S6WkHPE9PMNITHrvDpGub
         XoVJdJuJcXq5ApY9sK1otNL49pTYZejNySfhKUtyvEuTOjLr2FquTKW8G1RaW52B5bv6
         76VxKgPdgDB28n4a5fUL18k35+orWHPK26jXlLg+2XoAOtq5sD3Ta2aCrcpNmKgHrdqR
         dAWZXYRvQdnvOF7Jsf00HGwbmhGod2IEBLqOvvrPGc+OruJyXz4HYWPybrBcvygpn4OS
         AAtP3TdKTHrXlQtwwC0F5cSjhapJIr15IktlOBAMJDAKWpOQNUU/MdfY0sIyinZLWErs
         2ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=QQSxWKn1wzKo9tY4ec3d90ThDOVwMYjdh2MoDNno9JU=;
        b=V7zQmWfgmC6zo3DXFDjCJJSPbmhxGFRweIEPdv1JyU50JfMIqh65aY/a8Q/HfXhEUQ
         6F/gQ9PRM2DGAgH3v6H+dqs+StF2KpgXR9mLgNtnGl9TUXmVpHRhlzNfhSElQb5fbgIv
         1719s10mKUc3hh7EtjF8nBlz3u7WDGn0+R/ntmE6+8XICDvNlMJpY7nHqSCZ/SgkrgU1
         TSHkU2d5aJhwFvLjS8XOj2gCZYGSR3yxcku4NfRWPKG2BDDZP7hCcCWaGVXwk9fl3k2X
         +YQFlTmZrQ2tE+yNnx5wGNLIxW9tUMz9nUmwntZcxXfQtN8I1BbGuhs/Wz6B6qVY+BB3
         ZYFw==
X-Gm-Message-State: AOAM531JDJ8cnfeHo9yOIw5deHt66D5FyaJj7FFLymSwzWtEKwMXJeuA
        mWPLnIWVkmy8BlHlkEMFT7DM0mphXSs=
X-Google-Smtp-Source: ABdhPJxmgRGryYIDcjOoVdVqJgaVGwLx4lBb+d9dPqgCxYuyvvjVwb3rS58qleIEvrsxjUTKV8UK1A==
X-Received: by 2002:a05:6830:308a:: with SMTP id f10mr13598967ots.147.1622380789699;
        Sun, 30 May 2021 06:19:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z9sm2425978oti.37.2021.05.30.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 06:19:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 30 May 2021 06:19:47 -0700
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
Message-ID: <20210530131947.GB2483596@roeck-us.net>
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

This expands the scope of this adjustment to all versions, while at the same
time making it conditional for v1. Is this correct ? What for systems with v1
TCO where the above conditions are not met ?

Guenter

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
