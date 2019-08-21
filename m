Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6843698029
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 18:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729382AbfHUQcX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 12:32:23 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35074 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbfHUQcX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 12:32:23 -0400
Received: by mail-pl1-f193.google.com with SMTP id gn20so1612108plb.2;
        Wed, 21 Aug 2019 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pDSd7SGk/DY6GuxuuavhgDxlL+IufA63dRDI3AQTbS4=;
        b=UcVOc4tBUOwmoJfipEg8MeVlXJDmigZScACSk87Msp47DaE/lPpGmF06Lcg7rzyoGE
         AqSxpFcQfVTKoSxtyA4vu6ZwnMIVz8YSGtAFerKUX9kK7h5WLLm+pIb6rd0o75bBwOKb
         mWL7kOqv6CwibF4Gi1nFzhpmogzAyGUpVMFO/FZzZTM98xbRhROy0FxH4aT4U/+J/yTv
         iB4yPOwCZxlKJBndqDhwJ4t6FHiIowZWYgcB5q3/EAPwzn8U11OEwlE40+MpW4C4Rc/L
         Fc4iFUWO4EtoZA1YDKE86WFDr/KIfj21I1BUzYUsOwoZPIQnN+rCFUuMKOC9yVSUDE3D
         yfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=pDSd7SGk/DY6GuxuuavhgDxlL+IufA63dRDI3AQTbS4=;
        b=EfjpA4IU3p7FquzVq/5dwH7qvvVP/lsQPve2HY0VFmxFmRU51V8zeWXG0rjpvwgRSm
         eUwZWKVVEge8aN9SFaJIFZSNeyfl13wYmbQtzeccULTLKVbApczQL/4OWirwzG6CnboK
         0MBCBE+F99f0zOXjvakvQICIhPS0j5Bzcg4miafqIYFySFdRAzkjBAosnBL17XMHqQYh
         UH5K3X8oEo+qEB2WCI2nPqz5ZEIhmQ7paK/TL/tLWQCD4Q8PMLLnAX6yzGXd9OGe+dez
         1yMtscGy2XKMapbCA7N/678wXzx9O0nmyc40SqrxL0n9Q9EtZD8bStyVTlReBz+4MtVD
         G1zQ==
X-Gm-Message-State: APjAAAWeiIoeDB3ngN+Fmk5nlBBmqPlrZq5ZOJLzRFFEHEvCuzhYhGpQ
        SnBE6YxXclyo0nFle2PW2Vq848NeV3E=
X-Google-Smtp-Source: APXvYqygLt6JnGdpnnQo0Yur5Q+gq4DxiD8HmafW1pMiWWteLsUUEZ3r2fvMrKKz1FF5ZBiKAnkR8w==
X-Received: by 2002:a17:902:d70a:: with SMTP id w10mr32715980ply.251.1566405142614;
        Wed, 21 Aug 2019 09:32:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o130sm29917759pfg.171.2019.08.21.09.32.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2019 09:32:21 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:32:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
Message-ID: <20190821163220.GA11547@roeck-us.net>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 06:57:43PM +0300, Ivan Mikhaylov wrote:
> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> to clear out boot code source and re-enable access to the primary SPI flash
> chip while booted via wdt2 from the alternate chip.
> 
> AST2400 datasheet says:
> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> re-directed to CS1#. And CS0# is not accessable under this mode. To access
> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> register WDT30.bit[1]."

Is there reason to not do this automatically when loading the module
in alt-boot mode ? What means does userspace have to determine if CS0
or CS1 is active at any given time ? If there is reason to ever have CS1
active instead of CS0, what means would userspace have to enable it ?

If userspace can not really determine if CS1 or CS0 is active, all it could
ever do was to enable CS0 to be in a deterministic state. If so, it doesn't
make sense to ever have CS1 active, and re-enabling CS0 could be automatic.

Similar, if CS1 can ever be enabled, there is no means for userspace to ensure
that some other application did not re-enable CS0 while it believes that CS1
is enabled. If there is no means for userspace to enable CS1, it can never be
sure what is enabled (because some other entity may have enabled CS0 while
userspace just thought that CS1 is still enabled). Again, the only means
to guarantee a well defined state would be to explicitly enable CS0 and provive
no means to enable CS1. Again, this could be done during boot, not requiring
an explicit request from userspace.

> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..858e62f1c7ba 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -53,6 +53,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>  #define   WDT_CTRL_ENABLE		BIT(0)
>  #define WDT_TIMEOUT_STATUS	0x10
>  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
> +#define WDT_CLEAR_TIMEOUT_STATUS	0x14
> +#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
>  
>  /*
>   * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -165,6 +167,29 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static ssize_t access_cs0_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t size)
> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (unlikely(!wdt))
> +		return -ENODEV;
> +

How would this ever happen, and how / where is drvdata set to NULL ?

> +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> +	wdt->wdd.bootstatus |= WDIOF_EXTERN1;

The variable reflects the _boot status_. It should not change after booting.

> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(access_cs0);
> +
> +static struct attribute *bswitch_attrs[] = {
> +	&dev_attr_access_cs0.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(bswitch);
> +
>  static const struct watchdog_ops aspeed_wdt_ops = {
>  	.start		= aspeed_wdt_start,
>  	.stop		= aspeed_wdt_stop,
> @@ -223,6 +248,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  
>  	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
>  
> +	if (of_property_read_bool(np, "aspeed,alt-boot"))
> +		wdt->wdd.groups = bswitch_groups;
> +
Why does this have to be separate to the existing evaluation of
aspeed,alt-boot, and why does the existing code not work ?

Also, is it guaranteed that this does not interfer with existing
support for alt-boot ?

>  	/*
>  	 * Control reset on a per-device basis to ensure the
>  	 * host is not affected by a BMC reboot
> @@ -309,6 +337,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
>  		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>  
> +	dev_set_drvdata(dev, wdt);
> +
>  	return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
>  
> -- 
> 2.20.1
> 
> 
