Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A92D1BDC14
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Apr 2020 14:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgD2M0h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Apr 2020 08:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726628AbgD2M0g (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Apr 2020 08:26:36 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FF5C03C1AD;
        Wed, 29 Apr 2020 05:26:36 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id h11so773213plr.11;
        Wed, 29 Apr 2020 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mE/G5KaL0uIC70ovNSoaKbcQfn9t7OEF0yBBgrML3hs=;
        b=KMlppx4pE5inHa/GRFclaen/QiPzJ6iPcMIBuKSKArFoBCartZuz/RdszlFnXo5fJN
         wU+rOh0GFzzKZgxRSd9An+pJhIO1VpatedA9PZ6Vow/hAM3GXyZINV94WsgG9eCcbUu1
         24r99OBCXSSf4xTmil7QsEsmdepzEckg56AHWFNNwnw9BggrstxvvPOoSFYMmo0tIG3K
         Np/Ywbi6JEUNmSW74OF1/skvceyQMF8towsly/jcBv6F2w6/vOPqiibTw8m+H8b7scjd
         f4WXhfk+BSX3o//fWSoVkmVxCWtjy0/UOhxMGlpXIYB0GNU9f6xG7EuG+U0slU8yn2Ly
         LttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mE/G5KaL0uIC70ovNSoaKbcQfn9t7OEF0yBBgrML3hs=;
        b=QGyOoa95Y6PYtwRHtWW0yD2+SNTt4VDruDr01JKvzg1ZW2CEMX30iCDNce2Kr6Btkr
         bHU8tQAL9c/pUg8e7BCIPjaCdAwmgudr6VOu6+UDQ97VMzVOqiVqdlrjJU7HU0A5G6yc
         XJYrtWTFMQ2lwKhNiX2B823NgJKfPVcngJgEnNd1KKE76PYL47EKuT1cs+J1+Wn0zVOy
         ehDy/M5EzPrFjHHf+tyDipB+uJxENxSMmHCoF+7YBaoUhw+RTzZvBT/bBNk+19/2amUu
         zImNNmgIGpStI8EyhDKEtuQ/3mBvEujr7UXHVz8HoIB+lX4iIdHDCOn2CDsGKslWD/W4
         grTw==
X-Gm-Message-State: AGi0PuY5ezzMwgP0eSXV8rkRGn/fpGgPJlJWnwIFjDcOu+3NXC3Pub+1
        UbBOAg96T3xNYKHJdqqEYSV7iHey
X-Google-Smtp-Source: APiQypKVdpfpEK4zjQRRfP0OMTWMeKy/EpqeeARCpOcK9Duio0dbQ4bVQFiVc9VXeKN/Rz2AR+hMJg==
X-Received: by 2002:a17:902:5a0b:: with SMTP id q11mr33277048pli.23.1588163195605;
        Wed, 29 Apr 2020 05:26:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b11sm978819pgj.92.2020.04.29.05.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 05:26:34 -0700 (PDT)
Subject: Re: [PATCH] watchdog: iTCO: fix link error
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200428212959.2993304-1-arnd@arndb.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <645115f0-5d3d-d8e5-9c26-64378e0d1c6f@roeck-us.net>
Date:   Wed, 29 Apr 2020 05:26:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428212959.2993304-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/28/20 2:29 PM, Arnd Bergmann wrote:
> When the MFD driver is a loadable module, the watchdog driver fails
> to get linked into the kernel:
> 
> drivers/watchdog/iTCO_wdt.o: In function `update_no_reboot_bit_pmc':
> iTCO_wdt.c:(.text+0x54f): undefined reference to `intel_pmc_gcr_update'
> 
> The code is written to support operation without the MFD driver, so
> add a Kconfig dependency that allows this, while disallowing the watchdog
> to be built-in when the MFD driver is a module.
> 
> Fixes: 25f1ca31e230 ("platform/x86: intel_pmc_ipc: Convert to MFD")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 66ca69f30f01..67a83578810e 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1217,6 +1217,7 @@ config ITCO_WDT
>  	depends on (X86 || IA64) && PCI
>  	select WATCHDOG_CORE
>  	depends on I2C || I2C=n
> +	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
>  	select LPC_ICH if !EXPERT
>  	select I2C_I801 if !EXPERT && I2C
>  	---help---
> 

