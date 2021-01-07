Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D452ED352
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Jan 2021 16:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbhAGPNh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Jan 2021 10:13:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbhAGPNh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Jan 2021 10:13:37 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486F6C0612F4;
        Thu,  7 Jan 2021 07:12:57 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id d189so7639491oig.11;
        Thu, 07 Jan 2021 07:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J/eHM8bGecKftTerD53gLlkk3eG1KUR0ZnErJXZNe24=;
        b=H16Rmvo3mY2xceqsspMZ3eDcmF2Wz/jdFJzsJNxFcAZuBf5/sPomNv0NKmCCGvsoYW
         IY1Z63fYHrKktBHdZWaxMe5bxmZr0HmdEOiJqLaleZOqRX5x6Q+HSi2vXGPoowT57M95
         YidYPqa2folvs/vjQKVvduDPAggEC0PLC/BWGvQ91qBLURZyh7sbHT8747ez4J8QZNh2
         SR/Y/gT/74ileeDcdYbWHwvhupsGoi0srnStAFvrw3qA/l5/FTjzORySH8FgRZw3QN7f
         3HE2mh7CES4cA9vH3XyXLXZyHLfmiEl+2V3dhTZ/Tdh8evaDNHRNX0lqu+aRMV7y1x1z
         VdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=J/eHM8bGecKftTerD53gLlkk3eG1KUR0ZnErJXZNe24=;
        b=Bv9ccPF0MNLahZlwfibAn/c6UwdO6ExrvkecghzKM90QVRaw/nmOhOvD346eQ3F8ir
         8AWV4d1moWwRfQGUwWS0mxw2yaRKsc2PM4Fb3MjCKpwiAZGGljCJatScwsILu8PPApI4
         brTZGyuvfutfD2xJoPwb3NoDcJjPW/GUpH22/wS7yZA+84RXUs7Fl6dHjPqp+Got/vtb
         1PimIKAQOGq6P/sfo0pq+At+Kjkn2ERpruaP4nO6OxNcrDzLWZZXrD303b21KkkRYBP/
         lImYQKaC6N6jPWBcJMYOz2hswp3KfaalNJY3Jl0Ze1n1JWaMk/SrSUI+Zc/q6tlSozu5
         48IA==
X-Gm-Message-State: AOAM532pJArPxZhqp1/JIiabl+Znkw6eDXnNOL5Ch4ASDcZNgud2feLu
        wKUgr8gwz4gKy8ATKXWTfOA=
X-Google-Smtp-Source: ABdhPJyFqOMWEMcF4A88Iy/0w7DT5uHf5SK1comLS4iu85ds4T2uhzwXRZgUOP6XD34zRrz9dwO/Qw==
X-Received: by 2002:aca:5253:: with SMTP id g80mr6708242oib.98.1610032376707;
        Thu, 07 Jan 2021 07:12:56 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l21sm1194383otd.0.2021.01.07.07.12.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 07:12:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 7 Jan 2021 07:12:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: BD70528: conditionally allow BD70528 module
Message-ID: <20210107151254.GB13040@roeck-us.net>
References: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
 <019c196041600a00143fe16bda19b2a8f060e9a9.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <019c196041600a00143fe16bda19b2a8f060e9a9.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 07, 2021 at 08:37:25AM +0200, Matti Vaittinen wrote:
> The BD70528 watchdog module provides start/stop interface for RTC
> driver because the BD70528 watchdog must be stopped when RTC time
> is set. (WDG uses RTC counter and setting RTC may accidentally trigger
> WDG if WDG is enabled). The BD71828 use same RTC driver as BD70528 but
> don't share same WDG logic. When BD70528 is not configured a stub call
> to "stop WDG" is implemented and in case when BD71828 is used, this
> stub function should be called. Prevent configuring in the BD70528
> watchdog when BD71828 is configured to avoid access to real WDG
> functions when WDG does not exist in HW.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

As mentioned in my response to the other patch, I think this is the
wrong solution.

Guenter

> ---
>  drivers/watchdog/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index fd7968635e6d..40e1b4c69537 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -163,6 +163,7 @@ config SOFT_WATCHDOG_PRETIMEOUT
>  config BD70528_WATCHDOG
>  	tristate "ROHM BD70528 PMIC Watchdog"
>  	depends on MFD_ROHM_BD70528
> +	depends on MFD_ROHM_BD71828 = n
>  	select WATCHDOG_CORE
>  	help
>  	  Support for the watchdog in the ROHM BD70528 PMIC. Watchdog trigger
> -- 
> 2.25.4
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
