Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E08E300536
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 15:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbhAVOWK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 09:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbhAVOVz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 09:21:55 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60C2C06174A;
        Fri, 22 Jan 2021 06:21:14 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id h6so4738257oie.5;
        Fri, 22 Jan 2021 06:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c81WqRSj1Tvcbd5sD/lwHpEyfNXlz1jmvdm9oQfl+jY=;
        b=g6zCWc3pUO2pyE1REpUmNJn8epQSOiqKUVzhxLVw19Ka6nFrpuPOy/vVsyTwc20gGt
         RHFx1BpJ+KmdtTRUdVJSdAbg6E4m72VfHCH4BpNmesPUjllB5eSdKBzdVRpsr29BAp/6
         s7go3/Tlp1U6sSR/TIXUBltTqgJfIwL4e8HSrNkaXdHOIOuuHQgxC3OhLFJ/61Wx/jzg
         5ghAaJJSmu4h8oq2g+O08toRQo/6ES5JoAidZLMaYVB2lYx1uJ4G9G13TjJ/TFBvDtPk
         Dm4kvF/1LKeNVoG4LxEY6vJHJBXGtQZcq/h6V29zXsFV/SaCUJZPLx9uDD0tos9gxLyl
         Lcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=c81WqRSj1Tvcbd5sD/lwHpEyfNXlz1jmvdm9oQfl+jY=;
        b=IoKlSCNRZoqorbdA8IavIT3r5dns6O8EhUNmKnsK1oyvC+NA/i41k65/Y3rinpjD2z
         LwREKjTIrNwUsQgOByOtcS2TYcwtCmMRQoPEAcKupIHKUCrVUBehx/xTA41ZzW7px+mY
         2g5sTWg5+Fwrm6yRN48wACRtzW0cAMp5F0hOI4HC/4OtEzLvjAr9+r4XLkr1wSj4ayaM
         yykPa3M6fkz9mdV9RkQKDTBlboQdJ+S7cSYXyp5KcDn80UiDMaJIDOXRGa999+bw5ots
         iQ3GKZeE7wWWWec9w7JVvQUyX4nQwgKFBC0vpT9qcEOpoWay9QLkjeP05FAEzCPdb5sA
         CX3Q==
X-Gm-Message-State: AOAM530nY3+EkolxMkHIa0U/htKpBc56/QD6zpAFwKDAWXgnVpGFKR+K
        3i8mzwJXZpvDkhNkXtAPz1o=
X-Google-Smtp-Source: ABdhPJyEWxtpfA2RU2h4Iy9/yWBtNAmfat5FwtmeVpKy3ucIfkzYUmD06A+3BEaECgpKwN18lzYJEA==
X-Received: by 2002:aca:508f:: with SMTP id e137mr3413160oib.32.1611325274332;
        Fri, 22 Jan 2021 06:21:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t25sm1704672oic.15.2021.01.22.06.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 06:21:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 3/5] platform/x86: intel_scu_wdt: Move driver from
 arch/x86
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <20210122123201.40935-3-andriy.shevchenko@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <35099684-7362-5cc7-1ddd-c70b3b25f7e3@roeck-us.net>
Date:   Fri, 22 Jan 2021 06:21:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122123201.40935-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/22/21 4:31 AM, Andy Shevchenko wrote:
> The ACPI-enabled Intel MID platforms neither have WDAT table nor proper IDs
> to instantiate watchdog device. In order to keep them working move the board
> code from arch/x86 to drivers/platform/x86.
> 
> Note, the complete SFI support is going to be removed, that's why PDx86
> has been chosen as a new home for it. This is the only device which needs
> additional code so far.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Not sure if I like the new name (seems to be a bit misleading), but still

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/x86/platform/intel-mid/device_libs/Makefile          | 1 -
>  drivers/platform/x86/Kconfig                              | 8 ++++++++
>  drivers/platform/x86/Makefile                             | 1 +
>  .../platform/x86/intel_scu_wdt.c                          | 0
>  4 files changed, 9 insertions(+), 1 deletion(-)
>  rename arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c => drivers/platform/x86/intel_scu_wdt.c (100%)
> 
> diff --git a/arch/x86/platform/intel-mid/device_libs/Makefile b/arch/x86/platform/intel-mid/device_libs/Makefile
> index 480fed21cc7d..918edac9ab9a 100644
> --- a/arch/x86/platform/intel-mid/device_libs/Makefile
> +++ b/arch/x86/platform/intel-mid/device_libs/Makefile
> @@ -30,4 +30,3 @@ obj-$(subst m,y,$(CONFIG_GPIO_PCA953X)) += platform_tca6416.o
>  obj-$(subst m,y,$(CONFIG_KEYBOARD_GPIO)) += platform_gpio_keys.o
>  obj-$(subst m,y,$(CONFIG_INTEL_MID_POWER_BUTTON)) += platform_mrfld_power_btn.o
>  obj-$(subst m,y,$(CONFIG_RTC_DRV_CMOS)) += platform_mrfld_rtc.o
> -obj-$(subst m,y,$(CONFIG_INTEL_MID_WATCHDOG)) += platform_mrfld_wdt.o
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4a5798a0ce0c..0bb85eabace1 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1424,6 +1424,14 @@ config INTEL_SCU_PLATFORM
>  	  and SCU (sometimes called PMC as well). The driver currently
>  	  supports Intel Elkhart Lake and compatible platforms.
>  
> +config INTEL_SCU_WDT
> +	bool
> +	default INTEL_SCU_PCI
> +	depends on INTEL_MID_WATCHDOG
> +	help
> +	  This is a specific platform code to instantiate watchdog device
> +	  on ACPI-based Intel MID platforms.
> +
>  config INTEL_SCU_IPC_UTIL
>  	tristate "Intel SCU IPC utility driver"
>  	depends on INTEL_SCU
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 728ccc226a29..19306450d791 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -146,6 +146,7 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
>  obj-$(CONFIG_INTEL_SCU_IPC)		+= intel_scu_ipc.o
>  obj-$(CONFIG_INTEL_SCU_PCI)		+= intel_scu_pcidrv.o
>  obj-$(CONFIG_INTEL_SCU_PLATFORM)	+= intel_scu_pltdrv.o
> +obj-$(CONFIG_INTEL_SCU_WDT)		+= intel_scu_wdt.o
>  obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
>  obj-$(CONFIG_INTEL_TELEMETRY)		+= intel_telemetry_core.o \
>  					   intel_telemetry_pltdrv.o \
> diff --git a/arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
> similarity index 100%
> rename from arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c
> rename to drivers/platform/x86/intel_scu_wdt.c
> 

