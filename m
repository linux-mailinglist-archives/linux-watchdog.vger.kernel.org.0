Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11874B6685
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2019 16:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731382AbfIRO5e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Sep 2019 10:57:34 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32832 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731473AbfIRO5e (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Sep 2019 10:57:34 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so15383pgn.0
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Sep 2019 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PsQcV3fnB6NkoTegCCLykSvmylYwDFmUJ17TzYeX7Vs=;
        b=qfqhbTu9GzNVI232j6dyLqyiQm1xBLg6Ee4suFLcC+eMwS6vUaPRbJTbBJdFqXnrcT
         7N2gAmfPJShCepFzwfqlzN4C33oq/XgpSzIU9kojD9mmeXg16qpUSGc7V4/VMLCSx7fB
         YP3C+uLFm0Ts42yd4pptaox7RaTBZjC6e3ugeN5kCP5x0Uf5QKAGznAEB8tm4MiH1QQf
         phh3nUMstqaG7f/V3kivmrugifKV4CbyqOW2o5bwGpdgDbh3DzT/c5wNwUmJAqPOCM7B
         WA0WrP9b4Mfc/McxcaH5F1FiOSrsQDZ7NDt2akBQNzMoZ0dOeofYjVN34fH9P90zUnMk
         9fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PsQcV3fnB6NkoTegCCLykSvmylYwDFmUJ17TzYeX7Vs=;
        b=COYQg1/oxFUZ3QRnHlr8i/bjP6BeKVtFm97Xu4mKghDY3h0KKGoTi3tnkwF+ra/ZVH
         lr9Qlzn/WBPX0w8NYRwijWT4QjzvFpoSPkO9UnKnpnm27j58xCse9AuXpf84P+m54MtE
         n+FJVJJYR0u81hb9WTMyDwFYGRrxavync2qAkSpmtYjvv5H9mwNUJHovOw17FpeiXDWy
         jFkbhdyR/8X8VaZXHBBgfQueakoD93wcNVxfQt5mVgSgwlIm71/vTjckdut22HKTWHUR
         6FI1wV4HkeAme9E44RP2inEFYancDCI8EIeyvAFE17QBpsgql4WAxm0olPyRdEVhfBPI
         H/XQ==
X-Gm-Message-State: APjAAAVG1TeMiVtapsgfXuNd/rJlbqIbCpFqN+ZgPKgS86JBfEJxReEI
        jyeDWAUdBwlrQzjYWnG6ldA=
X-Google-Smtp-Source: APXvYqxDTatM6uYUJe7U3gow4A1fD7ERRNBawY/PKpkOMAR2fMUqWk8xEU1O2/qDbKQwbxoCRKsGiQ==
X-Received: by 2002:a63:31d8:: with SMTP id x207mr4333123pgx.428.1568818652049;
        Wed, 18 Sep 2019 07:57:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w6sm10560459pfj.17.2019.09.18.07.57.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 07:57:30 -0700 (PDT)
Date:   Wed, 18 Sep 2019 07:57:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Srikanth_Krishnakar <skrishnakar@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        Cedric_Hombourger@mentor.com, Srikanth_Krishnakar@mentor.com
Subject: Re: [PATCH] watchdog: w83627hf_wdt: Support NCT6116D
Message-ID: <20190918145729.GA15471@roeck-us.net>
References: <20190918134215.3036-1-Srikanth_Krishnakar@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918134215.3036-1-Srikanth_Krishnakar@mentor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Sep 18, 2019 at 07:12:15PM +0530, Srikanth_Krishnakar wrote:
> From: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> 
> The watchdog controller on NCT6116D is compatible with NCT6102D.
> Extend the support to enable SuperIO based NCT6116D watchdog device.
> 
> Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> ---
>  drivers/watchdog/Kconfig        |  1 +
>  drivers/watchdog/w83627hf_wdt.c | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index a45f9e3e442b..4affadda5185 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1488,6 +1488,7 @@ config W83627HF_WDT
>  		NCT6791
>  		NCT6792
>  		NCT6102D/04D/06D
> +		NCT6116D
>  
>  	  This watchdog simply watches your kernel to make sure it doesn't
>  	  freeze, and if it does, it reboots your computer after a certain
> diff --git a/drivers/watchdog/w83627hf_wdt.c b/drivers/watchdog/w83627hf_wdt.c
> index 38b31e9947aa..fdf533fe0bb2 100644
> --- a/drivers/watchdog/w83627hf_wdt.c
> +++ b/drivers/watchdog/w83627hf_wdt.c
> @@ -49,7 +49,7 @@ static int wdt_cfg_leave = 0xAA;/* key to lock configuration space */
>  enum chips { w83627hf, w83627s, w83697hf, w83697ug, w83637hf, w83627thf,
>  	     w83687thf, w83627ehf, w83627dhg, w83627uhg, w83667hg, w83627dhg_p,
>  	     w83667hg_b, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
> -	     nct6795, nct6796, nct6102 };
> +	     nct6795, nct6796, nct6102, nct6116 };
>  
>  static int timeout;			/* in seconds */
>  module_param(timeout, int, 0);
> @@ -94,6 +94,7 @@ MODULE_PARM_DESC(early_disable, "Disable watchdog at boot time (default=0)");
>  #define NCT6775_ID		0xb4
>  #define NCT6776_ID		0xc3
>  #define NCT6102_ID		0xc4
> +#define NCT6116_ID		0xd2
>  #define NCT6779_ID		0xc5
>  #define NCT6791_ID		0xc8
>  #define NCT6792_ID		0xc9
> @@ -211,6 +212,7 @@ static int w83627hf_init(struct watchdog_device *wdog, enum chips chip)
>  	case nct6795:
>  	case nct6796:
>  	case nct6102:
> +	case nct6116:
>  		/*
>  		 * These chips have a fixed WDTO# output pin (W83627UHG),
>  		 * or support more than one WDTO# output pin.
> @@ -417,6 +419,12 @@ static int wdt_find(int addr)
>  		cr_wdt_control = NCT6102D_WDT_CONTROL;
>  		cr_wdt_csr = NCT6102D_WDT_CSR;
>  		break;
> +	case NCT6116_ID:
> +		ret = nct6102;

What is the point of introducing a new id for the chip and then
ignoring it ?

Guenter

> +		cr_wdt_timeout = NCT6102D_WDT_TIMEOUT;
> +		cr_wdt_control = NCT6102D_WDT_CONTROL;
> +		cr_wdt_csr = NCT6102D_WDT_CSR;
> +		break;
>  	case 0xff:
>  		ret = -ENODEV;
>  		break;
> @@ -482,6 +490,7 @@ static int __init wdt_init(void)
>  		"NCT6795",
>  		"NCT6796",
>  		"NCT6102",
> +		"NCT6116",
>  	};
>  
>  	/* Apply system-specific quirks */
> -- 
> 2.17.1
> 
