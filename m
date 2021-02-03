Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBA130D9D9
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Feb 2021 13:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbhBCMeX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 07:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbhBCMeU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 07:34:20 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC67C061573;
        Wed,  3 Feb 2021 04:33:40 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id i30so23179871ota.6;
        Wed, 03 Feb 2021 04:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2fuMtsaftgeuD9nq8oP/Ti2gKAA1R+8tySuAtoy3nf8=;
        b=X7VPP3HIYTJ5tUbT+l34g+NYalg0iZLylDjm5m11FzYdlkGkUw3AKa7wu8IFeqlz/D
         kpeF1vsa2QOjCeN4aKdR6hD3Lq5yp41II/ygo9h0oRPw3FbUTGbFP/PRVaM6NzdWMf1S
         9jvL5nnYnZIWz2XhDiMOrZ325mV2qacAzhhm3LEi3/NnsfUZpe5ZfxI5mw1jnzTHU+4o
         gQuZ02EfOfF035B2SwQq9kbk4dfGTv/1fYtdhi7HiOXjYpWNeRJ5BZOmew1nbzEhzVK7
         ivmnV5qEvXPAVq0jtao2ydgfXc/JiVE/VsAVc3SXXGxNzljJ77fh5oAxc7LN6cOH/E3+
         ZsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2fuMtsaftgeuD9nq8oP/Ti2gKAA1R+8tySuAtoy3nf8=;
        b=MPQfnCTlWIo23t78e6gSaP/Vdh+Xch3VwYLK4Q/+rbh1Jl6S9B/6V9Kp2Tz9fgoxDs
         D7qfUFdXv0hAzIR+P33YsDTpKZhxwmTzlOqCXIfsDwHDRW21up7ES+7I9GX7kGHkkRP2
         nWnqMpBdurw7EIqctV/KAGMM8UvoaO71C4MM7UPU2wNW6WBx0oqR0n8eltZ2b9BNoeBN
         rGjIUii766lCQddHYSWfzLQlapPAamU3AT8D21S8zGw5lkP5wEPJNJMYKdO7EpOCkXN6
         uzfth2EVOhrd40rxKaTwuzLZZwKbsJ2u4eLIrI3oGRCHwYB5LBHfibMjmyKpsGeU61QC
         imLw==
X-Gm-Message-State: AOAM530BPzr3sONshP+eo5a1L3umCq9YdoHK1ExIwbigVcf51dd+plsL
        /hNNPL77YdxJlRou0NcmkZc=
X-Google-Smtp-Source: ABdhPJwdCV+zTCDx4oIFDzjk1UqEFO1pdULPv+Ki0o/loV7t8nBA4nTn/doeAYAHeG3z7J4m1pbOwQ==
X-Received: by 2002:a05:6830:1e7b:: with SMTP id m27mr1717071otr.317.1612355619886;
        Wed, 03 Feb 2021 04:33:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p22sm390191oth.38.2021.02.03.04.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 04:33:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: diag288_wdt: Remove redundant assignment
To:     angkery <angkery@163.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Junlin Yang <yangjunlin@yulong.com>
References: <20210203122404.752-1-angkery@163.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <99e32686-3cd1-fd51-ccad-fb11541d0374@roeck-us.net>
Date:   Wed, 3 Feb 2021 04:33:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203122404.752-1-angkery@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/3/21 4:24 AM, angkery wrote:
> From: Junlin Yang <yangjunlin@yulong.com>
> 
> The assign for 'ret' is redundant and can be removed,
> because it will be assigned before use.
> 
> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/diag288_wdt.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
> index aafc8d9..4cb1087 100644
> --- a/drivers/watchdog/diag288_wdt.c
> +++ b/drivers/watchdog/diag288_wdt.c
> @@ -118,8 +118,6 @@ static int wdt_start(struct watchdog_device *dev)
>  	if (test_and_set_bit(DIAG_WDOG_BUSY, &wdt_status))
>  		return -EBUSY;
>  
> -	ret = -ENODEV;
> -
>  	if (MACHINE_IS_VM) {
>  		ebc_cmd = kmalloc(MAX_CMDLEN, GFP_KERNEL);
>  		if (!ebc_cmd) {
> @@ -167,8 +165,6 @@ static int wdt_ping(struct watchdog_device *dev)
>  	int ret;
>  	unsigned int func;
>  
> -	ret = -ENODEV;
> -
>  	if (MACHINE_IS_VM) {
>  		ebc_cmd = kmalloc(MAX_CMDLEN, GFP_KERNEL);
>  		if (!ebc_cmd)
> 

