Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A1817C165
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 16:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgCFPMh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 10:12:37 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46156 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgCFPMh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 10:12:37 -0500
Received: by mail-pg1-f195.google.com with SMTP id y30so1197611pga.13;
        Fri, 06 Mar 2020 07:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2jk8iVYV4TDayIdRDshBh+WYf34SSidX9LJ0aaB408k=;
        b=atpLsL6CVaW/ZltvdF+uNru4piMUzAgvPpckdiSL6bYXsNBNC+hJpXQE3qnlAPLWfg
         ux7XBRvUkpX4FK6ltaRbPPuoKe8ErIydq3MzNsMJ69Dr/BRROwJFGm64K22K8zsWx6ZQ
         5PMoO/ImUcEOlm0/ngwZcP19NG+5UpFO72czzJS87fOgEjhgR9nNy+B0nTXl2mb6X68E
         bEkoC6sWzYqPtGbpj+V2fqnhUAHx+NFTChjo6yMnfcPvyh+5rz0D3d9d0pLxQlzBjoeW
         VJPDbavsrLuiBHKQxm9YN0p01a8Yi9PoaRdFBk7UflP9pW8ed/Vl172xZH4rejkO1s/M
         eSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2jk8iVYV4TDayIdRDshBh+WYf34SSidX9LJ0aaB408k=;
        b=isMwoz7eWR606Rw4Ua/Dgod0wUgf21k6H0ucpQj3accDKL61Ca01s+NllpkTRpiesg
         ZoGgF3EVEI5/GybmutIu0Ne+i4FNgabsdnAhPK4HptPxzwrTui7kJ1F0LDUdnx/IBwPz
         D1MzIQw1aGC87wgGEdVm27O0cw3gUdPPQBq4HbFjeC7uUHizhsz7RliQa3Nq7yBRvrnC
         RkVk7S6pAltElm1sf0Gt4M2pm1W+iDcev+Jvbw1ZIWxtZB7Eq7Q65GC6mZUw+LkcIMIs
         Yysum194qLVLS90nhU+Z1qjrHY02qiO3WSC853PdTPcgjx6IF0iCO3E2bWgYCGFa5+Yh
         RExQ==
X-Gm-Message-State: ANhLgQ31QP3+6xdiN4Uqwi91uHUumi0MsHe04Z9JSQyyVRZDK2FBW4oN
        bb9TN7Kj/1GBJzv9h9zG3ButbFOp
X-Google-Smtp-Source: ADFU+vuT0M/vFo5LZgwNEBi8C3vUEWTURtfAA6Sg6b90v1b3PCMF26DAbidrlPWyQ3B07+21QrsPiw==
X-Received: by 2002:a63:f962:: with SMTP id q34mr3707746pgk.229.1583507554840;
        Fri, 06 Mar 2020 07:12:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c20sm20753335pfc.140.2020.03.06.07.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 07:12:34 -0800 (PST)
