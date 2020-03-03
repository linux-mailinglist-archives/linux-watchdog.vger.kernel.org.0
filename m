Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8688A1784AE
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2020 22:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732463AbgCCVNC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Mar 2020 16:13:02 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40038 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732397AbgCCVNC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Mar 2020 16:13:02 -0500
Received: by mail-pg1-f195.google.com with SMTP id t24so2119794pgj.7;
        Tue, 03 Mar 2020 13:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cjXy/AHGlnAlmHeoOkLzE1LxnTMabJl9XqoDCRnfzNE=;
        b=sEjAkOMSLNvtn3nZJRpx/eE6ORIfEgvsFBh+5/piT1xic0gKe7EwFsQ6Pl9ugiU0Ha
         e4siP8DGeYfqtlAmIaCHjCe7rU00pMcdPlBUqC7aY2dUW3nXYSB20yvLSxKkqBPULEtm
         VfOem5NK/9HCV5QuxeZu3q29yJhpqHWkArurUDVw+aAnxJ0YTahhqUpGUM7AHaIIwT2z
         KYc4Ggb+hvXd/au56BzgAxSBsKmdpOi86a46z51yvNi2Q8/Zrke+N3R2ZwqUVIJtSe+f
         sl2/ZmeJulF4gyidW5fUwg06977aj9IkKrc4Uyc+DRbiiPaIOgZa6g4WpTXLrihmmCk6
         TdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cjXy/AHGlnAlmHeoOkLzE1LxnTMabJl9XqoDCRnfzNE=;
        b=XLmfX11eM6GVXXBRr0uvFCztB1pXO4UiqP0nHqck9tvkjBNeVVyfQiKJ8PfPeeHBu8
         JI8l45AbenlLsBwFQO1UDyNdP2L3nyexfdpy5IsohvnjA7Cyi/DU8o4I5eANPM4UwCFP
         ZAUjy7qjBdRdZZFSnr2CxvcYGofirB82NzV3mYPGLK9/UatSXAseJltVEqwtuvys+FvV
         XMFIRdnavCoYp/mR8EsVSQvZ6+wE2G9WgIk9T6eG89NF3G6g1mCqlLEePnXC+SFkMhrC
         ESah59bC1FgVp918yuCpvcvlFpNab8xFKg2DN459JVNkh406eq+slVGhW+Jhlq1nRzxb
         HCNA==
X-Gm-Message-State: ANhLgQ2Sx/RcRBRSfFJ++CxLAI7S8AygNlNczHeQYYAxyr4Iq8w2bDYe
        oB0pZcY+wnJjgxAazpkmC9Q=
X-Google-Smtp-Source: ADFU+vvDPgFZc1xbBVSUOTlj/dSzxsSyW1Yi/QOyvs65jdchwSF2E/h4FOLGKh+lSE+ibyqQqnn5aA==
X-Received: by 2002:aa7:9e5e:: with SMTP id z30mr6091148pfq.132.1583269981097;
        Tue, 03 Mar 2020 13:13:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t15sm25080543pgr.60.2020.03.03.13.13.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 13:13:00 -0800 (PST)
Date:   Tue, 3 Mar 2020 13:12:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 2/4] watchdog: reset last_hw_keepalive time at start
Message-ID: <20200303211259.GA28733@roeck-us.net>
References: <20200302200426.6492-1-t-kristo@ti.com>
 <20200302200426.6492-3-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302200426.6492-3-t-kristo@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 02, 2020 at 10:04:24PM +0200, Tero Kristo wrote:
> Currently the watchdog core does not initialize the last_hw_keepalive
> time during watchdog startup. This will cause the watchdog to be pinged
> immediately if enough time has passed from the system boot-up time, and
> some types of watchdogs like K3 RTI does not like this.
> 
> To avoid the issue, setup the last_hw_keepalive time during watchdog
> startup.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>   * apply functionality always instead of being behind a flag
> 
>  drivers/watchdog/watchdog_dev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 8b5c742f24e8..7e4cd34a8c20 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -282,6 +282,7 @@ static int watchdog_start(struct watchdog_device *wdd)
>  	if (err == 0) {
>  		set_bit(WDOG_ACTIVE, &wdd->status);
>  		wd_data->last_keepalive = started_at;
> +		wd_data->last_hw_keepalive = started_at;
>  		watchdog_update_worker(wdd);
>  	}
>  
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
