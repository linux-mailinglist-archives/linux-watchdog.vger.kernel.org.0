Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8CDD43D304
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 22:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240554AbhJ0Umg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 16:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235613AbhJ0Umg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 16:42:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406D5C061570
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 13:40:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bq11so8771398lfb.10
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=bPDGMxcrYahsroetOlB/6LQFQ3wCyay4FWwNAP0nHzs=;
        b=HSA4zjKYo184O/oGxYxS7/oNDCA3v7SUPRmtYTtfuLqh62fflrHUcZxPAclYTzGs2G
         x3hLMLa8Bcbc0RF+oXgn8CbURfvyoMWwt/N7LRtYK/MjJUpR0SD8dkvrp+BuAxl5E5kl
         CL0HHtNctmk4x3nwrF1It4sy5RppVaFvbgGqbGePM3l3NCrZyFLsCaoqkZgUQDoY8Bfr
         SRwITX/VKwBcqknbf8OKNY2tTZyqYbO3ygIWblaiB2EJU8U1R+NHYtjSFaI1Q/HaOFPo
         4scctRfjlj84jAzgFUsGWIpaqM/zZyhFoyOPjv0zrfFpJIVQOTnelFSbiiX4xevAwQ3v
         qkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bPDGMxcrYahsroetOlB/6LQFQ3wCyay4FWwNAP0nHzs=;
        b=mCDJpqVm4FuAfB50vPSeA0Zkr7MTt2EokiQBNS6cFo53d8fTalh+513DJDRH1MWiq4
         ctHpVmaKk/gMWjcTi5JYAE+z6hs0ugVaHxnS2IK5IEBIK+I7jyLaTIw86GkzMZ3TacOr
         Q7Wpgm3DUMkOpV16YCnTKEycSIiKKJRuY0r51x4VerepLUKs9qen5+agqJEiylpvTUe3
         nTPrXnPWE2mxQdKgPEqWj8nz7fQ8T9U9XOQAgi5/Dhc0FejE/Xqtdi43W/35BfW253kK
         Py8QRo8N54pgTruBP5gcQ5rc0n6PjDDAKUwc9tdlmX1dE6ibAVpvu724v3ETbBAEDjKL
         mkzg==
X-Gm-Message-State: AOAM5323X1i29YBWDM9F639mfkinDqPX7GDi93pOIeD46RhFRxt1viiv
        16cg5BaLrdCvbCcMg7ynfst5MUci2lU=
X-Google-Smtp-Source: ABdhPJxySo/K2Y3yWsdUf4FAUXSwGkfWlDVXMbg+kYfp9XTMg1MZOtM7p7hn9Svdd6gVDam2aTycRg==
X-Received: by 2002:a05:6512:3f0e:: with SMTP id y14mr31881603lfa.505.1635367208561;
        Wed, 27 Oct 2021 13:40:08 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id bq23sm95293lfb.262.2021.10.27.13.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 13:40:08 -0700 (PDT)
Message-ID: <fe1b90d7-4898-694b-02ae-97baa3377206@gmail.com>
Date:   Wed, 27 Oct 2021 22:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH] watchdog: bcm63xx_wdt: fix fallthrough warning
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211027123135.27458-1-zajec5@gmail.com>
 <20211027173114.GA2327649@roeck-us.net>
 <7bb51f0f-6ba1-d91a-6e1c-7c7c4f5f3cbc@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <7bb51f0f-6ba1-d91a-6e1c-7c7c4f5f3cbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 27.10.2021 19:39, Florian Fainelli wrote:
> On 10/27/21 10:31 AM, Guenter Roeck wrote:
>> On Wed, Oct 27, 2021 at 02:31:35PM +0200, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This fixes:
>>> drivers/watchdog/bcm63xx_wdt.c: In function 'bcm63xx_wdt_ioctl':
>>> drivers/watchdog/bcm63xx_wdt.c:208:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>
>> [reluctantly]
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> ... because the driver should really be converted to use the watchdog subsystem,
>> by someone with the necessary hardware to test it.
> 
> The driver should ideally be removed and we should use bcm7038_wdt.c
> moving forward. Rafal, is this something you can try on 4908?

I wasn't sure if I should proceed with bcm63xx_wdt.c or bcm7038_wdt.c so
I chose 63xx. Possibly a bad decision, I'm not sure.

I've already bcm63xx_wdt.c changes developed locally to support BCM4908.
I just need to add Documentation/dt-bindings/ part. I'll do that
tomorrow. Then you can let me know if that's acceptable or should I
refactor my changes.
