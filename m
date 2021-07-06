Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F403D3BD7CE
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Jul 2021 15:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhGFNa7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Jul 2021 09:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhGFNa7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Jul 2021 09:30:59 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B471C061574
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Jul 2021 06:28:19 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so21551006otl.3
        for <linux-watchdog@vger.kernel.org>; Tue, 06 Jul 2021 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=agqr9TJxpmVwNqpiQGGC4WPnBChFQHb9wQf2DQR8Zdc=;
        b=aqaOFB7stFvV4TIZSfuyKXMgWGqJh8+drVq/32fzcYdDdiffi29ESMhUxATQ/xNMMC
         scZaQhkO7I1iXEWvnG0DGkWES1V5jWqWgmWs519gDu/3x7EYjhy0IRa5bclT/dxBQAO/
         TfQhhN30smxSFcghOLk9emuZPfrqAT9TH36f2iIqKx9QGEVDrgbk4MD9QN2hXMMd7XL4
         PAzkHouhVhd2UPt5qeI1G0zpyhGSI6a7+OlEW38EvnML1a1V+gMMn3xTGdYTYlYNxkwE
         wVm39PMz78KgRLMydKpMrvhsit9iVyk/6zmzknOEut1vVBFH0NbQqFvONY+iHvPy4I54
         qf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=agqr9TJxpmVwNqpiQGGC4WPnBChFQHb9wQf2DQR8Zdc=;
        b=ukE8x5k69K1AbO+A3k3qdEr+yFqUFbJTZTCo97KdN+VhQ1xo6kkaO+qaD53i1yggEe
         RD8xwfg2E720deRKE3giriyugH9q9uvFEAbPLLLT767EukI/9fhwAC701QODuzJF1jiq
         EMWUjZXGsfl3ISTgZrqiyrkVoiCCXI6XGfh5qjqMYtaocgjB6ECdUK7eDOEKJccmwu8L
         oJYExHaVjJcHgpmFy9McBeldBM6rHAYwHqbluIsqxFxy6sSufdcnGPkV8oyZAASy3Rwb
         bBkadnLhD7AYPa0guKgMh6qycuBTiZdBRLA4LUpGAX0YJRV5Oh20cnBAtyr/Izu4u9P5
         QmVQ==
X-Gm-Message-State: AOAM5334MRzELy+Nesh6UiGb7qJow2Z2ngSlx+kDXhXX7N3iZbIY7bOi
        jHJoqlfY8KWdYobDC/ytoP7uqLCNnhM=
X-Google-Smtp-Source: ABdhPJy35b89SVYDQhk7pgruJiwlrG6ZxlPWdcOyXtuNBRpSSTdz3CeeWyWhNsJHfBd2++m8C6h9Sw==
X-Received: by 2002:a9d:6f10:: with SMTP id n16mr15105202otq.17.1625578098846;
        Tue, 06 Jul 2021 06:28:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l8sm2837553ooo.13.2021.07.06.06.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 06:28:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: da9062: da9063: prevent watchdog pings ahead of
 reboot
