Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD9469B1BD
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Aug 2019 16:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390398AbfHWOTe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Aug 2019 10:19:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:47050 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390234AbfHWOTd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Aug 2019 10:19:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id q139so6537451pfc.13;
        Fri, 23 Aug 2019 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ATCgi1Sogh8xX//ITzLr0C3oCB9rJq6klExJFgC99wk=;
        b=MX6bUf+/9Pr+Mih2RzamjzGFDvamjBBVObGGRSU2DW4pK8Lh6MpQt0E6uHZsSAVS7f
         YenWpoaVjJG+XxFvAeS9QB7xfnXUcyjXMpkuyjfbx5dkYHOTZegtXuGZ8P0BOEklfQn+
         yQdsCWD9bOYS/WF06y738602EXzJkdiDKxhYV6E5v73tFv+S9FdaTBY+0ZKyhbXjIvZG
         utPTLaJSBlIOs/B+tCpcXqzenocmxxqNEdgvJvwt3DZ4/p01AhF/ER/AeZu9kzMM9e9O
         QT3aaYnKAmUP8Q62w7oDoThj3aixcTac36nJA47OoZMsTT6yGuvatR+asjCuzQh8A07O
         k2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ATCgi1Sogh8xX//ITzLr0C3oCB9rJq6klExJFgC99wk=;
        b=fS+G2Gi3Fkfo3XvyaXrTZgXjPg1hIZnHkJKzrb1kHOO3uCtiSoiOfoe7k+HbxVl2tP
         0Q9JCdsLoCSUh87QrIygYJ5HubGM7MBGOqH0tvm2Cr0LWjTGwwx6tX6dXNWOXCKR6LWZ
         gjofYGyAJYdmFcMOzpUqkReQZVuupeiammMULuZK2hiX/sLOrATd/TX5ab/sdBDqDD14
         E33FCbDdep68LiD4OijNpw8JJpQKio3o62U06Enp9P/SRa5pDLxUZDI0VLBBTB0tWnLB
         xKfNyNDx5GXi690FDciLg3o5MvkzHDbqGzN0JtWPHcaG5RnGTzX2b3GEUHJEX4puot1a
         HP2A==
X-Gm-Message-State: APjAAAUo5bss8s9CM3YXfU/49EKYuhVGLu6+o0Q+4v0C67Fy9upakSZT
        2CWduoxfbzspjjhX1X11jdZmVKyo
X-Google-Smtp-Source: APXvYqxULzxl6gBv9C/yDCUlvYScoI2YH9z2w7u10ezY3qZ82ieomNLXNu8OJeZ7a3FW6rb7HwkbZQ==
X-Received: by 2002:a65:4c4d:: with SMTP id l13mr4137814pgr.156.1566569973137;
        Fri, 23 Aug 2019 07:19:33 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id x24sm2099614pgl.84.2019.08.23.07.19.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 07:19:31 -0700 (PDT)
Date:   Fri, 23 Aug 2019 07:19:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 3/3] watchdog/aspeed: add support for dual boot
Message-ID: <20190823141930.GA11610@roeck-us.net>
References: <fafd757238e204b2566f216f1d6a4bef4b4906c5.camel@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fafd757238e204b2566f216f1d6a4bef4b4906c5.camel@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 23, 2019 at 12:35:28PM +0300, Ivan Mikhaylov wrote:
> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> to clear out boot code source and re-enable access to the primary SPI flash
> chip while booted via wdt2 from the alternate chip.
> 
> AST2400 datasheet says:
> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> re-directed to CS1#. And CS0# is not accessable under this mode. To access
> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> register WDT30.bit[1]."
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 44 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..62bf95cb741f 100644
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
> @@ -165,6 +167,42 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +/* access_cs0 shows if cs0 is accessible, hence the reverted bit */
> +static ssize_t access_cs0_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> +

Unnecessary empty line.

> +	uint32_t status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> +
> +	return sprintf(buf, "%u\n",
> +			!(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
> +}
> +
> +static ssize_t access_cs0_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t size)
> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> +	unsigned long val = 0;

Unnecessary initialization.

> +
> +	if (kstrtoul(buf, 10, &val))
> +		return -EINVAL;
> +
> +	if (val)
> +		writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(access_cs0);
> +
> +static struct attribute *bswitch_attrs[] = {
> +	&dev_attr_access_cs0.attr,

The attribute needs to be documented.

> +	NULL
> +};
> +ATTRIBUTE_GROUPS(bswitch);
> +
>  static const struct watchdog_ops aspeed_wdt_ops = {
>  	.start		= aspeed_wdt_start,
>  	.stop		= aspeed_wdt_stop,
> @@ -306,8 +344,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
> +	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
>  		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +		wdt->wdd.groups = bswitch_groups;
> +	}

So the attribute would only exist if the boot was from the secondary
flash, and it would exist even if it wasn't needed (ie on ast2500 /
ast2600) ? Well, if that is what you want, who am I to argue, but
you'll have to document it accordingly. When you do so, please also
document what happens on ast2500 / ast2600 when the attribute exists
and is written.

> +
> +	dev_set_drvdata(dev, wdt);
>  
>  	return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
> -- 
> 2.20.1
> 
> 
