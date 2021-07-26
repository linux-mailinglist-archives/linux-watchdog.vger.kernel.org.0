Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0E43D5AA5
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 15:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbhGZNEa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 09:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbhGZNE3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 09:04:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1CEC061757;
        Mon, 26 Jul 2021 06:44:57 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id c18so8820689qke.2;
        Mon, 26 Jul 2021 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qs7AmXeP0+kiZ5flnASci2QqNU9hj/b6onXpZ2CXaq0=;
        b=QE9cmBKGEFzySSbGNkMyEBw1tL2GrGN9WBCDBUXZRTlK0qu0blInYBs5tgy2dz2q7+
         WvyxQz7X5ueUjpsLMUanyad/uihJeNW/CAlg3uKx/pDQF4JUYmE+EjxD+Hi5EezJIMMP
         hlxFVyzfN935PN+sWIBTqw2wqW6GMfh5O1YtLstMJYWRGZrtUf8lEulB0O+jf2gYIB97
         w3IEaRWrBQEZY9pP2qKqRfgpZr+FV69SBuY2xTnsn7hZ2yGO1vw+ajWIUU1yeKnoG0Gu
         D9b/lyBVLycRoWp73o092EHjWwFCZWXYRdPVd7LMqzjizs+Kl3AQetVjHbPO9B3tmz0X
         cPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qs7AmXeP0+kiZ5flnASci2QqNU9hj/b6onXpZ2CXaq0=;
        b=eYS8mlkNpbzs5Os0e1+GzG+E/uOM93wdfQLLVlLJ+qjOi3beUH7uQlMOQZxk5rLcw8
         a50xhKfyIoZpshwVLPhJBu92C/S6Zop5VgSOoWFWp0KQlfIuByLWreIdxh2ua+3uqU49
         s8MOyZvnd+jz2KTKRUFeruWcT0/IHkiduD+Wk1As4Rg+ddcGkRbuMuaeE1bK2xhPWE1u
         /BrMIJxnRV14WROg4M/IwrxhhTDP+fC0W70PSVbA0Fqwe8MG03wstdhpq8S6eexU9Cl3
         opPzCR1GymY+pAptunTR5UixJLfsHLtUfM4egVLl0ZB6a4QiXms4tR5nfkTN04m/1jc4
         PVjg==
X-Gm-Message-State: AOAM531GitXac6+QsoZ3uxDkEXrmiM61h60fIAH20+U0yr2hjixfe5Yv
        VQmNxiQICZr0ieY3DWsjD5U=
X-Google-Smtp-Source: ABdhPJyOAAelqruyGbwa81isKM9xIOTL97U+vJVid9xXd31aDArZyyKUzvHLxmFRqv7nQ/F/zaZSKA==
X-Received: by 2002:ae9:f501:: with SMTP id o1mr17753713qkg.348.1627307096738;
        Mon, 26 Jul 2021 06:44:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m187sm18679032qkd.131.2021.07.26.06.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 06:44:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <429ceef9-d8eb-2884-0bae-95f190f75b22@roeck-us.net>
Date:   Mon, 26 Jul 2021 06:44:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/26/21 4:46 AM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Obviously, the test needs to run against the register content, not its
> address.
> 
> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
> Reported-by: Mantas Mikulėnas <grawity@gmail.com>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/iTCO_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index b3f604669e2c..643c6c2d0b72 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>   	 * Otherwise, the BIOS generally reboots when the SMI triggers.
>   	 */
>   	if (p->smi_res &&
> -	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
> +	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>   		tmrval /= 2;
>   
>   	/* from the specs: */
> 

