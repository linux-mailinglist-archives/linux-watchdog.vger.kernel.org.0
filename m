Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867E13FE991
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Sep 2021 08:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242126AbhIBG4j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 02:56:39 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:40750 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242527AbhIBG4j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 02:56:39 -0400
Received: by mail-wr1-f49.google.com with SMTP id t15so1165484wrg.7
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Sep 2021 23:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=29zYZleLN3/aYK8L6FDkYK6NYHpIJ2UdjYlfayP6oZE=;
        b=r73DNI0IMfJS/S4v8mnD6RUFcMv3pW2w51OryQ7kBnjFxEz4BlPr+KCjgEjtP0Pf7M
         SOV6KG9D7lFzXBgAH2VcwBdbJRB8KDqo3XlTFQi0IPnfeJOK/b8v/4oWS3/86ilCmevo
         WV8k5aePJC+zwF3EeDiQDIDHPR3t6LqENegW7b7pDHX+sN+PhCQCMqC3235IszOmXp7T
         2eM9FtsNx+cuY7CZlH1/btjqeJBV3ZMdN4RMdDSdjeQ+qsYUXk1gVxsxv4LjnhzaHQO6
         OAkueLU2cVaSNrhj15r0aIzTVR0zQUd+v3SdEjM4Ic3EDX1FsPEhUmw49x1YLCksyiaP
         rqlQ==
X-Gm-Message-State: AOAM530qVwSickl3XVZu2G3LgiBDuRRM2gpldkCSdVQLfUOe09a83HFe
        JqjralQ2nkGSH1F+vRQFLWk=
X-Google-Smtp-Source: ABdhPJz+BJEINYxswMBh2gJDlXodex67m7T3J1jnL3Gr3D7iuUlJJrRnWLilyo/ezgk3DQ6FercWLA==
X-Received: by 2002:adf:9f14:: with SMTP id l20mr1766364wrf.427.1630565739625;
        Wed, 01 Sep 2021 23:55:39 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with UTF8SMTPSA id v13sm923813wrf.55.2021.09.01.23.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 23:55:39 -0700 (PDT)
Message-ID: <67d601c9-8f95-cb10-40df-4d962ec6f9ba@kernel.org>
Date:   Thu, 2 Sep 2021 08:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v3] watchdog: Add hrtimer-based pretimeout feature
Content-Language: en-US
To:     Curtis Klein <curtis.klein@hpe.com>, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org
References: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 03. 02. 21, 21:11, Curtis Klein wrote:
> This adds the option to use a hrtimer to generate a watchdog pretimeout
> event for hardware watchdogs that do not natively support watchdog
> pretimeouts.
> 
> With this enabled, all watchdogs will appear to have pretimeout support
> in userspace. If no pretimeout value is set, there will be no change in
> the watchdog's behavior.

Hi,

on my Dell Latitude 7280, CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y causes 
all reboot, kexec, suspend to panic. Disabling that option makes it all 
work again. Provided it happens very late in the process, I don't know 
how to grab some logs...

Any ideas?

...
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -73,6 +73,14 @@ config WATCHDOG_SYSFS
>   	  Say Y here if you want to enable watchdog device status read through
>   	  sysfs attributes.
>   
> +config WATCHDOG_HRTIMER_PRETIMEOUT
> +	bool "Enable watchdog hrtimer-based pretimeouts"
> +	help
> +	  Enable this if you want to use a hrtimer timer based pretimeout for
> +	  watchdogs that do not natively support pretimeout support. Be aware
> +	  that because this pretimeout functionality uses hrtimers, it may not
> +	  be able to fire before the actual watchdog fires in some situations.

thanks,
-- 
js
suse labs
