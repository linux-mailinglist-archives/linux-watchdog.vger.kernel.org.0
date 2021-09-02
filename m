Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940833FEF1F
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Sep 2021 16:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345465AbhIBOGT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 10:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345459AbhIBOGS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 10:06:18 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE5DC061575
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Sep 2021 07:05:18 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id q39so2629053oiw.12
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Sep 2021 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tAHCvmHcSH3m/SZaoMP/0L4bp5v38r0l2BpP5UIOqfQ=;
        b=PCosjpN9gcCwkfzjfPvXlyXQsgrPVLlGAZ0cxw6bdXbiljiDrqLNr62ZbkvdEhyNcM
         GXjWUtTtfJl7TSDDCNi730vV57UboxvKgpQ8odPBy502ECd1u5e/9KzaO5RAkEe51TJD
         Y1PhWyiznBBY3Elw6rkTVNWnqR/ciGU/FCtccmnLO0ObdIi0h/TeB0IHC3R6geY0P9UI
         inI3YbHhKcJk3ykNslCmXQxtA89bSsY1gh3e+RTs1izfWEt8MXmXI65jX6v9tsrk5QEJ
         ui1hevRV6aaVE/sL0/J8PfFt21M6gH4xGJpb1o+glqagzA1vIC7P+gCOoogBJIwvgdkZ
         ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tAHCvmHcSH3m/SZaoMP/0L4bp5v38r0l2BpP5UIOqfQ=;
        b=uBJmO8vBOuMS2U3K3YBm9lB3J4Lx5JgsknUNrBETpDBaz1VXy6fwXiPdIXEyvfbj3q
         UgyR3qhEcSEUiMv3vHEwoWYagZ3SEXnA/Gtbee0PPxAq47hHSiuBztNuVuRkSoe4Bw5s
         SgDgwTNOpHpch7mM6xfGwxX4o9pBZ5BZnCsgxkXfl+vPiZi4Y/bwiUEfBWcfx59VGvm7
         ul1Edm0Y6hJld2ABtMVRECNGwkLkqDmXpzVHoOPmAOHwV9TSgGEMU5yeluiIq8imuLBZ
         Dtg12iCXc5YwFCtAN8/qxk1Rd2f6wZSP82gKdC1JlUemsL1oPnAPKFPvykgPlamKy3XL
         yUwA==
X-Gm-Message-State: AOAM530BX2sHOT6lPC4Fcg5dpHb/0mMsz7S0xDUG6CGpC7Aasdq2WN+r
        1B3YlnodRNPLnymyDwtUH8GYJxAJnU4=
X-Google-Smtp-Source: ABdhPJyb2jHkf4qq3VBXKZYSisQ/mYQL5sdsysVzcl9utjMqjOrXIHV/7dC+nBKaXs2lFK0hE0xgvg==
X-Received: by 2002:aca:b80b:: with SMTP id i11mr2334901oif.26.1630591517818;
        Thu, 02 Sep 2021 07:05:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k8sm387646oom.20.2021.09.02.07.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 07:05:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3] watchdog: Add hrtimer-based pretimeout feature
To:     Jiri Slaby <jirislaby@kernel.org>,
        Curtis Klein <curtis.klein@hpe.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
 <67d601c9-8f95-cb10-40df-4d962ec6f9ba@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7fdd262e-84fb-0c34-baa9-162130f1e109@roeck-us.net>
Date:   Thu, 2 Sep 2021 07:05:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <67d601c9-8f95-cb10-40df-4d962ec6f9ba@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/1/21 11:55 PM, Jiri Slaby wrote:
> On 03. 02. 21, 21:11, Curtis Klein wrote:
>> This adds the option to use a hrtimer to generate a watchdog pretimeout
>> event for hardware watchdogs that do not natively support watchdog
>> pretimeouts.
>>
>> With this enabled, all watchdogs will appear to have pretimeout support
>> in userspace. If no pretimeout value is set, there will be no change in
>> the watchdog's behavior.
> 
> Hi,
> 
> on my Dell Latitude 7280, CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y causes all reboot, kexec, suspend to panic. Disabling that option makes it all work again. Provided it happens very late in the process, I don't know how to grab some logs...
> 
> Any ideas?
> 

AFAICS the timer does not stop on reboot. I think we'll need to augment the code
to do that.

Guenter

> ...
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -73,6 +73,14 @@ config WATCHDOG_SYSFS
>>         Say Y here if you want to enable watchdog device status read through
>>         sysfs attributes.
>> +config WATCHDOG_HRTIMER_PRETIMEOUT
>> +    bool "Enable watchdog hrtimer-based pretimeouts"
>> +    help
>> +      Enable this if you want to use a hrtimer timer based pretimeout for
>> +      watchdogs that do not natively support pretimeout support. Be aware
>> +      that because this pretimeout functionality uses hrtimers, it may not
>> +      be able to fire before the actual watchdog fires in some situations.
> 
> thanks,

