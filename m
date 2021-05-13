Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E916637F193
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 05:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhEMDQT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 23:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhEMDQS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 23:16:18 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45317C061574;
        Wed, 12 May 2021 20:15:08 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id w22so10280025oiw.9;
        Wed, 12 May 2021 20:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KDa68587p2IUB2lntlrtQ9wVaKOr22WxUDp/EQ55LQ0=;
        b=or1fHz2q7LaWUiHmD//pzIek+uRAu4u/Bpg513PcONaXoPkuOaBVp3hwSxTxk5Uby/
         1WoF/5Esfpzmyk34GV25W9q+b9W5/KcMkCvhlqAdONR+Uv5FL1YOSfSKUlcvouDlr0Yp
         GyksBkZ2yu38uR2ZFjacsaUQBurMgrZ4yVXuA8o0X1lTzEnB6dDBrahegWchBF10+DOb
         MFbbcuDZ5nrPLlN1LepteyaPnxtyfDzdrnBJsPH+QUj5TyIUAEeyI77+D2UP1T4848aj
         RoqOcfk3E8ElFVs9RBWdn7OasSmYDQPMDPB+RIcliSs7qzCipPS7VQp/Zju5zJw5P0an
         n2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KDa68587p2IUB2lntlrtQ9wVaKOr22WxUDp/EQ55LQ0=;
        b=EErYkDpCU472QJeTaZBiulOOL/OFZ3S8nOJG1JRD45RdmqPTdW3oB1dNTw2cXm3hwa
         EgHlsZvpn0RGYT70B6kbnmV6UVnzHUGHN5wz+WqwCZAt2iwddv7gdy7j7MshWBukIBnx
         5tFSwyQytfRg3AOEUXUOpvhiQQadfoCCj+VrPSljwBNQdsfbblEJdvO0MpUlCWfEQwNf
         2KSklRNCnzfcRrMgaIwVlvfcuJ7KWv0NPz1miA5GgEZqqtRJXxLEfXHqHJRdFNyCDOLO
         cEuwDA77PnPF2/Xszi8mwafYyxPxq6yW0DX7PlDXZLlezUwFGMeeJ9rydh4cEaXIgHuD
         QUyg==
X-Gm-Message-State: AOAM531c2pNWL4c2EeiCpBKP32z+BwP081dIIietHCSVm/qWwk8M6Q9q
        JRx7RMoI9a+P71ijYX5mXZARLxsYW8U=
X-Google-Smtp-Source: ABdhPJxHthqNA+D7XuNOx7MR5jyKe9yhgJtCj5lSLm0chP00NOdl0zWrhruPcQQhuPCAecsu/x++3A==
X-Received: by 2002:aca:f5d0:: with SMTP id t199mr1386947oih.50.1620875706935;
        Wed, 12 May 2021 20:15:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x14sm397530oic.3.2021.05.12.20.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 20:15:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: dw_wdt: Fix duplicate included linux/kernel.h
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        wim@linux-watchdog.org
Cc:     p.zabel@pengutronix.de, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1620871503-100900-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b885c7ac-2e25-6a03-4434-d0b31f92a15a@roeck-us.net>
Date:   Wed, 12 May 2021 20:15:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1620871503-100900-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/12/21 7:05 PM, Jiapeng Chong wrote:
> Clean up the following includecheck warning:
> 
> ./drivers/watchdog/dw_wdt.c: linux/kernel.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/watchdog/dw_wdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 32d0e17..b1642e2 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -19,7 +19,6 @@
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/io.h>
> -#include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/interrupt.h>
> 

When making such changes, please use the opportunity to reorder include files
in alphabetic order to help ensure that duplicate includes don't happen again.

Thanks,
Guenter

