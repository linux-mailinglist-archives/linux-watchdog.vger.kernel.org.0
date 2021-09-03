Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362474000F8
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 16:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235544AbhICOGx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 10:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbhICOGw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 10:06:52 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9ED4C061575
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Sep 2021 07:05:52 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id k18-20020a4abd92000000b002915ed21fb8so1543268oop.11
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Sep 2021 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O1MDRILz0N4Yts1ffvjhAMpHzBlbLq5YicfUynhawyA=;
        b=G1XpKggbIFF3tUm3O8G5CgpPgeKAA/Ut/+wVn1GqM2LIUTjGA+1kAXZ7acr/iMfjpq
         qcPsSHHVWOsApDs7ViqDNfBTfhhqFYxQqqZs+I267QreMfHal4TBx4zNR2l9AG1eOgYx
         Y8sH485YLw5Z9Us9i9OwwpDZFrm/vJ2W2YqH8AprycbTEysp57w49zm+HD+IQfqgarEy
         e7KCIizq44RWd1+Lb1vinoB8uMrCOOE1+In1QvsAm8N0cWHRUxWAsRsvdVu+4K5aXTNs
         o03kwhmNu7qknttxB7rtBWi+GBHFM6uZAEZmEyNnNjl/38H8J6f+rZGW+U2rmG2sCT3b
         SYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O1MDRILz0N4Yts1ffvjhAMpHzBlbLq5YicfUynhawyA=;
        b=tOP1xMhb/yMQcR3NNBQzDIcn3SUd7NUz19UieoPLzEncbItn8WQhW3u0RhKPEKw4ed
         UmVSOQvQiVH/vA42Geecg86kgp1ISpa1BR0j5x4r0v0T8fWpIe1NkV0HyM2ym9EsZmL7
         IEkAbwP7f5H2UrMfjW5/DXyKayU1U9JOCpEGFvqWsUnJ1oUaGEK/XPsTYKnxUgj0v25N
         4SX39VZLeWhBk0XPX8YznHNqTGba5fViaH6+YC9dC+TRKfQmc00LordvbarkPcvYwG0F
         1UI7KebhN9TPqcTCAwlVOFxjltX8l+dUjY4t+UlykxfyW316ss1o3tRphrMoDluEjQnX
         CElQ==
X-Gm-Message-State: AOAM5321l8upZMAVplDZYp8TfwtQx8bl4MzBH7Eg+t1ffALW1D4IibHn
        YDX/mNoE8zfqGUgHUifUuBc=
X-Google-Smtp-Source: ABdhPJzB4o7DYRTYEM0ojeXMPDjQ2TslyPqtsx+JEoAfywlaEo+RK0H3/vsjq1pcvq+CAmut1xbXUQ==
X-Received: by 2002:a4a:5241:: with SMTP id d62mr3119395oob.9.1630677952108;
        Fri, 03 Sep 2021 07:05:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e11sm1027082oiw.18.2021.09.03.07.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 07:05:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: sbsa: only use 32-bit accessors
To:     Jamie Iles <quic_jiles@quicinc.com>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, zhangshaokun@hisilicon.com
References: <20210903112101.493552-1-quic_jiles@quicinc.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4dd48839-5695-dfbe-2270-423fb5431ba6@roeck-us.net>
Date:   Fri, 3 Sep 2021 07:05:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903112101.493552-1-quic_jiles@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/3/21 4:21 AM, Jamie Iles wrote:
> SBSA says of the generic watchdog:
> 
>    All registers are 32 bits in size and should be accessed using 32-bit
>    reads and writes. If an access size other than 32 bits is used then
>    the results are IMPLEMENTATION DEFINED.
> 
> and for qemu, the implementation will only allow 32-bit accesses
> resulting in a synchronous external abort when configuring the watchdog.
> Use lo_hi_* accessors rather than a readq/writeq.
> 
> Fixes: abd3ac7902fb ("watchdog: sbsa: Support architecture version 1")
> Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/sbsa_gwdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index ee9ff38929eb..6f4319bdbc50 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -130,7 +130,7 @@ static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
>   	if (gwdt->version == 0)
>   		return readl(gwdt->control_base + SBSA_GWDT_WOR);
>   	else
> -		return readq(gwdt->control_base + SBSA_GWDT_WOR);
> +		return lo_hi_readq(gwdt->control_base + SBSA_GWDT_WOR);
>   }
>   
>   static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
> @@ -138,7 +138,7 @@ static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
>   	if (gwdt->version == 0)
>   		writel((u32)val, gwdt->control_base + SBSA_GWDT_WOR);
>   	else
> -		writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
> +		lo_hi_writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
>   }
>   
>   /*
> 

