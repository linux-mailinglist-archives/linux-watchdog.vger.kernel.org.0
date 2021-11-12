Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95D044EB0C
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Nov 2021 17:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhKLQKy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Nov 2021 11:10:54 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58444
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233445AbhKLQKy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Nov 2021 11:10:54 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 956843F1C1
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Nov 2021 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636733280;
        bh=EJ4KGJvpDYdiNs1f7bKpHnVnPz3httl65IxsA6AuR/c=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jdZ/svlG60vou6LWPXhgosJbnaRSQVL4UqB3j/bhWRdEOni/yBkqjnO497jrFfP4G
         Q5AMPIJ87Re1Sqvaie00nR7Bpf1xqc/PmwzJ9+NRPOcf4A0BHFe9ypAmgdHtK7NN8N
         CWMVDWt52PMrR9mTtDpYJjGagJww5X0J/K5Alm5vxx8ziEq/yfcUyhyWJVfnbzS/xy
         9bGXsF/am8rxU7qsWtl1QnNFDS/nwlFv8wTWTqDjsbpxR52wZRBWemUmNzp5N9q94k
         9NHjuDkBR+fQm+n3/VEpSFOZl9GP9OZijgFYxaVDaF86a0Zo+skGRIgfzCLNtNzCCZ
         xLUi3OCrsA8JA==
Received: by mail-lj1-f197.google.com with SMTP id p1-20020a2e7401000000b00218d0d11e91so3101320ljc.15
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Nov 2021 08:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EJ4KGJvpDYdiNs1f7bKpHnVnPz3httl65IxsA6AuR/c=;
        b=G/rMjr1bkbjnf15YYnABucbg2FE89mB1X38HNELwrIFh3okN6Y8WPPN4i+ovHFjYBc
         8pyfWvE5bEkXGyfdlF5Pvg2v41SkqFXBRo6ceeIqlokZ3iFg7ArFVj7lqDx0ieO5Yxtd
         FmnADtSs9EW9F8TzNgko0d4MZTEPReWjbqotJ73vSK7y4TddtUSLoZXMealtZJgMurud
         UbDZ0asZj22U/D3BuNxjKua8CEEGmr6GTJIYOmMz0nvnRPfz1Z/+NPJQkKB0deEITlb9
         DnBlpLca8Q7JbgmbGObIjLgs5UPoFcWJEmmnX+jN/R91aacj7hWhQaxFFnVu4VjorQZK
         rslw==
X-Gm-Message-State: AOAM531aVZm6omimD7GZNKdaxZNtOMtyrL+1Lu3W849bWkofiz9C1Vv4
        R5ByKvS/IU3n7UxUGUW0vJKDkA0Jq36wWvDw0VdGItFbcpcxR9bul57jHohWTY3Zu7BKGprZW0k
        G8GerY82o+1VQruRAzkTZbsTZqn+9fVyoe6wf/JjlOK1D
X-Received: by 2002:a05:651c:514:: with SMTP id o20mr12913542ljp.393.1636733279675;
        Fri, 12 Nov 2021 08:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWCaxvqrKZfXTzK33jH1qs/SwKYGykn9EvUNEw9zc05xN/7twJHYsJy+9LO5UTbGQ3c48xXQ==
X-Received: by 2002:a05:651c:514:: with SMTP id o20mr12913496ljp.393.1636733279409;
        Fri, 12 Nov 2021 08:07:59 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x7sm603353lfa.203.2021.11.12.08.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 08:07:58 -0800 (PST)
Message-ID: <2af4073a-a5d9-e878-d622-b757b082359b@canonical.com>
Date:   Fri, 12 Nov 2021 17:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
Content-Language: en-US
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-8-luca@lucaceresoli.net>
 <0f278280-27d0-4d43-8065-76ec1f7c19b5@roeck-us.net>
 <7584d85a-5050-2b9d-1648-7d3bed2d10ea@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <7584d85a-5050-2b9d-1648-7d3bed2d10ea@lucaceresoli.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/2021 17:02, Luca Ceresoli wrote:
> Hi Guenter,
> 
> On 12/11/21 15:57, Guenter Roeck wrote:
>> On 11/11/21 2:58 PM, Luca Ceresoli wrote:
>>> Add a simple driver to support the watchdog embedded in the Maxim
>>> MAX77714
>>> PMIC.
>>>
>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>>
>>
>> I just realized that this is effectively a rewrite of
>> drivers/watchdog/max77620_wdt.c.
>> The only difference I can see is is the register offsets (0x91 and 0x92
>> vs. 1 and 2) and some implementation details. Please add support for this
>> watchdog to the other driver or provide a _really_ good reason why that
>> is not possible.
> 
> I initially started developing MAX77714 watchdog support as an addition
> to max77620_wdt.c as the procedures look identical at least for the
> basic features.
> 
> But the register content seems completely different. Here are the notes
> I took at that time:
> 
> -------------------------8<-------------------------
> 
> MAX77620 has reg ONOFFCNFG1  at 0x41, ONOFFCNFG2  at 0x42.
> MAX77714 has reg CNFG1_ONOFF at 0x93, CNFG2_ONOFF at 0x94.
> OK, we can handle this with a register indirection table, indexed by
> chip model.
> 
> MAX77620 has MAX77620_REG_FPS_CFG0 register.
> On MAX77714 I was unable to find any such register (I haven't looked at
> FPS in detail though).
> OK, we can handle this with some if()s or entirely disable PM on the
> 77714 until anybody cares.
> 
> MAX77620 ONOFFCNFG1  has SFT_RST in bit 7.
> MAX77714 CNFG1_ONOFF has SFT_RST is bit 6.
> Uhm, should we have a _bit_ indirection table in addition to the
> _register_ indirection table?
> 
> MAX77620 ONOFFCNFG2  bit 5 is SLP_LPM_MSK, involved in FPS.
> MAX77620 ONOFFCNFG2  bit 6 is WD_RTS_WK, configures the watchdog timer.
> MAX77714 CNFG2_ONOFF bit 5 is WD_RTS_WK, configures the watchdog timer.
> On MAX77714 I haven't found SLP_LPM_MSK.
> 
> MAX77620 has 6 CID registers with "ES version" in CID5.
> MAX77714 has 5 CID registers with "DEVICE id" in CID3.
> CID registers would be useful to get the chip model directly from the
> chip, if only they had the same structure.
> 
> Almost all of the registers I have been looking into have similar
> differences.
> 
> -------------------------8<-------------------------
> 
> When I started adding indirection tables the driver started growing
> bigger and uglier, and that little simple driver started being big and
> complex. So I opted to add a new driver.
> 

The register offset differences are trivial and we do it in several
drivers. Also in rtc-max77686 used by you here.
Lack of features as well - just have a variant/driver data which defines
certain features (true/false) or quirk bits (see s3c2410_wdt).

The second driver - s3c2410_wdt - also customizes the bits.

Therefore if the generic device operating configuration is similar (same
generic control flow) and differences are in bits and offsets, then it
should be one driver.

Best regards,
Krzysztof
