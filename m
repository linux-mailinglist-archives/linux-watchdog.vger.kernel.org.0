Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D261C5D02
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 18:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgEEQID (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 May 2020 12:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbgEEQIC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 May 2020 12:08:02 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924F7C061A0F;
        Tue,  5 May 2020 09:08:02 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t7so1012811plr.0;
        Tue, 05 May 2020 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qF5t/5B/Sbt1oYUUbSa89RTBRJneyVHJyniDjoH+tug=;
        b=Nam9xoGDFdXkjP3cUEfl3jPgSTHCvaVdLjlVXT2yV0EttRAvYICYJ+a3TSJliMdR/R
         7BKCsdy+xbhbpgVolkXi6cKIjUr349R7Qrab4HQ2XwYy1s5unvQ1eO1W/Vyp7xOCGXE7
         4cTk/iHLASewPD9A36wNOQQd/6ckJ/K8sMyF61eY+Asj5y+IFJhyiAg/V/bLtlgQsru+
         iJBZaQ7Pe422GEOuNUqRyGsXH75vzyUn31XRk2txRMs/tpm3ghYhLS85U2oMINUgkZ2R
         9WrW3t74/3NfyRSdi4ZLBb8iXCKCPlB0r/jQGZOZT+Zp6HGsOPf62fYZrsMDU5zZjJdE
         tTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qF5t/5B/Sbt1oYUUbSa89RTBRJneyVHJyniDjoH+tug=;
        b=XkLSJu/3Dfjy2LMGsmSPaeRVSL9zb29VxH3f0+uIXIM3B9Wcia8rZlf9MXfxrNQPVW
         r6m/HhGMBGZARzkiQdOYCXfkgLbKvWywwUbChFoKOKscWzF8p8bqATNyCcEqO04ChGAn
         wvvALe054xu1ShqMSnmjCocdwMA7CmyWAuJTdghNVAfNQVhGi8gRcaU5SHHFebiWIxOW
         yMeo2n1yzI8lxCcoOUSeYlW/K8T4Ey5bxZ+F73BIvO5XEEAu+8Fo2StkupRX0ZKJ+I7c
         SFXf0SQeFTB/mMhDXkz2MN7tkzz9jNL6FymKPftjppssJdqhtKba2IxDY03tK4hkzsrt
         DUcw==
X-Gm-Message-State: AGi0PuYbCBh203BahpcQWkj7ITc7wBN/+le+hzJkRNTJ5EB3XOFhIag9
        4Ra9FjIfOdkru/C7bG8RGrQ=
X-Google-Smtp-Source: APiQypJn+OxmUlmUV5cZyc1N94fO2wVwBTkwCE9o+3SvFFhea19QXEl++JxGLvMZcqaCy5tKBIHoEg==
X-Received: by 2002:a17:90a:6e0f:: with SMTP id b15mr4035693pjk.129.1588694882169;
        Tue, 05 May 2020 09:08:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x18sm2394703pfi.22.2020.05.05.09.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 09:08:01 -0700 (PDT)
Subject: Re: [PATCH v4 4/4] docs: watchdog: mlx-wdt: Add description of new
 watchdog type 3
To:     michaelsh@mellanox.com, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <20200504141427.17685-5-michaelsh@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e85001c3-052e-e0e1-4653-4594d3570b94@roeck-us.net>
Date:   Tue, 5 May 2020 09:08:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504141427.17685-5-michaelsh@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/4/20 7:14 AM, michaelsh@mellanox.com wrote:
> From: Michael Shych <michaelsh@mellanox.com>
> 
> Add documentation with details of new type of Mellanox watchdog driver.
> 
> Signed-off-by: Michael Shych <michaelsh@mellanox.com>
> Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1-v2:
> Add explanation about device registers order
> ---
> v2-v3:
> Remove note about cpu_to_le16 and vice versa conversion
> ---
>  Documentation/watchdog/mlx-wdt.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/watchdog/mlx-wdt.rst b/Documentation/watchdog/mlx-wdt.rst
> index bf5bafac47f0..35e690dea9db 100644
> --- a/Documentation/watchdog/mlx-wdt.rst
> +++ b/Documentation/watchdog/mlx-wdt.rst
> @@ -24,10 +24,19 @@ Type 2:
>    Maximum timeout is 255 sec.
>    Get time-left is supported.
>  
> +Type 3:
> +  Same as Type 2 with extended maximum timeout period.
> +  Maximum timeout is 65535 sec.
> +
>  Type 1 HW watchdog implementation exist in old systems and
>  all new systems have type 2 HW watchdog.
>  Two types of HW implementation have also different register map.
>  
> +Type 3 HW watchdog implementation can exist on all Mellanox systems
> +with new programmer logic device.
> +It's differentiated by WD capability bit.
> +Old systems still have only one main watchdog.
> +
>  Mellanox system can have 2 watchdogs: main and auxiliary.
>  Main and auxiliary watchdog devices can be enabled together
>  on the same system.
> @@ -54,3 +63,4 @@ The driver checks during initialization if the previous system reset
>  was done by the watchdog. If yes, it makes a notification about this event.
>  
>  Access to HW registers is performed through a generic regmap interface.
> +Programmable logic device registers have little-endian order.
> 

