Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1653EC370
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Aug 2021 17:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbhHNPDA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 Aug 2021 11:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbhHNPC7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 Aug 2021 11:02:59 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D53FC061764;
        Sat, 14 Aug 2021 08:02:29 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so15688430otl.1;
        Sat, 14 Aug 2021 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=unEHXrg/gyVGx45zTcbq/Ok+pB3H3OtyAMxgD943pU4=;
        b=GL3Kk6SPiYBxtG8EpjPRhswBL4ECIz+kGv2lIbFx3F3F2VL+xbhj+Xj92PGwhURFoP
         S9E2VBpFrJHfpcGSEXyKvWN8XeR37wgzkb/t5J5ytVKoz+jl5uOIMc4dX0l+GekdMbZr
         0BInhrwgQ7p3Es6nsOfyqIYvs4qgDdmu0/wVtl95Cyw5M8nqqCGMsznFlGgaKgviKERX
         NX16ABZLa9LB2Uz9oYhsUXMoC51H+zUTzLWNcmaGWZPUJjB+A0s1CC4VvB4Pd+D1QMYY
         nk6tMjhyh/4cpnuoCx3aWYThc10dl7BzOU6a+xzO/t6izvueuvWMHmM3FbZsP6/6tCL9
         juLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=unEHXrg/gyVGx45zTcbq/Ok+pB3H3OtyAMxgD943pU4=;
        b=YiEqWeStq2z1HDnqrsRwt/rd0kT957RYJPSNzzUfe6CKPJ0D9dYrz1BfJIhmfYYrFh
         nwmUdqZWPb0BvJhIRFyIBf0+UfVKNKJwfGHiV32u6TmbTot3CjROfdz5DxY8M68EOrqc
         GYDzM6qGIGL6U34xr8kiJzDcmlayt6H6HPhkTkqO+ry8pwKVpFSyCzgDT8Ucpi9oEqs4
         bkS3qhX/+xzcZC/7dCxzT+Maqo4FiCZnWnPO8S5l/yyzsurLfTqxdkph6XzXlXP/tiH5
         CcCyfKLC/hW118drRnJ+kFOprrp8mzGbyCkd/LNqxFYU5enBufC3a6i5Q2jSnQNumZn6
         rdOg==
X-Gm-Message-State: AOAM533cKp6iqEdEmPCtimCBrEYsLJvxzBbGzlcDbhpQtvc08oLPUeh2
        ZO8tYAJh40ReVYEy+MzMrGOVu0JWugA=
X-Google-Smtp-Source: ABdhPJwSJcQUxXRA5sql7TG+AjoqRsYkWuBuWhM3o47G5qr1WQb0HGcf4Jiu0wLEPdHBveS9QTodzA==
X-Received: by 2002:a05:6830:1108:: with SMTP id w8mr6228079otq.88.1628953348644;
        Sat, 14 Aug 2021 08:02:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6sm1037132oto.13.2021.08.14.08.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 08:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: stm32_iwdg: drop superfluous error message
To:     Tang Bin <tangbin@cmss.chinamobile.com>, wim@linux-watchdog.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc:     linux-watchdog@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
References: <20210814142741.7396-1-tangbin@cmss.chinamobile.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <500cc974-bc39-74d5-1e1c-f763e25caa8b@roeck-us.net>
Date:   Sat, 14 Aug 2021 08:02:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814142741.7396-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/14/21 7:27 AM, Tang Bin wrote:
> In the function stm32_iwdg_probe(), devm_platform_ioremap_resource
> has already contained error message, so drop the redundant one.
> 
> Co-developed-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/stm32_iwdg.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a3436c296..570a71509 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -237,10 +237,8 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>   
>   	/* This is the timer base. */
>   	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(wdt->regs)) {
> -		dev_err(dev, "Could not get resource\n");
> +	if (IS_ERR(wdt->regs))
>   		return PTR_ERR(wdt->regs);
> -	}
>   
>   	ret = stm32_iwdg_clk_init(pdev, wdt);
>   	if (ret)
> 