To:     Primoz Fiser <primoz.fiser@norik.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20210706112103.1687587-1-primoz.fiser@norik.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4fc1998d-ed3b-6934-9d05-62ac68659744@roeck-us.net>
Date:   Tue, 6 Jul 2021 06:28:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706112103.1687587-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/6/21 4:21 AM, Primoz Fiser wrote:
> Proper machine resets via da9062/da9063 PMICs are very tricky as they
> require special i2c atomic transfers when interrupts are not available
> anymore. This is also a reason why both PMIC's restart handlers do not
> use regmap but instead opt for i2c_smbus_write_byte_data() which does
> i2c transfer in atomic manner. Under the hood, this function tries to
> obtain i2c bus lock with call to i2c_adapter_trylock_bus() which will
> return -EAGAIN (-11) if lock is not available.
> 
> Since commit 982bb70517aef ("watchdog: reset last_hw_keepalive time at
> start") occasional restart handler failures with "Failed to shutdown
> (err = -11)" error messages were observed, indicating that some
> process is holding the i2c bus lock. Investigation into the matter
> uncovered that sometimes during reboot sequence watchdog ping is issued
> late into reboot phase which didn't happen before mentioned commit
> (usually watchdog ping happened immediately as commit message suggests).
> As of now, when watchdog ping usually happens late into reboot stage
> when interrupts are not available anymore, i2c bus lock cannot be
> released anymore and pending restart handler in turn fails.
> 
> Thus, to prevent such late watchdog pings from happening ahead of
> pending machine restart and consequently locking up the i2c bus, install
> a reboot notifier callback in both PMIC's watchdog drivers. When reboot
> notifier is called, it will raise the restart_pending flag signaling to
> the watchdog ping handler to not send pings anymore.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>   drivers/watchdog/da9062_wdt.c   | 26 ++++++++++++++++++++++++++
>   drivers/watchdog/da9063_wdt.c   | 22 ++++++++++++++++++++++
>   include/linux/mfd/da9063/core.h |  3 +++
>   3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 706fb09c2f24..ebb45d445d87 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -19,6 +19,7 @@
>   #include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/of.h>
> +#include <linux/reboot.h>
>   
>   static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
>   #define DA9062_TWDSCALE_DISABLE		0
> @@ -33,6 +34,9 @@ struct da9062_watchdog {
>   	struct da9062 *hw;
>   	struct watchdog_device wdtdev;
>   	bool use_sw_pm;
> +
> +	struct notifier_block reboot_nb;
> +	bool restart_pending;
>   };
>   
>   static unsigned int da9062_wdt_read_timeout(struct da9062_watchdog *wdt)
> @@ -117,6 +121,9 @@ static int da9062_wdt_ping(struct watchdog_device *wdd)
>   	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
>   	int ret;
>   
> +	if (wdt->restart_pending)
> +		return 0;
> +
>   	ret = da9062_reset_watchdog_timer(wdt);
>   	if (ret)
>   		dev_err(wdt->hw->dev, "Failed to ping the watchdog (err = %d)\n",
> @@ -143,6 +150,22 @@ static int da9062_wdt_set_timeout(struct watchdog_device *wdd,
>   	return ret;
>   }
>   
> +static int da9062_wdt_reboot_notifier(struct notifier_block *nb,
> +				  unsigned long code, void *unused)
> +{
> +	struct da9062_watchdog *wdt =
> +			container_of(nb, struct da9062_watchdog, reboot_nb);
> +
> +	/*
> +	 * Use reboot notifer to raise flag and in turn prevent watchdog pings
> +	 * from occurring late in system reboot sequence and possibly locking
> +	 * out restart handler from accessing i2c bus.
> +	 */
> +	wdt->restart_pending = true;
> +
> +	return NOTIFY_DONE;
> +}
> +
>   static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>   			      void *data)
>   {
> @@ -229,6 +252,9 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>   		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
>   	}
>   
> +	wdt->reboot_nb.notifier_call = da9062_wdt_reboot_notifier;
> +	devm_register_reboot_notifier(dev, &wdt->reboot_nb);
> +
>   	return devm_watchdog_register_device(dev, &wdt->wdtdev);
>   }
>   
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index 423584252606..bea2ba62dff2 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -18,6 +18,7 @@
>   #include <linux/mfd/da9063/registers.h>
>   #include <linux/mfd/da9063/core.h>
>   #include <linux/regmap.h>
> +#include <linux/reboot.h>
>   
>   /*
>    * Watchdog selector to timeout in seconds.
> @@ -121,6 +122,9 @@ static int da9063_wdt_ping(struct watchdog_device *wdd)
>   	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
>   	int ret;
>   
> +	if (da9063->restart_pending)
> +		return 0;
> +

Why all that complexity and not just check system_state here ?

Guenter

>   	ret = regmap_write(da9063->regmap, DA9063_REG_CONTROL_F,
>   			   DA9063_WATCHDOG);
>   	if (ret)
> @@ -158,6 +162,21 @@ static int da9063_wdt_set_timeout(struct watchdog_device *wdd,
>   	return ret;
>   }
>   
> +static int da9063_wdt_reboot_notifier(struct notifier_block *nb,
> +				  unsigned long code, void *unused)
> +{
> +	struct da9063 *da9063 = container_of(nb, struct da9063, reboot_nb);
> +
> +	/*
> +	 * Use reboot notifer to raise flag and in turn prevent watchdog pings
> +	 * from occurring late in system reboot sequence and possibly locking
> +	 * out restart handler from accessing i2c bus.
> +	 */
> +	da9063->restart_pending = true;
> +
> +	return NOTIFY_DONE;
> +}
> +
>   static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>   			      void *data)
>   {
> @@ -233,6 +252,9 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>   		set_bit(WDOG_HW_RUNNING, &wdd->status);
>   	}
>   
> +	da9063->reboot_nb.notifier_call = da9063_wdt_reboot_notifier;
> +	devm_register_reboot_notifier(dev, &da9063->reboot_nb);
> +
>   	return devm_watchdog_register_device(dev, wdd);
>   }
>   
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> index fa7a43f02f27..6be39fd9300d 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -85,6 +85,9 @@ struct da9063 {
>   	int		chip_irq;
>   	unsigned int	irq_base;
>   	struct regmap_irq_chip_data *regmap_irq;
> +
> +	struct notifier_block reboot_nb;
> +	bool restart_pending;
>   };
>   
>   int da9063_device_init(struct da9063 *da9063, unsigned int irq);
> 

