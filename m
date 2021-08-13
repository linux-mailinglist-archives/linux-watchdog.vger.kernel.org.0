Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875FA3EBCE4
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Aug 2021 21:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhHMT60 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Aug 2021 15:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhHMT6Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Aug 2021 15:58:25 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D8CC061756
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Aug 2021 12:57:58 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so1179857wme.1
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Aug 2021 12:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=INWqf7xcRyfI2PYsIwYqEDJuBY48v59eC2MuTTUaM2g=;
        b=IstQ9hPYHiMh+iCaQiS0QRyLRiWDwoyNfaJx+yc/GWtj8CcXjptjlY8m0T188M+gXk
         CHVjvdXb7UxYqmVhW5yNXwyM8YmXoqAJd//mxXxaij3tUnEcb6CwvXXORlc+PS6EOJCH
         t/OWE8RGp0hKWCLLOSggNtuyowt5nCtdCDChJw3BwvEWQfBFRlvsDwNhz7SibZoVRQ0R
         XEg0vJpnRa+6XgoMHK9yVOYWnstdUkb+ru7+CLoF/e9GK9eeX2tGr6ZLiU3TL/HqRwHm
         3nNhT8HSVMiohpZYC9iD7J69/PB1AGMczyQ6YTj31Uz6IrEYb3joFsf7on5RqJhbIPfH
         7b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=INWqf7xcRyfI2PYsIwYqEDJuBY48v59eC2MuTTUaM2g=;
        b=rnEHLb6gcNmBlh/q78kjO6DYptRB1j+CqpUMRRByJuRJAnpRNRvIaH9KKkw4u+q4E+
         /b+UtVxXzY16GYb55vMIHAw4fi6cC8XZhicU8Hqr3FJv68H2qg1ZzPoVEyvi0360YcYf
         m7VvZZWj1dj4Zee6OTPsFu107d0Dud1Oo46KHj+HcqTAJPk7/jqYQ8FRWryc7Q9sDINe
         JN79s/o9j9fsB+28Eg0TRAN9ikn+DHnU0NbrgG1IKP/l/G51frOVqwNq9y/1UE9N2rtu
         AQ71YccAVxVXER3ViKxkRw4MDT0LV1GD7Qw1qzdo+L0OvVutneEFf06uY41sOGq83TVQ
         s8tw==
X-Gm-Message-State: AOAM531WpWA92sCxjeUfS8rlRVxhSjzgvI1g5/aswcqkJAugjyu6pcJV
        xEoYOWgXtbVfBkJRi71XCodje1I9+r+g4q0k
X-Google-Smtp-Source: ABdhPJx6tj/vRljqz/nI+8oU+ph4JLAQga8fsiTCgt/6Pf+zo1jo21kzRo3DpntMU21XGQuXIKv4eQ==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr3686475wma.19.1628884676564;
        Fri, 13 Aug 2021 12:57:56 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5df3:d0eb:3945:640d? ([2a01:e34:ed2f:f020:5df3:d0eb:3945:640d])
        by smtp.googlemail.com with ESMTPSA id c190sm2333406wma.21.2021.08.13.12.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:57:56 -0700 (PDT)
Subject: Re: [PATCH v3] watchdog: ixp4xx: Rewrite driver to use core
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>
References: <20210726121214.2572836-1-linus.walleij@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c1b353d5-4e31-eb12-5fe6-5fae8f05bebc@linaro.org>
Date:   Fri, 13 Aug 2021 21:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726121214.2572836-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26/07/2021 14:12, Linus Walleij wrote:
> This rewrites the IXP4xx watchdog driver as follows:
> 
> - Spawn the watchdog driver as a platform device from the timer
>   driver. It's one device in the hardware, and the fact that
>   Linux splits the handling into two different devices is
>   a Linux pecularity, and thus it becomes a Linux pecularity
>   to spawn a separate watchdog driver.
> 
> - Spawn the watchdog driver from the timer driver at probe().
>   This is well after the timer driver as actually registered and
>   started and we know the register base is available.
> 
> - Instead of looping back callbacks to the timer drivers for all
>   watchdog calls, pass the register base to the watchdog driver
>   and manage the registers there. The two drivers aren't even
>   interested in the same register so the spinlock is totally
>   surplus, delete it.
> 
> - Replace pretty much all of the content in the watchdog driver
>   with a simple, modern watchdog driver utilizing the watchdog
>   core instead of registering its own misc device and ioctl()
>   handling.
> 
> - Drop module parameters as the same already exist in the
>   watchdog core.
> 
> What remains is a slim elegant (IMO) watchdog driver using the
> watchdog core, spawning from device tree or boardfile alike.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Depend on ARCH_IXP4XX since we use SoC code accessors (drop
>   COMPILE_TEST).
> - Drop <linux/init.h> use <linux/bits.h> rather than bitops.h
> - Fix some tabs vs spaces issues in the defines.
> - Call clk_disable_unprepare(d) directly from the devres
>   callback, the void * argument will be handled.
> ChangeLog v1->v2:
> - Pull out dirty patches underneath this patch. Tested on a
>   clean v5.14-rc1, sorry for the mess :(
> - Drop tick rate from the timer driver - was only used by this
>   watchdog after all.
> - Retrieve a clock from the parent to get rate if possible,
>   fallback to a default clock rate if not. Prepare and
>   enable the clock.
> - Add a devres hook to disable the clock after use.
> - Drop pointless platfrom_set_drvdata()
> - Put a more technically correct print at end of probe.
> Merge path: I expect this to be merged through the watchdog
> subsystem once the timer maintainers are happy with the patch,
> so Daniel or tglx: once you approve the patch please ACK this.
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
