Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C293DC130
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jul 2021 00:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhG3WjK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 18:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbhG3WjK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 18:39:10 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D548CC06175F;
        Fri, 30 Jul 2021 15:39:03 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id o20so15229838oiw.12;
        Fri, 30 Jul 2021 15:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kHsJiQapAD/4QVzp2UfVWPI1mPGl8hWS1HwKG0EoffI=;
        b=EknXuDek8jF0zTx1Y6OGTJgCoMEk2IHb0z2K9LcvMEFrTwZafNc4Epex8TgdgFHEJZ
         8YU1LCLDv/YS9tpv58B29IyQ2sUIATKtitdjroBIVHnxCv7Gy+Q1ex/B+ezdvTFJ+OXv
         LBsp/720y8GMxzZ0VQXEFJoBmCyBgeX+RADeukUeqkr4YISjb/nRaO7jPvmcRMcNygAS
         ZDpfkhI6YE6FgMwDABZWkwdAqvgd/9MMIG7I34el74iwm/hY4JG1VXb4A15LTcM56s6M
         dl1p+K7sv607ACwtL7NqmGMLLAgpTcAgAAU1PJA1gauZP6hwABsHLy3vFPpmecJZJ8dz
         +IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kHsJiQapAD/4QVzp2UfVWPI1mPGl8hWS1HwKG0EoffI=;
        b=INDxjFki8P0kui09iaia2mrXEkAcUenauYy7PBy/IoLy3IYpvfRBhBj1SPJrYrx1uU
         SvUR1NsV6o5Bc4pEFXAIbgRYuq0DHBonfvlapAOKRMtZoIPFIZT6oHPIMUmw+8pj7aH0
         qf9Flx/0PuwtETDNVtzseKZBIADvfkkPr3eXd3UGwEpGKnCpeVyEcQrwmFkn9qJ3iRmF
         Au5xyUOzA0VeZZSXYJ1T/LXcyn01H1qnmNiR8s0uY5WT6SXJG/TPeeNTlRVRj79ypUs6
         GkFN6cmlVzc5zaPtzFChlTBRRvonX9h+MJqRgyFurLTV2yiMjpEgXmRWrUrsTeTOpHck
         i23Q==
X-Gm-Message-State: AOAM531+HxCYgaPI5tWWC1LKoe9aH61ZClsa7u0EVwWKCW9b2j1iBGt5
        ADYQLbUFg/f2iL024e5A2Ds=
X-Google-Smtp-Source: ABdhPJwRoP+fyy7PhBPevGqhOuI02Ixpjrz7IDxiDwyq3nQDQ2Ni+sY22MZpTPdHBwEw7tstRuOF8A==
X-Received: by 2002:a54:4d8f:: with SMTP id y15mr3682712oix.32.1627684743299;
        Fri, 30 Jul 2021 15:39:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i20sm463729ook.12.2021.07.30.15.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 15:39:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
References: <fe8cf65f-f949-9326-8f32-fda7134c8da6@siemens.com>
 <211cd54b-29b4-e58a-341b-beffc05cfe85@roeck-us.net>
 <def0c2e9-e035-7ffc-3216-27f461555ae5@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: Respect handle_boot_enabled when setting last
 last_hw_keepalive
Message-ID: <ccbd43d8-af29-2a5d-991f-def7f7adec40@roeck-us.net>
Date:   Fri, 30 Jul 2021 15:39:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <def0c2e9-e035-7ffc-3216-27f461555ae5@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/30/21 2:37 PM, Jan Kiszka wrote:
> On 30.07.21 22:49, Guenter Roeck wrote:
>> On 7/30/21 12:39 PM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> We must not pet a running watchdog when handle_boot_enabled is off
>>> because this requests to only start doing that via userspace, not during
>>> probing.
>>>
>>
>> The scope of the changed function is quite limited. See the
>> definition of watchdog_set_last_hw_keepalive(). On top of that,
>> __watchdog_ping() does a bit more than just ping the watchdog,
>> and it only pings the watchdog in limited circumstances. On top of that,
>> the scope of handle_boot_enabled is different: If enabled, it tells
>> the watchdog core to keep pinging a watchdog until userspace opens
>> the device. This is about continuous pings, not about an initial one.
>> Given that, I'd rather have the watchdog subsystem issue an additional
>> ping than risking a regression.
>>
>> The only driver calling watchdog_set_last_hw_keepalive() is rti_wdt.c.
>> Does this patch solve a specific problem observed with that watchdog ?
> 
> Yes, it unbreaks support for handle_boot_enabled=no by not starting the
> automatic pinging of the kernel until userspace opens the device.
> Without this fix, the core will prematurely start kernel-side pinging,
> and hanging userspace will never be detected.
> 
Good point. You are correct.

I think it should also check for watchdog_hw_running(wdd), though.
The function should not really be called if the watchdog isn't
running, but it should still not ping the watchdog in that case.

Something like

     if (watchdog_hw_running(wdd) && handle_boot_enabled)
	return __watchdog_ping(wdd);

     return 0;

Also, I think it would make sense to add your additional comment
to the patch description. The problem isn't only that the watchdog
is pinged once, the problem is that it starts _automatic_
pinging which it really should not do.

Thanks,
Guenter
