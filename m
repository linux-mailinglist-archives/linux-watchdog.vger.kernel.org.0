Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E749DA72
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 02:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfH0AOb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Aug 2019 20:14:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33887 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfH0AOb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Aug 2019 20:14:31 -0400
Received: by mail-pf1-f193.google.com with SMTP id b24so12904524pfp.1;
        Mon, 26 Aug 2019 17:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nJ8C78NoAqVqSum3LuoxAwskIWISqkgXdmo5sYpNHfk=;
        b=GUuYMNh/Zq9M6fu3kKwUR7xomor6vHtCuypnWT895hvqEeOCsaQgqtTUlpLfLT1S+o
         NkpHhFzliH5Lcd84Iu2vU+E93qYlREQSqB5+xntHrnTGwYhb6XslmoRGqDumw2vz8Cor
         gEEwJ/AjDkn2qUKos9LEGcfdNXCSjKxjhehiLRsTJy7tM9CAV4p+NEyo6yGR1FF55cjV
         OE/DMCIAu3bKaQj0ARtBGTikFBgjgIdsC53XHtFkTBr4qbZXUy/w/E9S7pqRNYzi8Wt1
         bPf/p5vnV6zh1RU0pVL4/yFQGTGekQqeYVcjLyQIac4bJBvIcasZ8ywgiG6Fd4tStHiT
         rLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nJ8C78NoAqVqSum3LuoxAwskIWISqkgXdmo5sYpNHfk=;
        b=W9eny5tw32Z0PZ81yhfvP2wH3e9qF9ohix3GMBUlz8uEj8qPa6ib/OeyZp9k7CgPnO
         UbeXji+QHXxKQpFaa4eMxebIWDovXGuvCcxz4XbhAlyNVGCtb4lomTWt/LxKXR1B1rr5
         B7tfniVVkXK+IYyPZG4JAINAXLdsCbCJ8eu50+M94NGHDvQ7FuYp7WjVf7ANTfq7vou7
         UFMvF4FNEsvDBjZN6tITzK9uKfnw5TJh+DKOEkjYCh6lCUKlZJWDOGIyMcNL2mhxEBDv
         6APyRxd9Fb11k8VlzJR6a53B5kVja4jIgPjmf/KSvCRaZZbYXWYZARwzZBNn1UQN7C+E
         yf4Q==
X-Gm-Message-State: APjAAAUIQ2EPVenO7cklpyarX0QGShauyyWThp09eMzT9UGrOQthaV3j
        FoADKM6FL2M9lAklKYXbD4tvYSPv
X-Google-Smtp-Source: APXvYqxvhXCKutjPnT5nWH3BMk7cObsbeQwIEFqub1CAyoV7XPoqs0YnakBp1Z0eeWOxE2cRwsTUlw==
X-Received: by 2002:a63:460d:: with SMTP id t13mr18245482pga.205.1566864869792;
        Mon, 26 Aug 2019 17:14:29 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id j11sm4723844pfa.113.2019.08.26.17.14.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 17:14:29 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] watchdog/aspeed: add support for dual boot
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>,
        openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-4-i.mikhaylov@yadro.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0df27d36-b45f-2059-6ead-a09ceb4b7605@roeck-us.net>
Date:   Mon, 26 Aug 2019 17:14:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826104636.19324-4-i.mikhaylov@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/26/19 3:46 AM, Ivan Mikhaylov wrote:
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
>   drivers/watchdog/aspeed_wdt.c | 62 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..bbc42847c0e3 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -53,6 +53,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define   WDT_CTRL_ENABLE		BIT(0)
>   #define WDT_TIMEOUT_STATUS	0x10
>   #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
> +#define WDT_CLEAR_TIMEOUT_STATUS	0x14
> +#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
>   
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -165,6 +167,57 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +/* access_cs0 shows if cs0 is accessible, hence the reverted bit */
> +static ssize_t access_cs0_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)

This and other multi-line declarations do not appear to be aligned
with '('.

> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
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
> +	unsigned long val;
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
> +
> +/*
> + * At alternate side the 'access_cs0' sysfs node provides:
> + *   ast2400: a way to get access to the primary SPI flash chip at CS0
> + *            after booting from the alternate chip at CS1.
> + *   ast2500: a way to restore the normal address mapping from
> + *            (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
> + *
> + * Clearing the boot code selection and timeout counter also resets to the
> + * initial state the chip select line mapping. When the SoC is in normal
> + * mapping state (i.e. booted from CS0), clearing those bits does nothing for
> + * both versions of the SoC. For alternate boot mode (booted from CS1 due to
> + * wdt2 expiration) the behavior differs as described above.
> + *
The above needs to be in the sysfs attribute documentation as well.

> + * This option can be used with wdt2 (watchdog1) only.

This implies a specific watchdog numbering which is not guaranteed.
Someone might implement a system with some external watchdog.

> + */
> +static DEVICE_ATTR_RW(access_cs0);
> +
> +static struct attribute *bswitch_attrs[] = {
> +	&dev_attr_access_cs0.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(bswitch);
> +
>   static const struct watchdog_ops aspeed_wdt_ops = {
>   	.start		= aspeed_wdt_start,
>   	.stop		= aspeed_wdt_stop,
> @@ -306,9 +359,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
> +	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
>   		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>   
> +		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
> +			of_device_is_compatible(np, "aspeed,ast2500-wdt"))
> +			wdt->wdd.groups = bswitch_groups;

Kind of odd that the attribute only exists if the system booted from the
second flash, but if that is what you want I won't object. Just make sure
that this is explained properly.

> +	}
> +
> +	dev_set_drvdata(dev, wdt);
> +
>   	return devm_watchdog_register_device(dev, &wdt->wdd);
>   }
>   
> 

