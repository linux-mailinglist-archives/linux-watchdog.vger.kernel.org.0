Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5C635A26D
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Apr 2021 17:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhDIP45 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Apr 2021 11:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhDIP44 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Apr 2021 11:56:56 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8E4C061760;
        Fri,  9 Apr 2021 08:56:43 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id r17-20020a4acb110000b02901b657f28cdcso1441796ooq.6;
        Fri, 09 Apr 2021 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zS4oOL5HKDn9FDzihO/lTrV8DNOB2FWtFwRfLW84+lc=;
        b=IWHF1EDZ2QLXkKVqTO1X36F2AQAvhhQ7gxF8ExGQvugxEsH+sx38REIWFnjLPTIlwD
         Qe0CKfy04fPJjAzDVhTdhX4wXo9w3CEf/s7vnJxCXUhEhEDnYooA+i8ltu7ia9XJA8oY
         83syYVfr40Lj16+wAJZeM7CXnLPpTbFEdeQpPLy8xDk9Rf/5lqyfpFU+0lIOrx8C3SF0
         SdbTBfdCz52LNe/Nsu/kz1kn5CSB4HdI2KtSuv/kfFmBYE+I9UqbakNvvnOwqYQMRCMd
         agXUPyXQRg0cXJ4VyXKuNNJfpap99w1HRMvirU43FNhQ5TFSVaCD/5H39Cb5UnygbhnX
         uPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zS4oOL5HKDn9FDzihO/lTrV8DNOB2FWtFwRfLW84+lc=;
        b=jFstaeIHSu5C4+wEZqpsoMqp4cOUfbGNoEBQDw0PfZhpVfFe5B7MNztelrFNHdC01D
         jBZHKGS85mRsd+YGiHQAzslmMKSVgwHMZsg7hzH8oSJngkt1dGx9A9srxc/O4zouYlqN
         S6nXUdpNXN8+vV/ln7G5Oj4BOLd19ki4Aq6q0BjumbtbxfbmQCzTvEHZYgbZD7q/Do9i
         RfE4k+vCwJR/rH+87ptXov87Cbj+F8RZStH9MdLwTLHEpH6UTFJyBMPPpWHn2JZ6/A7D
         q1Ca0m3eMzHRnfO6lkBXxYcUP77iennOwQGyeFFWj8NXC2fd3Tq8ZEPcaXXcbFe3r5gn
         clyQ==
X-Gm-Message-State: AOAM533g7t/qCTGlf/RBq0HNrUIRD4QYprFO0KQpAb10nlbIqKgSpKYm
        zLB00ogCBhpZqHlkUH9Lb2Vycp0y/Uc=
X-Google-Smtp-Source: ABdhPJySz1NAfHv3PIXFXvsVgn3JWmjNJv5JK7jE8Ok8+02GazxBMsXcAnGhSNkqNc1h1DUCqDJrQQ==
X-Received: by 2002:a4a:d10f:: with SMTP id k15mr12474691oor.82.1617983802774;
        Fri, 09 Apr 2021 08:56:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a7sm587160ooo.30.2021.04.09.08.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 08:56:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1] watchdog: add new parameter to start the watchdog on
 module insertion
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210409093434.2089459-1-f.suligoi@asem.it>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e44f3366-cb12-7d7c-fe77-20b5bfea620d@roeck-us.net>
Date:   Fri, 9 Apr 2021 08:56:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210409093434.2089459-1-f.suligoi@asem.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/9/21 2:34 AM, Flavio Suligoi wrote:
> The new parameter "start_enabled" starts the watchdog at the same time
> of the module insertion.
> This feature is very useful in embedded systems, to avoid cases where
> the system hangs before reaching userspace.
> 
> This function can be also enabled in the kernel config, so can be
> used when the watchdog driver is build as built-in.
> 
> This parameter involves the "core" section of the watchdog driver;
> in this way it is common for all the watchdog hardware implementations.
> 
> Note: to use only for watchdog drivers which doesn't support this
>       parameter by itself.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/watchdog/watchdog-parameters.rst |  5 +++++
>  drivers/watchdog/Kconfig                       | 14 ++++++++++++++
>  drivers/watchdog/watchdog_core.c               | 12 ++++++++++++
>  3 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 223c99361a30..623fd064df91 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -21,6 +21,11 @@ watchdog core:
>  	timeout. Setting this to a non-zero value can be useful to ensure that
>  	either userspace comes up properly, or the board gets reset and allows
>  	fallback logic in the bootloader to try something else.
> +    start_enabled:
> +	Watchdog is started on module insertion. This option can be also
> +	selected by kernel config (default=kernel config parameter).
> +	Use only for watchdog drivers which doesn't support this parameter
> +	by itself.

Why ?

>  
>  -------------------------------------------------
>  
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0470dc15c085..c2a668d6bbbc 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -47,6 +47,20 @@ config WATCHDOG_NOWAYOUT
>  	  get killed. If you say Y here, the watchdog cannot be stopped once
>  	  it has been started.
>  
> +config WATCHDOG_START_ENABLED
> +	bool "Start watchdog on module insertion"
> +	help
> +	  Say Y if you want to start the watchdog at the same time when the
> +	  driver is loaded.
> +	  This feature is very useful in embedded systems, to avoid cases where
> +	  the system could hang before reaching userspace.
> +	  This parameter involves the "core" section of the watchdog driver,
> +	  in this way it is common for all the watchdog hardware
> +	  implementations.

"This parameter applies to all watchdog drivers.". The rest is implementation
detail and irrelevant here.

> +
> +	  Note: to use only for watchdog drivers which doesn't support this
> +	        parameter by itself.
> +

This comment is quite useless in the Kconfig description. If enabled, it is enabled,
period.

>  config WATCHDOG_HANDLE_BOOT_ENABLED
>  	bool "Update boot-enabled watchdog until userspace takes over"
>  	default y
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 5df0a22e2cb4..5052ae355219 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -43,6 +43,11 @@ static int stop_on_reboot = -1;
>  module_param(stop_on_reboot, int, 0444);
>  MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
>  
> +static bool start_enabled = IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED);
> +module_param(start_enabled, bool, 0444);
> +MODULE_PARM_DESC(start_enabled, "Start watchdog on module insertion (default="
> +	__MODULE_STRING(IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED)) ")");
> +
>  /*
>   * Deferred Registration infrastructure.
>   *
> @@ -224,6 +229,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  	 * corrupted in a later stage then we expect a kernel panic!
>  	 */
>  
> +	/* If required, start the watchdog immediately */
> +	if (start_enabled) {
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		wdd->ops->start(wdd);
> +		pr_info("Watchdog enabled\n");
> +	}
> +
>  	/* Use alias for watchdog id if possible */
>  	if (wdd->parent) {
>  		ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
> 

