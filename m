Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC1C3B6D61
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2019 22:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391215AbfIRUPr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Sep 2019 16:15:47 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42572 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388974AbfIRUPr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Sep 2019 16:15:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id z12so473710pgp.9
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Sep 2019 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eDhphM8H9NagsbijkJtey0fSEQ8n1011B5YVX2xo8FI=;
        b=iDeck6nVTaklyFio1I42LAqIAV0eRCV8KN4a3P0ipz+hGngY1G3bUFGQBNYa8zNmfO
         gwnvfjmMAarSVn8285oVvh8WnDhG0BQaQeTHq+6fQrImahLZC6lhYkH4TpjvP3vumpXh
         K+/HSa2J9ofAmycYvyBoTDQmfnkHaVytMiqducEoDvjF02oLtJlOQFclc9Y1rbcbE0B+
         sU7iSLUQcP2AkuKlTA41w792QPnB8zta3LlvS4da0GDiMveYn3SIvp0jd1bACAgwx91b
         F9WLXPkBKYq6fqscoPpwrW+4GyBRwGT5GexXJK/0Uy3zFzF4KNG1EteRewHZyFV0I3dL
         02zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=eDhphM8H9NagsbijkJtey0fSEQ8n1011B5YVX2xo8FI=;
        b=T72Kr6nrhfSgBldAdW0OKCdk7llOE9Dkh3RKg2upothVZ2eKEnD9HinFUEf0ewWl8r
         AkBwqBnhbAdok7EQSznt6OeFwgPFEEuqZSFUfST503ahQleLceW9e7PrddaUhcJGaSUY
         HJ9H194mR8opo1sxKVBifRCK3kd0MsUTbW0pFISYTFVSUgvVWwYGuoF5Vc9zH+L+VPHm
         dRPbLqhVe4IZvSOTeXRTTqu6aQX4mtov86J0pjJe1mb2Srn7C1ktg+cR5aLAj18zJjKL
         AFjVYz6um6D9Z1/37JMW3u7lt7iW4+a1n39xHH8vrY5uee0GHt5IaE10HIleMH+0TU/B
         cNvA==
X-Gm-Message-State: APjAAAWa6VLveij7f4qxp7zfFmu7psldEy6/yLNfJvd4SnTzArm0S4/4
        wC6WAcNDmPH9+Oisw3nHVng=
X-Google-Smtp-Source: APXvYqws4Okdkpw7+9pY6ky/CmV/V0HkBXitgNk/22SCYDuIOw6EL9GoHehdIQqvHGmNwfPFWOXb+Q==
X-Received: by 2002:a17:90a:33e7:: with SMTP id n94mr141586pjb.15.1568837746510;
        Wed, 18 Sep 2019 13:15:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1sm10262011pjs.31.2019.09.18.13.15.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 13:15:45 -0700 (PDT)
Date:   Wed, 18 Sep 2019 13:15:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Srikanth Krishnakar <skrishnakar@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Cedric_Hombourger@mentor.com,
        Srikanth_Krishnakar@mentor.com
Subject: Re: [PATCH v2] watchdog: w83627hf_wdt: Support NCT6116D
Message-ID: <20190918201543.GA15062@roeck-us.net>
References: <20190918145729.GA15471@roeck-us.net>
 <20190918160458.10108-1-Srikanth_Krishnakar@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918160458.10108-1-Srikanth_Krishnakar@mentor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Sep 18, 2019 at 09:34:58PM +0530, Srikanth Krishnakar wrote:
> The watchdog controller on NCT6116D is compatible with NCT6102D.
> Extend the support to enable SuperIO based NCT6116D watchdog device.
> 
> Tested on Siemens SIMATIC IPC-527G.
> 
> Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Thanks for the catch Guenter!
> 
> That was not intentional. Fixed the typo of return ID. I could have 
> merged return ID of 6116 into 6102D but that would display 6102D as
> SuperIO Initialized in bootlog.
> 
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
> index 38b31e9947aa..56a4a4030ca9 100644
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
> +		ret = nct6116;
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
