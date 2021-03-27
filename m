Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1BC34B92C
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Mar 2021 20:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhC0Tud (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Mar 2021 15:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhC0TuM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Mar 2021 15:50:12 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB0DC0613B1;
        Sat, 27 Mar 2021 12:50:12 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id z15so9248560oic.8;
        Sat, 27 Mar 2021 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0rkxaOhq4ua/j8OldplsuIq44B2gNxVTYKHiBF2id1M=;
        b=ILdd+sZP/+TBAJTc+C4cRZFC77QOs2qk8/C7A6RAdv0erlQxlc/C7ChUDpBbvK8r6c
         140dj/t83jroex7B4plKEUeeMoTNh6y4p5xl+wxUzqx33GUGCMud4w9KGJwY52aEf/jA
         gT5XJ5tssoOhgylRKbm0iX70sn0vUSAdvI3z4K2EeLZGWSxHJE4QrWoScbU6Ol85DFM5
         uMHEo8IkiGiCnIl3dOVJ2sugjr7lmLMa0Qf91v/uSHH6iax1m6UMkdYwIjgLHS7jHOvP
         f8kRdKZmLhtLocrYYmu8nfQeEJTS+XPWZnm8uUJ2e9pNd2TxscC8PiaM0ge+1yjHHV1N
         FaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0rkxaOhq4ua/j8OldplsuIq44B2gNxVTYKHiBF2id1M=;
        b=DrQlTMOchF7VJJuWVIbw9hqSze1dGqwQRpys6MmFzFVvhveF8nWF9KRc/ZwpTOYU9c
         Rd0LrLFVCSKoI9SMqG7QoFGQyMwh1hnXnSd6JJs1ZTERKkhLHsukzkjbo54rzt7xRROt
         nnBYfsnrFfN0F5Omz0VH2VLtLC0MfvrByugmutZ5PLV5Li/gJo+mKBklZqzrk4ISXpNT
         9wUCJ7Qofcp9DgRDwOb4e9mtVuU5YO9QEo6C/GugjvsdBJNIJp31QT+G7IF0mZHLGbgh
         iPFVd84R+OrhbkLihaNpZw8VYVE2fMgrFfJJOLABKPuw654pazKigXwoDxqZelx84Lcv
         Dhcw==
X-Gm-Message-State: AOAM532hCvESBi6cLNglHDa470FEYfWq96wElmtG4F8DnG28evObRm/i
        5QFVbQWpNYs8gWdKuvZ+ZPSbvNCqv+I=
X-Google-Smtp-Source: ABdhPJzd03f31NhyQwjnMvMCXt92c3XksdWwiKRj4+ue0TcBSD5zxvLCMp5D74jBwDIRz1cMtKanKA==
X-Received: by 2002:aca:ef84:: with SMTP id n126mr14023702oih.84.1616874611445;
        Sat, 27 Mar 2021 12:50:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1sm2661256oop.0.2021.03.27.12.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Mar 2021 12:50:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/1] watchdog: dw_wdt: Remove duplicated header file
 inclusion
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog <linux-watchdog@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210327012028.1606-1-thunder.leizhen@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <28b7616a-daa7-e944-8c0f-640eddaaebc8@roeck-us.net>
Date:   Sat, 27 Mar 2021 12:50:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210327012028.1606-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/26/21 6:20 PM, Zhen Lei wrote:
> The header file <linux/kernel.h> is already included above and can be
> removed here.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Already submitted:

https://patchwork.kernel.org/project/linux-watchdog/patch/20210325112916.865510-1-wanjiabing@vivo.com/

In general, when removing duplicate or unnecessary header files,
please retain or improve alphabetic order. This patch makes it worse.

Guenter

> ---
>  drivers/watchdog/dw_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 32d0e1781e63c4e..b1642e2d9175584 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -19,7 +19,6 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> -#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/interrupt.h>
> 

