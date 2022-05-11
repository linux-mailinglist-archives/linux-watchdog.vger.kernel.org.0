Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD1C522BCF
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 May 2022 07:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbiEKFiY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 May 2022 01:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241935AbiEKFiV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 May 2022 01:38:21 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B863C4A0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 22:38:19 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n8so866086plh.1
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 22:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SEXbM79aMpwBO+zlSXHFOKrTHYdv3ZYxP3jk3lbMm1Y=;
        b=zrgTNjogyOw4X+zVebxxaybfOc4s05F7gAEWDEx9ZLyXe7lOdUNm3oKXs65NrBCwPd
         /k/nZ/99rkv77qdZoO2D4jLc/jc9fqY7qbckVzEpC1L3qaly1BT6qOawyf7twD+7RceQ
         NlXjQc7kul++iFpW+MIrPdDZaDbUEamVmE0xkihBf5GvjWDYY95GYv9Bka2P6f5ABzuT
         mNx6sQj0TuKOqjvchrQAfBqJNtHuUuKG5bJJhTDpPRP7swS6x825qZgyxpBgoX6hjxWN
         +Pa9bAtBFs2/L8tSl3LDzJtLS+NdVPmwPnTPYMcwlch7hLOitycxHB3S5cWDKvjpSXVJ
         auHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SEXbM79aMpwBO+zlSXHFOKrTHYdv3ZYxP3jk3lbMm1Y=;
        b=rcYjBMhk9LpOg9HmsHeJPC1a9dJgm64aMb3qZf/3Fh08v5MlH7VcDNwNiMsfmm8MlH
         Ubxzt8AQsWXOQ6rvD9E6ZhpNymJVJCF/RN59X2H6/Agsg89+RGaoP5Qe1r3SRSPWJLlQ
         PuUVIsc2iXM9tyLo/KHrSdGzMsGhPz7/1B2wrTo1+MWNQBiyuqPDueoBhdzH6lqSvBhy
         ZCUKhyDHASa6GuL3ORUPiCPSuCZ+RxjC0OvO7N8HctJcNqHkHIZrn2k63VjXKMYvjQeX
         RtyMgMrggd1DzvBM0vVY/Hl1mnJMyn+lF6NC3BucZvCHHV5SR/6H3z160/jjCDuT+sRG
         VJcg==
X-Gm-Message-State: AOAM5303nTWDwqGGl6oA+fR6SCjw1WB5gRn33+93zVvk1s+zie6u+t0M
        3j3jGJHQTbwcDKtNbweo3EhBRw==
X-Google-Smtp-Source: ABdhPJyfjqXlpkuE7sI2D+xtwtHdknaRDBnVepRwTAUvjnSDRgdpSNTGjKliWkGxIrQPEC0DY3+XRA==
X-Received: by 2002:a17:902:f652:b0:156:701b:9a2a with SMTP id m18-20020a170902f65200b00156701b9a2amr23726071plg.14.1652247499130;
        Tue, 10 May 2022 22:38:19 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id h27-20020aa796db000000b0050dc76281bdsm549163pfq.151.2022.05.10.22.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 22:38:18 -0700 (PDT)
Message-ID: <c3d75681-5c5a-17bc-2f09-c8f40f570b6d@ozlabs.ru>
Date:   Wed, 11 May 2022 15:38:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC v2 0/2] Add driver for PAPR watchdog timers
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220509174357.5448-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

You should cc: linuxppc-dev@lists.ozlabs.org this. Thanks,

On 5/10/22 03:43, Scott Cheloha wrote:
> This second RFC incorporates feedback from the previous RFC:
> 
> https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
> 
> v2 changes of note:
> 
> - Add a firmware feature flag for the H_WATCHDOG feature,
>    FW_FEATURE_WATCHDOG.
> 
> - Register a platform_device for the first watchdog timer during a
>    pseries initcall if we have FW_FEATURE_WATCHDOG.  Use id zero, as
>    there could be more than one timer in the future.
> 
> - Alphabetize Makefile changes.
> 
> - Add missing copyright information to pseries-wdt.c.
> 
> - Add an 'action' module parameter that configures how the guest is
>    terminated on watchdog expiration.
> 
> - Use dev_*() for logging critical errors instead of pr_*().
> 
> - Handle the H_NOOP case when trying to stop the watchdog.  If the
>    given watchdog is not actually running, H_WATCHDOG returns H_NOOP.
>    This is harmless, so we should treat it as a success.
> 
> - We don't need pseries_wdt_remove() at all.
> 
> - Check watchdog_active() before stopping/starting the timer across
>    suspend/resume.
> 
> - Consolidate all code from pseries_wdt_module_init() into
>    pseries_wdt_probe().  We can then use module_platform_driver().
> 
> I have one lingering question:
> 
> - The pseries-wdt module is not "automatically" loaded during boot.
> 
>    When I do
> 
> 	# modprobe pseries-wdt
> 
>    the driver attaches to the platform bus as expected and the
>    /dev/watchdog* devices for the pseries-wdt.0 platform device
>    are created.
> 
>    I was under the impression that driver/device matching for
>    the platform bus was simple string comparison.
> 
>    ... what am I doing wrong?  Is this expected behavior?  Do
>    I need to do additional configuration to get the module to
>    load automatically at boot time?
> 

-- 
Alexey
