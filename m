Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFB135E39B
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 18:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhDMQQA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 12:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhDMQP7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 12:15:59 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036EEC061574
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 09:15:39 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso5969644oto.3
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IuMQnBAY0m2CrN5BwKShF6NZdgPF3V+nJYhzqqrt8Q8=;
        b=mcaDbsxFJ8kSvqMsjSKRYBM48sqTSC91//EV6QW5xBSVVa7dH9qPnP9tQEad6EO5ZK
         roNI86hu3kp6bZmvDTsAbyFWZOpUJqz5xazFDv9ppb7mTHEn9aMeMv+vy4oSY1jadVlP
         erB6d2m0zybKWidlr5oloO33ilz9hmDXpLZkNynpeyzx10szvXhMqOMsnxhcFNElo6j7
         xCkfFU5p80baz6vjTBXS/Vu+SM9c2vVJkrtxBvPObjhEhyGKKzuWJRdLZo/hC8jxroUL
         a64cgESX5G/3j7g6wr9/Z1l6JSvupVEf3Q8GvA2MFs6TZ4K9Fs+fi8Vo83gprS44uvpE
         mlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IuMQnBAY0m2CrN5BwKShF6NZdgPF3V+nJYhzqqrt8Q8=;
        b=IRHQlt2ESexYEhzY8kkrcWCrift9wgo9WWO17bIxlZ0GMXH9BoYIqMj0Qpblkbmb+O
         +oT8BTHj/wVtQn7QwNH1c9lysWCq3FHrZVnrXxbh6prYJNFiQ7yOSOQ5sbFtTQOSQQMY
         1MDah1w3jy1Epn+Xa+ZXSegpX7Ot3bLTBa+J4gFFL6spQt57AAFlS0QGfqb++zXvWH6z
         YVvqM6sS2+5RfyjjfsTfS/VGlHxer2UD2/v2hn4/IYBooxQaORATz28bbJBD9kkIqKWa
         pQzG+5J8xaRIpqrr6t2/Qfux4zWFWWPTd90DtGpvVzDKY5OaUOSkyCFiHDBEMIszgIal
         ReoQ==
X-Gm-Message-State: AOAM531hGO7wIm6vxGCHbeIHmLcLVT++5cxNcwwwVQvAYlPNNglA+W5d
        ha/80rhDlyZ6kKhga2IH4hX5LpKvdu4=
X-Google-Smtp-Source: ABdhPJzNTTtlj90uEl9j6QBsTmeH8YqiYCSnM0b5McglnXFSH7qns08u/17ZdEjhZnXqEjTzuD7Ivw==
X-Received: by 2002:a9d:7086:: with SMTP id l6mr28639782otj.187.1618330538053;
        Tue, 13 Apr 2021 09:15:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v205sm798986oie.16.2021.04.13.09.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 09:15:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC] watchdog: pretimeout: add a notifier call chain governor
To:     Stefan Eichenberger <eichest@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20210413154553.1968039-1-eichest@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <41ec7802-e637-1177-9d16-d8fb3ff6bc3a@roeck-us.net>
Date:   Tue, 13 Apr 2021 09:15:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210413154553.1968039-1-eichest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/13/21 8:45 AM, Stefan Eichenberger wrote:
> Add a governor which calls a notifier call chain. This allows the
> registration of custom functions to the watchdog pretimeout. This is
> useful when writing out-of-tree kernel modules and it is more similar to
> the register_reboot_notifier or register_oom_notifier API.
> 
> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>

It seems questionable to implement such a notification as governor.
A governor is configurable, and letting userspace override notifications
seems very odd and unusual. Please provide a use case.

Guenter

