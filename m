Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0949B37F938
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 15:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbhEMN6Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 May 2021 09:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234247AbhEMN6O (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 May 2021 09:58:14 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66923C061760;
        Thu, 13 May 2021 06:57:03 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id h21so16013089qtu.5;
        Thu, 13 May 2021 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=arftsi62dSBN19yvGjl+C2XG24kDnUGAVeP/gS4up7c=;
        b=X7RhQN5/DuAlBJyEhUbAO8tCN2qeQKZweyP/2MM9TVH3QPVEnz1CSbj+LHRt2eKoO/
         GEyZ+LydFpZw4n1ZCTBCJtRB0WNucUJH/4SOSqmq1pxvRogzfzyJlwLLmakUFj9ZjJ0i
         amxtAbxV8ZApzgQvFRDhXzC05MsvVJU06bfS82K/TXXqUgLWTNmKmL1jUSiHWbNHmL01
         M0lmQtwbRvXJ0hhA95/dnUMF1WdLGlZiY+Bhnhqx5wrtHdJ3ZaEb3ynzzPieZ/r+nVC7
         gR8IQJA8A7SdOQ82nckbZ5jelW0O+UqHK48gDAueI0DNt1SDtTYZPmWcSAdCNCSbu1WA
         NuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=arftsi62dSBN19yvGjl+C2XG24kDnUGAVeP/gS4up7c=;
        b=ukSku/tUiYvAaKS2wB68AS9WlCPOVe7BeH7BMvFb6KWOWOfgG/1+AHEupJmcr659Pn
         G2LzATIiUBF66Vz4pyGFKncNMSJy1dIjjz71JUCpb7+hbBXx2l6H0U32HbCgzEcREDMt
         1g60RHCQFzTTxEb1tFau5y8NuckSv0RfvE/8LZtJGUjqDE69smp9XzhJuCJWo9oJQhsN
         oXWxHZPcqsyDhe1GOxx49arAQbCfUPrJPCcqc26lvbKV1XTRmw2inPFqG79C8+OCPDPw
         SeIFWC434jLe2h9CIVCSMXB+obbSEZg0gWf87SgnllOXWuz8SiF3MDjS9Nasq1CzmQbx
         hTOA==
X-Gm-Message-State: AOAM533lhY7iBBu2GO37y2cGOqf/TTtfcpT4MxyJ+lC4xkycxjA4vVBa
        1E2fn3uODjrwNYWNfQaLA6RLgxcCuBY=
X-Google-Smtp-Source: ABdhPJyi5gnqhh1MrlCkqxEZPq1HNsnzgnEGh9XANlWvKRdzd4/51JAIacii7sG+vPI5mdSx3sQXPQ==
X-Received: by 2002:a05:622a:138c:: with SMTP id o12mr39557486qtk.190.1620914222360;
        Thu, 13 May 2021 06:57:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b3sm1037373qtg.55.2021.05.13.06.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 06:57:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: dw_wdt: Fix duplicate included
 linux/kernel.h
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        wim@linux-watchdog.org
Cc:     p.zabel@pengutronix.de, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1620904182-74107-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8b670d5a-dc16-0709-c55a-42832ac17bfe@roeck-us.net>
Date:   Thu, 13 May 2021 06:56:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1620904182-74107-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/13/21 4:09 AM, Jiapeng Chong wrote:
> Clean up the following includecheck warning:
> 
> ./drivers/watchdog/dw_wdt.c: linux/kernel.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Changes in v2:
>    -Adjust header file order, for the follow advice:
>     https://lore.kernel.org/patchwork/patch/1428192/
> 
>   drivers/watchdog/dw_wdt.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 32d0e17..cd57884 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -13,22 +13,21 @@
>    */
>   
>   #include <linux/bitops.h>
> -#include <linux/limits.h>
> -#include <linux/kernel.h>
>   #include <linux/clk.h>
> +#include <linux/debugfs.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
> +#include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/limits.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
> -#include <linux/interrupt.h>
>   #include <linux/of.h>
> -#include <linux/pm.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm.h>
>   #include <linux/reset.h>
>   #include <linux/watchdog.h>
> -#include <linux/debugfs.h>
>   
>   #define WDOG_CONTROL_REG_OFFSET		    0x00
>   #define WDOG_CONTROL_REG_WDT_EN_MASK	    0x01
> 

