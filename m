Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC0D40FAAC
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 16:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhIQOrF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 10:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhIQOqr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 10:46:47 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C623DC0613C1;
        Fri, 17 Sep 2021 07:45:25 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so13163609otf.6;
        Fri, 17 Sep 2021 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=roiF3YcRhUjnf2NCsKXbbc/WoH7g37avMkw51REyDPc=;
        b=XX7ixocDHmNUoczxbkBm+kuXLJhOUxCxIDwcfoqtpMBniTNw+ft44wbUoqtn8vHvjG
         E0Ma5JLSHE3YD6EcyzlpK8o+17FKagwfA6nKjtJfE+QcKHwH41ZouSbzolktJnSYeBkA
         43//I9Gbbk8OvBu6Fz3Vlo4NWTtcBjcT3HqSGNqjnLm5WAFNi7BwWHb5SSHL/khIddA8
         pk9JgX7UdxjA/kgY8pht79UgLEF3NcpHskaRwi+TEwp0B/k5lt0/7FslS0XRJmin7SAu
         yqrfVl4kFpeo2WvirAOA4pLWB/3kaUps/WmhNg+x3esyp1xHZ+wLAyoj2QzE7ZtW5pKa
         tXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=roiF3YcRhUjnf2NCsKXbbc/WoH7g37avMkw51REyDPc=;
        b=CXEP/ZAcDRHX/VXFsnoT7LKGmVI0i2HOmGVbPUpyX1suZGIY7s8c9JQElO/J4RXDdX
         ohdWlCNb9GXX/3QMtI/1S9vn2CgG0CVt6n20nWUfdA3Qy6yY/OKicdc6huxqJyxhcWKC
         m6Ad3TE22dw6Sbk4+tH2qKqftKJXwCbZJc0Y3yWVH0z2sdW1LkP8Ud3nY9S/RdEjydKq
         oDHe8zvu8Lh2VWCftMzsPV5PhKd/ylLic+EmIjmj6Ss5SIMQpVlVKuOHQsZyy8ZUPJ2o
         jGBB/BZBgIDXHYIjkRK3rG0p/8wHgnpIf8eA7/GGDgW8h0mYpJqaStNx7Ia72vZPKfDt
         SEJQ==
X-Gm-Message-State: AOAM531vYJ4AlCMqpjif/UCi2SVakWPzpBI8tr6h7hXfeYpATWhWOhjL
        dWfBYFFhLVUhZQAZrak4ay+PqmNr5XY=
X-Google-Smtp-Source: ABdhPJyvPYkpaTsFXdACQBU4ydb3kccrRzJa8mQrTfg3COrbdsjOwHpV+t+1ByB12zvPcqo1TqI25g==
X-Received: by 2002:a9d:701b:: with SMTP id k27mr9751432otj.286.1631889924891;
        Fri, 17 Sep 2021 07:45:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b11sm1494810ooi.0.2021.09.17.07.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 07:45:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210916144001.1713508-1-f.suligoi@asem.it>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3] watchdog: add new parameter to start the watchdog on
 module insertion
Message-ID: <36f5e976-e6d4-7e24-f971-0895ab6b1762@roeck-us.net>
Date:   Fri, 17 Sep 2021 07:45:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916144001.1713508-1-f.suligoi@asem.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/16/21 7:40 AM, Flavio Suligoi wrote:
> The new parameter "start_enabled" starts the watchdog at the same time
> of the module insertion.
> This feature is very useful in embedded systems, to avoid cases where
> the system hangs before reaching userspace.
> 
> This feature can be enabled in the kernel config, so it can be also
> used when the watchdog driver is build as "built-in".
> 
> This parameter involves the "core" section of the watchdog driver;
> in this way it is common for all the watchdog hardware implementations.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
> 
> v3: - add check for the returned error of wdog start function
> v2: - check WDOG_HW_RUNNING before starting watchdog;
>      - remove useless comments in commit text, watchdog-parameters.rst and
>        Kconfig;
> v1: - first version;
> 
>   Documentation/watchdog/watchdog-parameters.rst |  3 +++
>   drivers/watchdog/Kconfig                       |  9 +++++++++
>   drivers/watchdog/watchdog_core.c               | 16 ++++++++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 223c99361a30..7780d0c1fb4a 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -21,6 +21,9 @@ watchdog core:
>   	timeout. Setting this to a non-zero value can be useful to ensure that
>   	either userspace comes up properly, or the board gets reset and allows
>   	fallback logic in the bootloader to try something else.
> +    start_enabled:
> +	Watchdog is started on module insertion. This option can be also
> +	selected by kernel config (default=kernel config parameter).
>   
>   -------------------------------------------------
>   
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index b81fe4f7d434..19be709e01ac 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -47,6 +47,15 @@ config WATCHDOG_NOWAYOUT
>   	  get killed. If you say Y here, the watchdog cannot be stopped once
>   	  it has been started.
>   
> +config WATCHDOG_START_ENABLED
> +	bool "Start watchdog on module insertion"
> +	help
> +	  Say Y if you want to start the watchdog at the same time when the
> +	  driver is loaded.
> +	  This feature is very useful in embedded systems, to avoid cases where
> +	  the system could hang before reaching userspace.
> +	  This parameter applies to all watchdog drivers.
> +
>   config WATCHDOG_HANDLE_BOOT_ENABLED
>   	bool "Update boot-enabled watchdog until userspace takes over"
>   	default y
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 3fe8a7edc252..cb530b097223 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -44,6 +44,11 @@ static int stop_on_reboot = -1;
>   module_param(stop_on_reboot, int, 0444);
>   MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
>   
> +static bool start_enabled = IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED);
> +module_param(start_enabled, bool, 0444);
> +MODULE_PARM_DESC(start_enabled, "Start watchdog on module insertion (default="
> +	__MODULE_STRING(IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED)) ")");
> +
>   /*
>    * Deferred Registration infrastructure.
>    *
> @@ -252,6 +257,17 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>   	 * corrupted in a later stage then we expect a kernel panic!
>   	 */
>   
> +	/* If required, start the watchdog immediately */
> +	if (start_enabled && !watchdog_hw_running(wdd)) {
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		ret = wdd->ops->start(wdd);
> +		if (ret == 0) {
> +			pr_info("Watchdog enabled\n");
> +		} else {
> +			return ret;
> +		}

This should be
		if (ret)
			return ret;
		pr_info("Watchdog enabled\n");

Also, this needs an error handler to stop the watchdog if driver registration
fails (if the driver supports stopping the watchdog).

Thanks,
Guenter

> +	}
> +
>   	/* Use alias for watchdog id if possible */
>   	if (wdd->parent) {
>   		ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
> 

