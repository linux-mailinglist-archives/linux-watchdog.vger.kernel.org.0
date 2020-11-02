Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B595B2A25EC
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Nov 2020 09:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbgKBIQp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Nov 2020 03:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgKBIPy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Nov 2020 03:15:54 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4838C0617A6;
        Mon,  2 Nov 2020 00:15:54 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id l36so3846827ota.4;
        Mon, 02 Nov 2020 00:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2hUgKT+wi0Ln32NnVyqlZjvM84loEwSxi+6A6WFM75E=;
        b=rOSYjwcyg/hUgcOytCkYrnLFpxfxlk/0C0dbHn3pa1YvAfafEVXnlH0WL9IbvYRbm/
         bQz4GhBr6UtsWgV15EtzrajM6KO+wjmLUQPUa2NICTfdzvtxVG6qd4j0ZuckTFIcbJ/k
         vZ+xXTLsid0iuDZKWOZ8U3vT7i0VoYN0YFfEgdqyv1b+XlreVTtLD9x6jLZNAuF8r1gV
         tsZHVOd5MSv367pOd5eJwJAdF0HRFOZoav1H76f6lZ12YWrq2yybjgpKy61wvrZrd2nw
         8nzGYwqi/GXTJgw8wSoHqzpudigpd5Ob1uKlj35/v20bcWyPE7uVE5lVTBN6thYjkxbu
         2HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2hUgKT+wi0Ln32NnVyqlZjvM84loEwSxi+6A6WFM75E=;
        b=H1AdPVYR0J8NZkrXJnQYojK/9VFXhLSsK3AZxo7lKfpvef6AavfofR7ATZ8RL5CGEI
         Q0p0Zw0QbPbRDdn2G6SAsk/ZPAZ+2+datrUogxDVHS9b+gEiKxI6QwGKpQjnAf0N2aXa
         TV6rx2fdqBigd+A0hSPaRr5TTBTIf15BwckawxzJKAlBSq44b21Cpg1051jX8tHBTAWj
         eSVqmuMiZzH7KrAwydnE2ECCceQ0JILGyMnx0awMLuaq520ArCgHJ7kDVGXNId6+XIER
         Zog3kb/VL9lO4/HvQV0f7doiKtHMgpZzX020bqmBlnpf48PodeiScR3TskjBH2kBqJsE
         YY8Q==
X-Gm-Message-State: AOAM530Lih/oe79P2MqamMI6o9RKHxLrfMw4KYY/vUXj73S+lXVVrwAE
        SUyxLInTWdQ01IlznW33G9o=
X-Google-Smtp-Source: ABdhPJzr5dpJ/Pguma0krpYazswjwMYgD5JIBn20dAFqzZ9/me9YWmeYXjfbjSTe6+Hc5t5wIn0qFg==
X-Received: by 2002:a05:6830:1694:: with SMTP id k20mr11970737otr.100.1604304954083;
        Mon, 02 Nov 2020 00:15:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21sm3384984ots.30.2020.11.02.00.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 00:15:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH -next] watchdog: Fix potential dereferencing of null
 pointer
To:     Wang Wensheng <wangwensheng4@huawei.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rui.xiang@huawei.com, guohanjun@huawei.com
References: <20201102074413.69552-1-wangwensheng4@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1cbe8280-4429-204f-c0a8-4f666707052e@roeck-us.net>
Date:   Mon, 2 Nov 2020 00:15:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102074413.69552-1-wangwensheng4@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/1/20 11:44 PM, Wang Wensheng wrote:
> A reboot notifier, which stops the WDT by calling the stop hook without
> any check, would be registered when we set WDOG_STOP_ON_REBOOT flag.
> 
> Howerer we allow the WDT driver to omit the stop hook since commit
> "d0684c8a93549" ("watchdog: Make stop function optional") and provide
> a module parameter for user that controls the WDOG_STOP_ON_REBOOT flag
> in commit 9232c80659e94 ("watchdog: Add stop_on_reboot parameter to
> control reboot policy"). Together that commits make user potential to
> insert a watchdog driver that don't provide a stop hook but with the
> stop_on_reboot parameter set, then dereferencing of null pointer occurs
> on system reboot.
> 
> Check the stop hook before registering the reboot notifier to fix the
> issue.
> 

This does a bit more: It also cleans up error handling. Which makes sense,
but should be done in a second patch.

Guenter

> Fixes: d0684c8a9354 ("watchdog: Make stop function optional")
> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
> ---
>  drivers/watchdog/watchdog_core.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 423844757812..5269761ba072 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -252,10 +252,8 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  		wdd->id = id;
>  
>  		ret = watchdog_dev_register(wdd);
> -		if (ret) {
> -			ida_simple_remove(&watchdog_ida, id);
> -			return ret;
> -		}
> +		if (ret)
> +			goto id_remove;
>  	}
>  
>  	/* Module parameter to force watchdog policy on reboot. */
> @@ -267,15 +265,17 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  	}
>  
>  	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
> -		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> +		if (!wdd->ops->stop) {
> +			ret = -EINVAL;
> +			goto dev_unregister;
> +		}
>  
> +		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
>  		ret = register_reboot_notifier(&wdd->reboot_nb);
>  		if (ret) {
>  			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
>  			       wdd->id, ret);
> -			watchdog_dev_unregister(wdd);
> -			ida_simple_remove(&watchdog_ida, id);
> -			return ret;
> +			goto dev_unregister;
>  		}
>  	}
>  
> @@ -289,6 +289,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  	}
>  
>  	return 0;
> +
> +dev_unregister:
> +	watchdog_dev_unregister(wdd);
> +id_remove:
> +	ida_simple_remove(&watchdog_ida, id);
> +
> +	return ret;
>  }
>  
>  /**
> 

