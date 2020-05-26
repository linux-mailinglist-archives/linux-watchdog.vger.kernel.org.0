Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23681CD3DA
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 May 2020 10:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgEKI2I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 May 2020 04:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbgEKI2H (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 May 2020 04:28:07 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E005EC061A0C
        for <linux-watchdog@vger.kernel.org>; Mon, 11 May 2020 01:28:06 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 188so6739385lfa.10
        for <linux-watchdog@vger.kernel.org>; Mon, 11 May 2020 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xRvOsGODr2gBty44WMLBkyLF05Kazw7eweqK6vwx6G8=;
        b=NMwUyTJEcbx88njWIumKBmdXEPVUEg0mDKK5uVHZYtRcI2EsMUGm4RKTg3v8t+HImQ
         Dhe486gV9U3C4ZEk4KudoDojO6BjvFuqPrSrFdE4okuodgo/vKBO7N4q5xWUO/NMudOQ
         DTuEFJkPsULwl23xN7LXDN9fsCueSRXI+9f+sBdEpJRqHpcQGpC4PLuWVfhfKfb/7sEq
         uo3QClFkWonGW7vE54sEwFf8dNmqJ2+lehPnKgvPNk46g4jFIuFyFTqgzRFS2tMjLNth
         /shvpXWyz143uoEV7N4gcySD//s/ZbmhSw9s7vO1MyDWWtv9vcxSQ02NXPMObmMJpMiz
         BKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xRvOsGODr2gBty44WMLBkyLF05Kazw7eweqK6vwx6G8=;
        b=myymYqDwCF5iskDKpr+fvTDeiQcy+JaHtaVi0Cj1S/wTOoyt7V8LjPqmy28VVsaFTW
         3uJmAV/q50278GmkWElYXlgqs2Z1KV+6eYQAPcDHX3es2yC5QbJMK3OtiyIqB4FlqgUL
         5Awq9HUv7YRgW4sWtZlm3nGWVws4zN1t57NvFIZRGC8FdGcZWLwzOwVfQ9Z1E5SbHNMG
         ok2Kk7JxWL8DtMu4AnTO+7d36YBsY0fpGk2tDelJgwdFvpxJgZekpmsTlWbsWjfeAzBB
         m0pc4PPaRLNgPgulffDVP4GiLxKhHlMOCxkRK+c/24dQz+saZ7KY0Szgv410ehbQSFYj
         D1DQ==
X-Gm-Message-State: AOAM530AbtLoljCeeU3rMCgK1Is6K7ol92wmfL28RA4qE6dJqELi89oh
        IO4C5IfxP9vUwG4FtTPN5R2aZQ==
X-Google-Smtp-Source: ABdhPJy9RJ6KQf/3Kl5eqQg+JUSwUL3ldNqhxlgS3bNEYoMSUpVKEawpvAY6S5rxYHjoPhvrWBixXw==
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr10087337lfn.183.1589185685335;
        Mon, 11 May 2020 01:28:05 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:482:2677:ba:b682:3c24:214e? ([2a00:1fa0:482:2677:ba:b682:3c24:214e])
        by smtp.gmail.com with ESMTPSA id m13sm10297061lfk.12.2020.05.11.01.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 01:28:04 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] dt-bindings: watchdog: dw-wdt: Support devices
 with asynch clocks
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-mips@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
 <20200510105807.880-3-Sergey.Semin@baikalelectronics.ru>
 <f065ff5f-af86-4293-b208-766e41699436@cogentembedded.com>
Message-ID: <477b9f75-485c-3208-b58c-56a5c13e15bb@cogentembedded.com>
Date:   Mon, 11 May 2020 11:28:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f065ff5f-af86-4293-b208-766e41699436@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11.05.2020 11:25, Sergei Shtylyov wrote:

>> DW Watchdog IP core can be synthesised with asynchronous timer/APB
>> clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
>> a separate clock signal is supposed to be used to feed watchdog timer
>> and APB interface of the device. Lets along with the watchdog timer
>                                         ^ verb missing? or comma?

    Oh, and probably "Let's" too. :-)

> 
>> reference clock expect to have the optional APB3 bu interface clock
>> sepcified in a DW WDT dt node.
> 
>     Specified.
> 
>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Cc: Paul Burton <paulburton@kernel.org>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: linux-mips@vger.kernel.org
> [...]

MBR, Sergei
