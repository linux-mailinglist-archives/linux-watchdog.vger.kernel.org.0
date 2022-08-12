Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAB5E591728
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Aug 2022 00:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236273AbiHLWIY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Aug 2022 18:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbiHLWIX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Aug 2022 18:08:23 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04EEB5170
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Aug 2022 15:08:21 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id 17so1830413plj.10
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Aug 2022 15:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc;
        bh=DnFZ/aMevbBbKV2tlF1skYamdNiR0fjKJ8EiIPjRZfo=;
        b=J8EIezh1AVtpgUvT/5LLoEwc4GIj4zKOaa2J/abmCbvG7egFkTKmTmkwducVFqp1XD
         Uc3GUtl6cCYrfBNBDv2hLBCkY+qyp+C9ZrCd19gZClKNQox8Z0C5xyW70cYMPpQYuWQo
         +ZQAvXvmvnDlnoLJ2Vhc7X0HGZzUPfEBrUl8jz8IiTwxlEAa209Mg00vXUfIz/4RZ3UH
         hg4UMtUa20EVL9usPhMkD2XCdJJC4nBsCMDMBmxzyVQ0YVRlm8CHJ5YuMyp+V/fUoy6q
         43TQ7Y2+mKGAKtbR8g+joo3qFUqPquexYMZifpecSQvqMEuTlV6LXEh5M5PswJg8CrBT
         f80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc;
        bh=DnFZ/aMevbBbKV2tlF1skYamdNiR0fjKJ8EiIPjRZfo=;
        b=R6B/2FTX4LcGtIX7iFO8dEE3xkSXPO//to9eQ/stYYPGszbR+HtORNXLYhBj+yF6Cy
         O1gS7w45gf0n8B/TRfU9wak+qg/MZmfA+aCHaC81rLC3eefcCtVhorOaP4jSnq5aFd8k
         VjBH4t9c/Wh8UjUCYrj3Xv4chm1y6AJedYCqKSpwAhoPILwlxRc6xIkVqXKKpuL+KRoS
         Tc/9M6YV9/3FiA/YwRa/G+wFXf/xyfg/a5+pJliryu3pr2vLHa1Dah3xHJN7CxyIgkhI
         fG0fju/pqBli78N50QjGrWUrwXzQqRWYKnI1IQ1NfPTBh861BFFmpDRn1/XuqVZzukh3
         CVvg==
X-Gm-Message-State: ACgBeo2Te/GgGyuMvLk1KeLZdfvX7omNA8GQT+ZP2Mauqfo2p3FjTIwX
        A0HMZRfT3ngCrlAhsGPd3TvTJeuqHjg=
X-Google-Smtp-Source: AA6agR4DJ2+86p0msVJFdLov6PFj3y33MuNBfn/XyO4l0ewPk1oJzM8ixVfdOQ/6QPtNAAZuekpn5Q==
X-Received: by 2002:a17:90b:390c:b0:1f5:8859:ac76 with SMTP id ob12-20020a17090b390c00b001f58859ac76mr6086985pjb.137.1660342100983;
        Fri, 12 Aug 2022 15:08:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902b18e00b0016d231e366fsm2240530plr.59.2022.08.12.15.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 15:08:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <20569aac-b76b-0aa9-e716-0030fc37f265@roeck-us.net>
