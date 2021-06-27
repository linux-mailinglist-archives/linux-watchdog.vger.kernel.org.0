Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900A43B53EB
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 16:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhF0Ozz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 10:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhF0Ozy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 10:55:54 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A838EC061574;
        Sun, 27 Jun 2021 07:53:29 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id g13-20020a4ac4cd0000b029024c717ed8aeso892346ooq.13;
        Sun, 27 Jun 2021 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MSuJhLIrLNhgVyIAAZFmyHKfxV9dInag09hASwRVERY=;
        b=Eif8tuBQtdvvbg9Q9wN8hRCgb7x3BjaIHWfBemz99qepiFNNUbx4iAWFfJIsWYg4SY
         UPhsRLt4zOy83oEDah0TgRPduZRR58lCsWSoIopq6sK/FjGNnEInruLZAhZB6Gf7o5DB
         frF5jrF7EX3+2V45727NePM/LdEHGeTUdGXao4BKNB9roAKsHCW0caEkXJcAtlNrIzIl
         6GyhGQ0jvi5rFjsBHwliAQPOBGh3eBgrRCFsCIa8j8wluySVWfKLDRFln55uRUe1pucV
         goYCMML9cDbozoWZ5MeM1tAFT7AI+1B1ridrvRgr6vWLnI29lKIVrljGMIFJoK0lm/x3
         K5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MSuJhLIrLNhgVyIAAZFmyHKfxV9dInag09hASwRVERY=;
        b=axqCTn2D8QJwb1yjmuYDfF2Wj57kol+SLVKFf3Ig0nRSQeQBoG9Hwd9dboVSpGsCXQ
         biNyvmBGt0gk4/ugF/K9mlYCSEb77UH8JqetQ8k79Yvuc2oSO6YJDbqG01MMve6jowP0
         utowuXFQuOburZAEWe83hMFpWVwySHJTDCXoy+ESdjekPYPeJyA+Ant7cGD31jVuwhTP
         0zyS8GcQw/0Ji2lZJXPPXWBbpgPh3teUZO4NynRY5uERmNLCfm9BS+eC4BaYI4PnTOrS
         +rXAT9vfxmFO0CC/tkk53KApwb7yj2LpFuV4YDl765tuovA+HGkGFxLA9oCO5mx+QLq+
         MsNA==
X-Gm-Message-State: AOAM531XXJmyvtkOhd/TsWHLWvOEoe2SCUziV7TYUT+/W/morkaa/XnB
        VEUfUuGqr5jN/SRibxNnRMI=
X-Google-Smtp-Source: ABdhPJzWHAVOOG+baMfQhLC4BFlVVGCkLC0JiDYEum9GzKf7sRsPkq4uG03G3dRmsDETJkoLIEEA5Q==
X-Received: by 2002:a4a:6049:: with SMTP id t9mr16138727oof.14.1624805608978;
        Sun, 27 Jun 2021 07:53:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l2sm927157otk.38.2021.06.27.07.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 07:53:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Prefer unsigned int to bare use of unsigned
