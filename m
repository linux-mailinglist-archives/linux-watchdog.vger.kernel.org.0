Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F89610B0D
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Oct 2022 09:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJ1HMJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Oct 2022 03:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiJ1HMI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Oct 2022 03:12:08 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1944318DD40
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Oct 2022 00:12:07 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 16-20020a9d0490000000b0066938311495so2553213otm.4
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Oct 2022 00:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=N49AnWCT5FBwNESqXZCh2X+01NeNvUzY2r6lHBDpALs=;
        b=JuJ18XkwyyRhM6RDQxLeVcYkVL/R/btM52N5tm4Iyrbfjwf+8RdEnS/varEPiqK2c9
         XKZhMlBZJWSWmG0axqcNn2i002pXjqTlPuNeRq7mcchxq9XgZufIyU+4/j6nzaZjGfCc
         hU1WFcpwmJXBbDcfZm13nJOoXPf7RbQIxq0+X+IsJOEzQhsqYeq9ZRlb59FGNnFIGM8G
         4R0gnDWmnrzHWamgM5ymd0n+3lFEuC3lE2p65cP6ar4ryuj8+NACy7is+wW+AbJhzzT/
         qngHPfLbBNzNdk9M2xtsP89rrsQ+CjMlu3UcD+CPuzZ5T+aqtDSwtOhPK/rw0/39JvF5
         AyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N49AnWCT5FBwNESqXZCh2X+01NeNvUzY2r6lHBDpALs=;
        b=ilWUyl8pePdbADXxxFqJf3Qh0kSFpCZFXFTwYLwRt/B0JEYl2IeGwaTNK6/zl4CC3I
         iBqE2vAeF6HRXozrv/zCWaoQN/0GYhAa4U+bmT5JxmDTlupiDkKR/MKvhm3E1DiTZzQK
         3ApSlFyoluPyxYoR8Nhq8URjPERGK2wCrCeDgCiTG1Bf/Oj4XglAScFhU8fMBmF9Puni
         PZcFAID6w71G5mz4fFjfxG/zoTEiirgM30w10TaCTn0mAXIwMFUBcXVqC8DsufmF8UzK
         5XLQmOBb4dyRFRd6WNzBtY8BGXmWDSEH6b5WHXjU9QmaKjvgiFpORP36ATFvDxehaVdq
         eHgw==
X-Gm-Message-State: ACrzQf0SpGIoS7Ds/kXrz1oGPpIWM0VdUHdepfcaiBw/KmdC3LdF7Vb5
        3VmnUJsdjxEcXP5uyGJtTNvSGJYUJEM=
X-Google-Smtp-Source: AMsMyM4N4uRqA6U2pfgoCnFHXW7GbYAQBqSlcLF0BfB9dz/lR+C9SgnEzQw2hMQR1dRpxF0xK5nZPQ==
X-Received: by 2002:a05:6830:4493:b0:661:dfc2:67d6 with SMTP id r19-20020a056830449300b00661dfc267d6mr25219334otv.75.1666941126377;
        Fri, 28 Oct 2022 00:12:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q15-20020a9d664f000000b0066101e9dccdsm1398476otm.45.2022.10.28.00.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 00:12:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad3437c6-101a-e3a5-e8ae-9ca749e734ce@roeck-us.net>
Date:   Fri, 28 Oct 2022 00:12:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not
 already running
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     berrange@redhat.com, linux-watchdog@vger.kernel.org
References: <20221028062750.45451-1-mika.westerberg@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221028062750.45451-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/27/22 23:27, Mika Westerberg wrote:
> Daniel reported that the commit 1ae3e78c0820 ("watchdog: iTCO_wdt: No
> need to stop the timer in probe") makes QEMU implementation of the iTCO
> watchdog not to trigger reboot anymore when NO_REBOOT flag is initially
> cleared using this option (in QEMU command line):
> 
>    -global ICH9-LPC.noreboot=false
> 
> The problem with the commit is that it left the unconditional setting of
> NO_REBOOT that is not cleared anymore when the kernel keeps pinging the
> watchdog (as opposed to the previous code that called iTCO_wdt_stop()
> that cleared it).
> 
> Fix this so that we only set NO_REBOOT if the watchdog was not initially
> running.
> 
> Fixes: 1ae3e78c0820 ("watchdog: iTCO_wdt: No need to stop the timer in probe")
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Hi,
> 
> I tested this with the command line Daniel provided:
> 
>        -watchdog-action poweroff \
>        -global ICH9-LPC.noreboot=false
> 
> With the patch QEMU shuts down after ~60s and without it keeps running.
> 
>   drivers/watchdog/iTCO_wdt.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 34693f11385f..e937b4dd28be 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -423,14 +423,18 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
>   	return time_left;
>   }
>   
> -static void iTCO_wdt_set_running(struct iTCO_wdt_private *p)
> +/* Returns true if the watchdog was running */
> +static bool iTCO_wdt_set_running(struct iTCO_wdt_private *p)
>   {
>   	u16 val;
>   
> -	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
> +	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is enabled */
>   	val = inw(TCO1_CNT(p));
> -	if (!(val & BIT(11)))
> +	if (!(val & BIT(11))) {
>   		set_bit(WDOG_HW_RUNNING, &p->wddev.status);
> +		return true;
> +	}
> +	return false;
>   }
>   
>   /*
> @@ -518,9 +522,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>   		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
>   	}
>   
> -	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
> -	p->update_no_reboot_bit(p->no_reboot_priv, true);
> -
>   	if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
>   		/*
>   		 * Bit 13: TCO_EN -> 0
> @@ -572,7 +573,13 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>   	watchdog_set_drvdata(&p->wddev, p);
>   	platform_set_drvdata(pdev, p);
>   
> -	iTCO_wdt_set_running(p);
> +	if (!iTCO_wdt_set_running(p)) {
> +		/*
> +		 * If the watchdog was not running set NO_REBOOT now to
> +		 * prevent later reboots.
> +		 */
> +		p->update_no_reboot_bit(p->no_reboot_priv, true);
> +	}
>   
>   	/* Check that the heartbeat value is within it's range;
>   	   if not reset to the default */

