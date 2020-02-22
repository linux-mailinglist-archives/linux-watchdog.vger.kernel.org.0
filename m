Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67066168FE7
	for <lists+linux-watchdog@lfdr.de>; Sat, 22 Feb 2020 16:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgBVPzt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 22 Feb 2020 10:55:49 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:39736 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbgBVPzt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 22 Feb 2020 10:55:49 -0500
Received: by mail-pj1-f65.google.com with SMTP id e9so2121317pjr.4;
        Sat, 22 Feb 2020 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xBBBMhUIQhUE2f9rKIV0ran2b+vF87fdNtOXyBakS7w=;
        b=Vex6A7caHfueCivvuB68sR3wUUvABHwkEuux7USfTw6eBrrIWO4trPVm66SQy0njXD
         2FzojX2T/Bz7mCjktrl7sAJhJRXjO2d+NUYyJjSXrqEuqD96p7psuvdvPy3E9e2NJGBB
         2PzTANbFlc7KFR9OsIL/tg7I2iHCGWHqxtqZAhCokXPLXyPiDAB3ca/Vv7TEnild+j4f
         Gye9cjWaPoRu/bAsy0prcJynaZseQwFjzOTSJm9zUJ4rrJOkrIdBrieTsL3ZLu66hJmt
         h2bZ+RCuMMNMTLAydAJeCnREaaCCND1d9JeImVv2ZJVrJO10UWhY7B4TdpFxR4+IIErb
         y8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xBBBMhUIQhUE2f9rKIV0ran2b+vF87fdNtOXyBakS7w=;
        b=TA0B1PCWTcG0lRAkkWlXoQytm6whq0Xz4LJx+1UaW0qzknRyde9KEwv4dIjobsiK0i
         FWvrVkpDIDdGUn2T0UbNwrUr6L6KkOF/3cSBqkl+ISfewxU7++hSRk8JyGVbig4hfNn9
         NrPzyKRJqtPp/5LbdGeD2K7YE9RQHx8PVOQc3EGDJtbP/R0JWPNBty9MyKfMmO09qFL+
         +IaITpbdFypQyD24LttsjN365P8o/K+OrZ3KiorsKeZI3I0KQdpmvKN9XfemsZy2Tz6P
         PpyATx5gA3TB8strfcwAuugKPxl+aWdBEIEJ3ig0amN1Lf+WrxyiKvwg9C/pnTA5pwJi
         gjvw==
X-Gm-Message-State: APjAAAXchXCiJhjbOredeZEm5QELLhlMZgRE/R61m6yjYy+O46KmSYeQ
        aYwAX4+V5jPSts7xjHyBaZA=
X-Google-Smtp-Source: APXvYqxarWw25HR6eJgr5jn1aGOQGyPF2NF5phA2vFgKlpU8qKGocjNHXL74q/xw5OO5iLYG0mkIPA==
X-Received: by 2002:a17:902:b484:: with SMTP id y4mr41025827plr.126.1582386948559;
        Sat, 22 Feb 2020 07:55:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o6sm3342655pfg.180.2020.02.22.07.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2020 07:55:47 -0800 (PST)
Subject: Re: [PATCH 1/3] watchdog: imx_sc_wdt: Remove unused includes
To:     Anson Huang <Anson.Huang@nxp.com>, wim@linux-watchdog.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
References: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <74657776-ebee-555f-431c-00b65ba83ca9@roeck-us.net>
Date:   Sat, 22 Feb 2020 07:55:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/20/20 6:00 PM, Anson Huang wrote:
> There is nothing in use from init.h/reboot.h, remove them.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/imx_sc_wdt.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index 8ed89f0..60a3246 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -6,13 +6,11 @@
>   #include <linux/arm-smccc.h>
>   #include <linux/firmware/imx/sci.h>
>   #include <linux/io.h>
> -#include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> -#include <linux/reboot.h>
>   #include <linux/watchdog.h>
>   
>   #define DEFAULT_TIMEOUT 60
> 