> ---
>  drivers/watchdog/Kconfig               | 16 ++++++
>  drivers/watchdog/Makefile              |  1 +
>  drivers/watchdog/pretimeout_notifier.c | 73 ++++++++++++++++++++++++++
>  drivers/watchdog/watchdog_pretimeout.h |  2 +
>  include/linux/watchdog.h               |  5 ++
>  5 files changed, 97 insertions(+)
>  create mode 100644 drivers/watchdog/pretimeout_notifier.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 355100dad60a..ec019120effc 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -105,6 +105,14 @@ config WATCHDOG_PRETIMEOUT_GOV_PANIC
>  	  Panic watchdog pretimeout governor, on watchdog pretimeout
>  	  event put the kernel into panic.
>  
> +config WATCHDOG_PRETIMEOUT_GOV_NOTIFIER
> +	tristate "Notifier watchdog pretimeout governor"
> +	depends on WATCHDOG_CORE
> +	default WATCHDOG_CORE
> +	help
> +	  Notifier watchdog pretimeout governor, on watchdog pretimeout
> +	  event call a notifier call chain.
> +
>  choice
>  	prompt "Default Watchdog Pretimeout Governor"
>  	default WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
> @@ -129,6 +137,14 @@ config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
>  	  a watchdog pretimeout event happens, consider that
>  	  a watchdog feeder is dead and reboot is unavoidable.
>  
> +config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOTIFIER
> +	bool "notifier"
> +	depends on WATCHDOG_PRETIMEOUT_GOV_NOTIFIER
> +	help
> +	  Use notifier watchdog pretimeout governor by default,
> +	  if a watchdog pretiemout event happens, a notifier
> +	  call chain is called.
> +
>  endchoice
>  
>  endif # WATCHDOG_PRETIMEOUT_GOV
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index a7eade8b4d45..cb63f4eb89bf 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -12,6 +12,7 @@ watchdog-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV)	+= watchdog_pretimeout.o
>  
>  obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP)	+= pretimeout_noop.o
>  obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC)	+= pretimeout_panic.o
> +obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOTIFIER)	+= pretimeout_notifier.o
>  
>  # Only one watchdog can succeed. We probe the ISA/PCI/USB based
>  # watchdog-cards first, then the architecture specific watchdog
> diff --git a/drivers/watchdog/pretimeout_notifier.c b/drivers/watchdog/pretimeout_notifier.c
> new file mode 100644
> index 000000000000..3f845c77ec44
> --- /dev/null
> +++ b/drivers/watchdog/pretimeout_notifier.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 Stefan Eichenberger <eichest@gmail.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/watchdog.h>
> +
> +#include "watchdog_pretimeout.h"
> +
> +BLOCKING_NOTIFIER_HEAD(watchdog_pretimeout_notifier_list);
> +
> +/**
> + * register_watchdog_pretimeout_notifier - Register function to be called on pretimeout
> + * @nb: Info about notifier function to be called
> + *
> + * Registers a function with the list of functions to be called when a watchdog pretimeout occurs.
> + *
> + * Currently always returns zero, as blocking_notifier_chain_register()
> + * always returns zero.
> + */
> +int register_watchdog_pretimeout_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&watchdog_pretimeout_notifier_list, nb);
> +}
> +EXPORT_SYMBOL(register_watchdog_pretimeout_notifier);
> +
> +/**
> + * unregister_watchdog_pretimeout_notifier - Unregister previously registered pretimeout notifier
> + * @nb: Hook to be unregistered
> + *
> + * Unregisters a previously registered watchdog pretimeout notifier function.
> + *
> + * Returns zero on success, or %-ENOENT on failure.
> + */
> +int unregister_watchdog_pretimeout_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&watchdog_pretimeout_notifier_list, nb);
> +}
> +EXPORT_SYMBOL(unregister_watchdog_pretimeout_notifier);
> +
> +/**
> + * pretimeout_notifier - Notify registred methods on pretimeout
> + * @wdd - watchdog_device
> + *
> + * Notify, watchdog has not been fed till pretimeout event.
> + */
> +static void pretimeout_notifier(struct watchdog_device *wdd)
> +{
> +	blocking_notifier_call_chain(&watchdog_pretimeout_notifier_list, 0, wdd);
> +}
> +
> +static struct watchdog_governor watchdog_gov_notifier = {
> +	.name		= "notifier",
> +	.pretimeout	= pretimeout_notifier,
> +};
> +
> +static int __init watchdog_gov_notifier_register(void)
> +{
> +	return watchdog_register_governor(&watchdog_gov_notifier);
> +}
> +
> +static void __exit watchdog_gov_notifier_unregister(void)
> +{
> +	watchdog_unregister_governor(&watchdog_gov_notifier);
> +}
> +module_init(watchdog_gov_notifier_register);
> +module_exit(watchdog_gov_notifier_unregister);
> +
> +MODULE_AUTHOR("Stefan Eichenberger <eichest@gmail.com>");
> +MODULE_DESCRIPTION("Notifier watchdog pretimeout governor");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/watchdog/watchdog_pretimeout.h b/drivers/watchdog/watchdog_pretimeout.h
> index a3f1abc68839..bb00ca1fcadd 100644
> --- a/drivers/watchdog/watchdog_pretimeout.h
> +++ b/drivers/watchdog/watchdog_pretimeout.h
> @@ -28,6 +28,8 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
>  #define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"noop"
>  #elif IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC)
>  #define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"panic"
> +#elif IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOTIFIER)
> +#define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"notifier"
>  #endif
>  
>  #else
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 9b19e6bb68b5..760beab1007f 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -215,4 +215,9 @@ int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
>  /* devres register variant */
>  int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
>  
> +#if IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOTIFIER)
> +int register_watchdog_pretimeout_notifier(struct notifier_block *nb);
> +int unregister_watchdog_pretimeout_notifier(struct notifier_block *nb);
> +#endif
> +
>  #endif  /* ifndef _LINUX_WATCHDOG_H */
> 