To:     Jinchao Wang <wjc@cdjrlc.com>, wim@linux-watchdog.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        baruch@tkos.co.il, vilhelm.gray@gmail.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20210626090835.51754-1-wjc@cdjrlc.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d9be9f8b-4623-f72f-e9dd-a95ea39ed6b7@roeck-us.net>
Date:   Sun, 27 Jun 2021 07:53:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210626090835.51754-1-wjc@cdjrlc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/26/21 2:08 AM, Jinchao Wang wrote:
> Fix checkpatch warnings:
>      WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Signed-off-by: Jinchao Wang <wjc@cdjrlc.com>
> ---
>   drivers/watchdog/ar7_wdt.c          | 2 +-
>   drivers/watchdog/ath79_wdt.c        | 4 ++--
>   drivers/watchdog/bcm_kona_wdt.c     | 6 +++---
>   drivers/watchdog/digicolor_wdt.c    | 2 +-
>   drivers/watchdog/ebc-c384_wdt.c     | 6 +++---
>   drivers/watchdog/imx2_wdt.c         | 2 +-
>   drivers/watchdog/it8712f_wdt.c      | 2 +-
>   drivers/watchdog/mt7621_wdt.c       | 4 ++--
>   drivers/watchdog/omap_wdt.c         | 2 +-
>   drivers/watchdog/pika_wdt.c         | 2 +-
>   drivers/watchdog/rt2880_wdt.c       | 4 ++--
>   drivers/watchdog/sbc7240_wdt.c      | 2 +-
>   drivers/watchdog/shwdt.c            | 2 +-
>   drivers/watchdog/stmp3xxx_rtc_wdt.c | 4 ++--
>   drivers/watchdog/w83977f_wdt.c      | 2 +-
>   drivers/watchdog/watchdog_dev.c     | 2 +-
>   16 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
> index ff37dc91057d..822719fdd944 100644
> --- a/drivers/watchdog/ar7_wdt.c
> +++ b/drivers/watchdog/ar7_wdt.c
> @@ -57,7 +57,7 @@ struct ar7_wdt {
>   };
>   
>   static unsigned long wdt_is_open;
> -static unsigned expect_close;
> +static unsigned int expect_close;
>   static DEFINE_SPINLOCK(wdt_lock);
>   
>   /* XXX currently fixed, allows max margin ~68.72 secs */
> diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
> index 0f18f06a21b6..567e25df804b 100644
> --- a/drivers/watchdog/ath79_wdt.c
> +++ b/drivers/watchdog/ath79_wdt.c
> @@ -68,12 +68,12 @@ static int boot_status;
>   static int max_timeout;
>   static void __iomem *wdt_base;
>   
> -static inline void ath79_wdt_wr(unsigned reg, u32 val)
> +static inline void ath79_wdt_wr(unsigned int reg, u32 val)
>   {
>   	iowrite32(val, wdt_base + reg);
>   }
>   
> -static inline u32 ath79_wdt_rr(unsigned reg)
> +static inline u32 ath79_wdt_rr(unsigned int reg)
>   {
>   	return ioread32(wdt_base + reg);
>   }
> diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
> index 8237c4e9c2a0..200965cdc670 100644
> --- a/drivers/watchdog/bcm_kona_wdt.c
> +++ b/drivers/watchdog/bcm_kona_wdt.c
> @@ -58,7 +58,7 @@ struct bcm_kona_wdt {
>   static int secure_register_read(struct bcm_kona_wdt *wdt, uint32_t offset)
>   {
>   	uint32_t val;
> -	unsigned count = 0;
> +	unsigned int count = 0;
>   
>   	/*
>   	 * If the WD_LOAD_FLAG is set, the watchdog counter field is being
> @@ -165,7 +165,7 @@ static void bcm_kona_wdt_debug_exit(struct platform_device *pdev) {}
>   #endif /* CONFIG_BCM_KONA_WDT_DEBUG */
>   
>   static int bcm_kona_wdt_ctrl_reg_modify(struct bcm_kona_wdt *wdt,
> -					unsigned mask, unsigned newval)
> +		unsigned int  mask, unsigned int newval)

... but not at the cost of introducing alignment issues.

Guenter

>   {
>   	int val;
>   	unsigned long flags;
> @@ -197,7 +197,7 @@ static int bcm_kona_wdt_set_resolution_reg(struct bcm_kona_wdt *wdt)
>   }
>   
>   static int bcm_kona_wdt_set_timeout_reg(struct watchdog_device *wdog,
> -					unsigned watchdog_flags)
> +					unsigned int watchdog_flags)
>   {
>   	struct bcm_kona_wdt *wdt = watchdog_get_drvdata(wdog);
>   
> diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
> index 073d37867f47..95a0053a5f30 100644
> --- a/drivers/watchdog/digicolor_wdt.c
> +++ b/drivers/watchdog/digicolor_wdt.c
> @@ -27,7 +27,7 @@ struct dc_wdt {
>   	spinlock_t		lock;
>   };
>   
> -static unsigned timeout;
> +static unsigned int timeout;
>   module_param(timeout, uint, 0);
>   MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
>   
> diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
> index 8ef4b0df3855..7b408421bb38 100644
> --- a/drivers/watchdog/ebc-c384_wdt.c
> +++ b/drivers/watchdog/ebc-c384_wdt.c
> @@ -32,14 +32,14 @@ module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> -static unsigned timeout;
> +static unsigned int timeout;
>   module_param(timeout, uint, 0);
>   MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
>   	__MODULE_STRING(WATCHDOG_TIMEOUT) ")");
>   
>   static int ebc_c384_wdt_start(struct watchdog_device *wdev)
>   {
> -	unsigned t = wdev->timeout;
> +	unsigned int t = wdev->timeout;
>   
>   	/* resolution is in minutes for timeouts greater than 255 seconds */
>   	if (t > 255)
> @@ -57,7 +57,7 @@ static int ebc_c384_wdt_stop(struct watchdog_device *wdev)
>   	return 0;
>   }
>   
> -static int ebc_c384_wdt_set_timeout(struct watchdog_device *wdev, unsigned t)
> +static int ebc_c384_wdt_set_timeout(struct watchdog_device *wdev, unsigned int t)
>   {
>   	/* resolution is in minutes for timeouts greater than 255 seconds */
>   	if (t > 255) {
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index cc86018c5eb5..3b42e194e3a8 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -73,7 +73,7 @@ module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> -static unsigned timeout;
> +static unsigned int timeout;
>   module_param(timeout, uint, 0);
>   MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
>   				__MODULE_STRING(IMX2_WDT_DEFAULT_TIME) ")");
> diff --git a/drivers/watchdog/it8712f_wdt.c b/drivers/watchdog/it8712f_wdt.c
> index 3ce6a58bd81e..2c18701ff883 100644
> --- a/drivers/watchdog/it8712f_wdt.c
> +++ b/drivers/watchdog/it8712f_wdt.c
> @@ -47,7 +47,7 @@ module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Disable watchdog shutdown on close");
>   
>   static unsigned long wdt_open;
> -static unsigned expect_close;
> +static unsigned int expect_close;
>   static unsigned char revision;
>   
>   /* Dog Food address - We use the game port address */
> diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
> index a8aa3522cfda..0c7e0b478d85 100644
> --- a/drivers/watchdog/mt7621_wdt.c
> +++ b/drivers/watchdog/mt7621_wdt.c
> @@ -40,12 +40,12 @@ MODULE_PARM_DESC(nowayout,
>   		 "Watchdog cannot be stopped once started (default="
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> -static inline void rt_wdt_w32(unsigned reg, u32 val)
> +static inline void rt_wdt_w32(unsigned int reg, u32 val)
>   {
>   	iowrite32(val, mt7621_wdt_base + reg);
>   }
>   
> -static inline u32 rt_wdt_r32(unsigned reg)
> +static inline u32 rt_wdt_r32(unsigned int reg)
>   {
>   	return ioread32(mt7621_wdt_base + reg);
>   }
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index 1616f93dfad7..062ff05436ba 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -48,7 +48,7 @@ module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
>   	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> -static unsigned timer_margin;
> +static unsigned int timer_margin;
>   module_param(timer_margin, uint, 0);
>   MODULE_PARM_DESC(timer_margin, "initial watchdog timeout (in seconds)");
>   
> diff --git a/drivers/watchdog/pika_wdt.c b/drivers/watchdog/pika_wdt.c
> index a98abd0d3146..8ce915bf4a6e 100644
> --- a/drivers/watchdog/pika_wdt.c
> +++ b/drivers/watchdog/pika_wdt.c
> @@ -77,7 +77,7 @@ static inline void pikawdt_reset(void)
>   	 *           seconds. Valid ranges are 1 to 15 seconds. The value can
>   	 *           be modified dynamically.
>   	 */
> -	unsigned reset = in_be32(pikawdt_private.fpga + 0x14);
> +	unsigned int reset = in_be32(pikawdt_private.fpga + 0x14);
>   	/* enable with max timeout - 15 seconds */
>   	reset |= (1 << 7) + (WDT_HW_TIMEOUT << 8);
>   	out_be32(pikawdt_private.fpga + 0x14, reset);
> diff --git a/drivers/watchdog/rt2880_wdt.c b/drivers/watchdog/rt2880_wdt.c
> index 49aff800824d..9ae678d1a47c 100644
> --- a/drivers/watchdog/rt2880_wdt.c
> +++ b/drivers/watchdog/rt2880_wdt.c
> @@ -51,12 +51,12 @@ MODULE_PARM_DESC(nowayout,
>   		"Watchdog cannot be stopped once started (default="
>   		__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> -static inline void rt_wdt_w32(unsigned reg, u32 val)
> +static inline void rt_wdt_w32(unsigned int reg, u32 val)
>   {
>   	iowrite32(val, rt288x_wdt_base + reg);
>   }
>   
> -static inline u32 rt_wdt_r32(unsigned reg)
> +static inline u32 rt_wdt_r32(unsigned int reg)
>   {
>   	return ioread32(rt288x_wdt_base + reg);
>   }
> diff --git a/drivers/watchdog/sbc7240_wdt.c b/drivers/watchdog/sbc7240_wdt.c
> index d640b26e18a6..53b5fcfd5f9e 100644
> --- a/drivers/watchdog/sbc7240_wdt.c
> +++ b/drivers/watchdog/sbc7240_wdt.c
> @@ -75,7 +75,7 @@ static int wdt_set_timeout(int t)
>   		return -1;
>   	}
>   	/* set the timeout */
> -	outb_p((unsigned)t, SBC7240_SET_TIMEOUT_PORT);
> +	outb_p((unsigned int)t, SBC7240_SET_TIMEOUT_PORT);
>   	timeout = t;
>   	pr_info("timeout set to %d seconds\n", t);
>   	return 0;
> diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
> index f55533e0e045..2bc250676c9d 100644
> --- a/drivers/watchdog/shwdt.c
> +++ b/drivers/watchdog/shwdt.c
> @@ -155,7 +155,7 @@ static int sh_wdt_keepalive(struct watchdog_device *wdt_dev)
>   	return 0;
>   }
>   
> -static int sh_wdt_set_heartbeat(struct watchdog_device *wdt_dev, unsigned t)
> +static int sh_wdt_set_heartbeat(struct watchdog_device *wdt_dev, unsigned int t)
>   {
>   	struct sh_wdt *wdt = watchdog_get_drvdata(wdt_dev);
>   	unsigned long flags;
> diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
> index 7caf3aa71c6a..9b931953d9a8 100644
> --- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
> +++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
> @@ -42,7 +42,7 @@ static int wdt_stop(struct watchdog_device *wdd)
>   	return 0;
>   }
>   
> -static int wdt_set_timeout(struct watchdog_device *wdd, unsigned new_timeout)
> +static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int new_timeout)
>   {
>   	wdd->timeout = new_timeout;
>   	return wdt_start(wdd);
> @@ -94,7 +94,7 @@ static int stmp3xxx_wdt_probe(struct platform_device *pdev)
>   
>   	watchdog_set_drvdata(&stmp3xxx_wdd, dev);
>   
> -	stmp3xxx_wdd.timeout = clamp_t(unsigned, heartbeat, 1, STMP3XXX_MAX_TIMEOUT);
> +	stmp3xxx_wdd.timeout = clamp_t(unsigned int, heartbeat, 1, STMP3XXX_MAX_TIMEOUT);
>   	stmp3xxx_wdd.parent = dev;
>   
>   	ret = devm_watchdog_register_device(dev, &stmp3xxx_wdd);
> diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
> index fd64ae77780a..90cac7fcb09c 100644
> --- a/drivers/watchdog/w83977f_wdt.c
> +++ b/drivers/watchdog/w83977f_wdt.c
> @@ -102,7 +102,7 @@ static int wdt_start(void)
>   	outb_p(DEVICE_REGISTER, IO_INDEX_PORT);
>   	outb_p(0x07, IO_DATA_PORT);
>   	if (!testmode) {
> -		unsigned pin_map;
> +		unsigned int pin_map;
>   
>   		outb_p(0xE6, IO_INDEX_PORT);
>   		outb_p(0x0A, IO_DATA_PORT);
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 3bab32485273..beae3f4078f4 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -57,7 +57,7 @@ static struct kthread_worker *watchdog_kworker;
>   static bool handle_boot_enabled =
>   	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
>   
> -static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
> +static unsigned int open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
>   
>   static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
>   {
> 