Date:   Fri, 12 Aug 2022 15:08:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Kegl Rohit <keglrohit@gmail.com>, linux-watchdog@vger.kernel.org
References: <CAMeyCbiVVTmpV8pazAPLtew0yQSYeb5ykeHzCs_A=nBUK7d1bg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: rn5t618_wdt: WATCHDOG_NOWAYOUT not working
In-Reply-To: <CAMeyCbiVVTmpV8pazAPLtew0yQSYeb5ykeHzCs_A=nBUK7d1bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/12/22 02:56, Kegl Rohit wrote:
> Hello!
> 
> Our board uses the RN5T567 as /dev/watchdog source via i2c communication.
> RN5T567 is using the rn5t618_wdt.c driver
> 
> Our kernel has CONFIG_WATCHDOG_NOWAYOUT=y enabled
> 
> # Starting the wdt works as expected
> echo -n '1' > /dev/watchdog
> 
> # Stopping the wdt works as expected no reboot will be issued
> echo -n 'V' > /dev/watchdog
> 
> # Starting the wdt again will enable the wdt again
> # BUT while the wdt is triggered every second the system reboots
> while true; do echo -n '1' > /dev/watchdog; sleep 1; done
> 
> Digging deeper into the issue I could find out that the remap is
> initialized to cache the register accesses RN5T618_WATCHDOG (0x0b) and
> RN5T618_PWRIRQ (0x13).
> 
> So I expect that because of this caching the IRQ status bit was never reset.
> The status register must not be cached because its set by the RN5T567.
> Also it is not ideal to cache the access to the watchdog register
> which resets the counter via read write cycle.
> 
> debugfs shows the regmap setting for these registers:
> [root@imx7d /sys/kernel/debug]# cat regmap/0-0033/access
> // third column means volatile yes or no
> …
> 0b: y y n n
> …
> 13: y y n n
> 
> After marking these registers volatile, stopping the wdt and starting
> again seems to work.
> 
> Furthermore it is not necessary to do a RN5T618_WATCHDOG read AND
> write cycle to reset the wdt counter.
> The source code states:
> /* The counter is restarted after a R/W access to watchdog register */
> 
> The RN5T567 datasheet states:
> “The count value of watchdog timer is cleared by accessing (R/W) to
> this register.”
> 
> Tests showed that a single read is enough. I did not check other chip
> variants which use the same driver.
> 
> In my opinion a write cycle is even dangerous if there is some strange
> situation and the write cycle disables the wdt or changes the wdt
> settings stored in this register.
> 
> I still don't know why the irq status bit is cleared on every ping()
> but I kept it there.
> Attached is my patch tested with RN5T567.

It is sent as attachment and thus unusable. In addition to that, it is
not a proper patch.

> Is the rn5t618_wdt.c driver maintained? Strange that such issue was
> never noticed.

I'd rather assume that your usage pattern is one that no one ever tried
before because it is quite unusual. Why enable NOWAYOUT just to violate
it continuously ?

Anyway, I think you are a bit off track here.

The register 0x13 should probably be volatile. However, register 0x0b
is not updated by the chip and thus does not need to be volatile.

Replacing the various regmap_update_bits() with regmap_write() is just
papering over the problem. To force the write to the chip even if nothing
changed, regmap_write_bits() should be used instead of regmap_update_bits()
where appropriate.
That is probably also the core of the problem: rn5t618_wdt_start() calls
regmap_update_bits(). Since no bit was changed, there is actually no write
to the chip. Ultimately this causes a timeout since the watchdog is never
stopped and the counter is never reset. To avoid that and to make
sure that the counter is reset, it is probably sufficient to replace the
regmap_update_bits() to enable the watchdog with regmap_write_bits().

The read operation in rn5t618_wdt_ping() doesn't really do anything
because the register value is cached. The read only happens to have
a value to write. I can not follow your logic that that write could
somehow be dangerous. It writes the value that is expected for the
register. There is nothing dangerous about it. If there was indeed
a problem, you would have to provide specifics; you can not just make
such a claim without basis in fact.

The interrupt status register at 0x13 should probably be declared volatile
to avoid "loss" of interrupt status for other drivers. Clearing the interrupt
bit is only necessary to ensure that an expired interrupt is caught if the
'ping' comes late. The same is true for the start function. In normal operation
it should not be needed.

Either case, if you want your code to be considered, you'll have to split
it into two patches, one for mfd and one for watchdog, and you'll have to submit
proper patches as outlined in Documentation/process/submitting-patches.rst.

Thanks,
Guenter
