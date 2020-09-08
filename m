Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29116260C47
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Sep 2020 09:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbgIHHmx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Sep 2020 03:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbgIHHm2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Sep 2020 03:42:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58162C061786
        for <linux-watchdog@vger.kernel.org>; Tue,  8 Sep 2020 00:42:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so17968038wrn.6
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Sep 2020 00:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uLUFK28IISjx23/D2ml5l6aSZkYLMgDiXFORqFH61rQ=;
        b=wfT5YyvYowSvPxHb+0/UENzgICebO//M3d0DIDWTaHQEJ5O8uHUUoMmrKzjeIMQqhp
         NitiIv7XdDmxggV4H52sZ8GTfO2gx/qw5l/KSDtQ5k7j01HmFi8cILzZZTc1QulK7jLs
         FJR7s1cQa4ABR9jisaKM+w4K4OH7nPjdA5yySjFdvPdEhKp9Pdb2E5jOhpoKyKzqADtF
         9rvVG8SDZqY9Gexgx+Opxsg3NCd1mxoMtmv0mYlisOhyCFfTItVkvffAfsv2qI5glIoD
         p6y8pTSLFo/DJ8Z8ql+PhihvnyiwtfryLTFJeF/3iqnz5513istkaHH5GvpZtlkejkLV
         tDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uLUFK28IISjx23/D2ml5l6aSZkYLMgDiXFORqFH61rQ=;
        b=HH4VlAchMl91I6bS08sQEGrhJIuWZjk535H9xdIii88t06jUAP90/S0NbNxN6oWjnX
         lybhGPByyfrZDIIycUh51HceAlKvaYwcEatLLj/KYOAE5E5J03yYW1SZJi0KlJ40BKcR
         8sPjCbvr08DNC1xx7WeHb3M+nxnmDqyTMsnmATOeau1gaLSBcmBEVaBvto/UhD9Dx9An
         v7JZ3IOspHgDEuO/ZOy0fzZpAogfQYosDHkFrPGht570agmR6D7lB4Uj4jqctt3vfTtu
         qsmFWsYHmTkH7/ZzrsJIOYb2YEiTZ30xudyk8OneNz0d9WvoS0zD5FMuLhdZ/Jef/XxJ
         /ytA==
X-Gm-Message-State: AOAM530/clMt3QCvaHxKw5bF1286bFHY4z9RWkYreCOAXMrf1bQphrib
        eefJ3tjXh06ISp7wVlJUZlm5vg==
X-Google-Smtp-Source: ABdhPJwKj9M+NROzity0wbbtarhMYD1iO1A/RCqJwJa4QnCTCrNVQ7+USV3LfuKpabL5+WM8PcwegQ==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr27381258wrm.117.1599550944553;
        Tue, 08 Sep 2020 00:42:24 -0700 (PDT)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id i6sm36336964wra.1.2020.09.08.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 00:42:23 -0700 (PDT)
Date:   Tue, 8 Sep 2020 08:42:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v9 00/13] Add support for Kontron sl28cpld
Message-ID: <20200908074221.GA4400@dell>
References: <20200907213802.26745-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200907213802.26745-1-michael@walle.cc>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 07 Sep 2020, Michael Walle wrote:

> The Kontron sl28cpld is a board management chip providing gpio, pwm, fan
> monitoring and an interrupt controller. For now this controller is used on
> the Kontron SMARC-sAL28 board. But because of its flexible nature, it
> might also be used on other boards in the future. The individual blocks
> (like gpio, pwm, etc) are kept intentionally small. The MFD core driver
> then instantiates different (or multiple of the same) blocks. It also
> provides the register layout so it might be updated in the future without a
> device tree change; and support other boards with a different layout or
> functionalities.
> 
> See also [1] for more information.
> 
> This is my first take of a MFD driver. I don't know whether the subsystem
> maintainers should only be CCed on the patches which affect the subsystem
> or on all patches for this series. I've chosen the latter so you can get a
> more complete picture.
> 
> [1] https://lore.kernel.org/linux-devicetree/0e3e8204ab992d75aa07fc36af7e4ab2@walle.cc/

I'll take all of the non-ARM patches later this week.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