Subject: Re: [PATCH 7/7] watchdog: dw_wdt: Add DebugFS files
To:     Sergey.Semin@baikalelectronics.ru,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132836.763718030786@mail.baikalelectronics.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <addd7387-b388-3977-575d-d63d77f8fd38@roeck-us.net>
Date:   Fri, 6 Mar 2020 07:12:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306132836.763718030786@mail.baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/6/20 5:27 AM, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> For the sake of the easier device-driver debug procedure, we added a
> few DebugFS files with the next content: watchdog timeout, watchdog
> pre-timeout, watchdog ping/kick operation, watchdog start/stop, device
> registers dump. They are available only if kernel is configured with
> DebugFS support.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  drivers/watchdog/dw_wdt.c | 150 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 3000120f7e39..9353d83f3e45 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -27,6 +27,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/watchdog.h>
> +#include <linux/debugfs.h>
>  
>  #define WDOG_CONTROL_REG_OFFSET		    0x00
>  #define WDOG_CONTROL_REG_WDT_EN_MASK	    0x01
> @@ -38,8 +39,14 @@
>  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
>  #define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
>  #define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
> +#define WDOG_COMP_PARAMS_5_REG_OFFSET       0xe4
> +#define WDOG_COMP_PARAMS_4_REG_OFFSET       0xe8
> +#define WDOG_COMP_PARAMS_3_REG_OFFSET       0xec
> +#define WDOG_COMP_PARAMS_2_REG_OFFSET       0xf0
>  #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
>  #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
> +#define WDOG_COMP_VERSION_REG_OFFSET        0xf8
> +#define WDOG_COMP_TYPE_REG_OFFSET           0xfc
>  
>  /* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
>  #define DW_WDT_NUM_TOPS		16
> @@ -79,6 +86,10 @@ struct dw_wdt {
>  	/* Save/restore */
>  	u32			control;
>  	u32			timeout;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry		*dbgfs_dir;
> +#endif
>  };
>  
>  #define to_dw_wdt(wdd)	container_of(wdd, struct dw_wdt, wdd)
> @@ -430,6 +441,141 @@ static void dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
>  			mult_frac(tops[idx], MSEC_PER_SEC, dw_wdt->rate);
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +
> +static int dw_wdt_dbgfs_timeout_get(void *priv, u64 *val)
> +{
> +	struct dw_wdt *dw_wdt = priv;
> +
> +	*val = dw_wdt_get_timeout(dw_wdt) / MSEC_PER_SEC;
> +
> +	return 0;
> +}
> +
> +static int dw_wdt_dbgfs_timeout_set(void *priv, u64 val)
> +{
> +	struct dw_wdt *dw_wdt = priv;
> +
> +	return dw_wdt_set_timeout(&dw_wdt->wdd, val);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_timeout_fops,
> +	dw_wdt_dbgfs_timeout_get, dw_wdt_dbgfs_timeout_set, "%llu\n");
> +
> +static int dw_wdt_dbgfs_pretimeout_get(void *priv, u64 *val)
> +{
> +	struct dw_wdt *dw_wdt = priv;
> +
> +	*val = dw_wdt->wdd.pretimeout;
> +
> +	return 0;
> +}
> +
> +static int dw_wdt_dbgfs_pretimeout_set(void *priv, u64 val)
> +{
> +	struct dw_wdt *dw_wdt = priv;
> +
> +	return dw_wdt_set_pretimeout(&dw_wdt->wdd, val);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_pretimeout_fops,
> +	dw_wdt_dbgfs_pretimeout_get, dw_wdt_dbgfs_pretimeout_set, "%llu\n");
> +
> +static int dw_wdt_dbgfs_ping_set(void *priv, u64 val)
> +{
> +	struct dw_wdt *dw_wdt = priv;
> +
> +	dw_wdt_ping(&dw_wdt->wdd);
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_ping_fops,
> +	NULL, dw_wdt_dbgfs_ping_set, "%llu\n");
> +
> +static int dw_wdt_dbgfs_en_get(void *priv, u64 *val)
> +{
> +	struct dw_wdt *dw_wdt = priv;
> +
> +	*val = !!dw_wdt_is_enabled(dw_wdt);
> +
> +	return 0;
> +}
> +
> +static int dw_wdt_dbgfs_en_set(void *priv, u64 val)
> +{
> +	struct dw_wdt *dw_wdt = priv;
> +
> +	if (val)
> +		dw_wdt_start(&dw_wdt->wdd);
> +	else
> +		dw_wdt_stop(&dw_wdt->wdd);
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_en_fops,
> +	dw_wdt_dbgfs_en_get, dw_wdt_dbgfs_en_set, "%llu\n");
> +
> +#define DW_WDT_DBGFS_REG(_name, _off) \
> +{				      \
> +	.name = _name,		      \
> +	.offset = _off		      \
> +}
> +
> +static const struct debugfs_reg32 dw_wdt_dbgfs_regs[] = {
> +	DW_WDT_DBGFS_REG("cr", WDOG_CONTROL_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("torr", WDOG_TIMEOUT_RANGE_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("ccvr", WDOG_CURRENT_COUNT_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("crr", WDOG_COUNTER_RESTART_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("stat", WDOG_INTERRUPT_STATUS_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param5", WDOG_COMP_PARAMS_5_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param4", WDOG_COMP_PARAMS_4_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param3", WDOG_COMP_PARAMS_3_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param2", WDOG_COMP_PARAMS_2_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param1", WDOG_COMP_PARAMS_1_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("version", WDOG_COMP_VERSION_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("type", WDOG_COMP_TYPE_REG_OFFSET)
> +};
> +
> +static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt)
> +{
> +	struct device *dev = dw_wdt->wdd.parent;
> +	struct debugfs_regset32 *regset;
> +
> +	regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
> +	if (!regset)
> +		return;
> +
> +	regset->regs = dw_wdt_dbgfs_regs;
> +	regset->nregs = ARRAY_SIZE(dw_wdt_dbgfs_regs);
> +	regset->base = dw_wdt->regs;
> +
> +	dw_wdt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> +
> +	debugfs_create_regset32("registers", 0444, dw_wdt->dbgfs_dir, regset);
> +
> +	debugfs_create_file_unsafe("timeout", 0600, dw_wdt->dbgfs_dir,
> +				   dw_wdt, &dw_wdt_dbgfs_timeout_fops);
> +
> +	debugfs_create_file_unsafe("pretimeout", 0600, dw_wdt->dbgfs_dir,
> +				   dw_wdt, &dw_wdt_dbgfs_pretimeout_fops);
> +
> +	debugfs_create_file_unsafe("ping", 0200, dw_wdt->dbgfs_dir,
> +				   dw_wdt, &dw_wdt_dbgfs_ping_fops);
> +
> +	debugfs_create_file_unsafe("enable", 0600, dw_wdt->dbgfs_dir,
> +				   dw_wdt, &dw_wdt_dbgfs_en_fops);
> +}

I don't oppose debugfs support in general, but I really don't see
the point replicating watchdog core functionality for it - even more so
since this bypasses the watchdog core. This lets one, for example,
enable the watchdog and then unload the driver with the watchdog
running. This is not only unnecessary, it is way too dangerous,
debugfs or not.

NACK for that part.

Guenter

> +
> +static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt)
> +{
> +	debugfs_remove_recursive(dw_wdt->dbgfs_dir);
> +}
> +
> +#else /* !CONFIG_DEBUG_FS */
> +
> +static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt) {}
> +static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt) {}
> +
> +#endif /* !CONFIG_DEBUG_FS */
> +
>  static int dw_wdt_drv_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -544,6 +690,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_disable_pclk;
>  
> +	dw_wdt_dbgfs_init(dw_wdt);
> +
>  	return 0;
>  
>  out_disable_pclk:
> @@ -558,6 +706,8 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
>  {
>  	struct dw_wdt *dw_wdt = platform_get_drvdata(pdev);
>  
> +	dw_wdt_dbgfs_clear(dw_wdt);
> +
>  	watchdog_unregister_device(&dw_wdt->wdd);
>  	reset_control_assert(dw_wdt->rst);
>  	clk_disable_unprepare(dw_wdt->pclk);
> 

