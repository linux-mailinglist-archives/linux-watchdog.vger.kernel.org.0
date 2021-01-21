Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7AA02FF072
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Jan 2021 17:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732624AbhAUQfG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Jan 2021 11:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732731AbhAUQeP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Jan 2021 11:34:15 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC06C06174A;
        Thu, 21 Jan 2021 08:33:35 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id g69so1968219oib.12;
        Thu, 21 Jan 2021 08:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tdBhzitzhGeIwEPzp4lEU8sSfxvtZV+i3Vmxo3BeinE=;
        b=jFXo6d69iviz5B2ffNRUDGrUeTHBadWl9/DrKuMJ0F+JZzfWVy7AZmfwL3f90ly7Jo
         vXPzHVh8wUlXgLFwHeFvS0M0na8WGbIsSa8P66QQv10W0EZi3k2hCBP6hiHRsf9Con0v
         sN46AXCTTeD91RCup9VRfK6CnF9yV+FI04LtQL0bCVYj5H8kQWKvKunJlZYps5hSv14b
         3yWawRzugIe0jDhRZ51LFxyDE1BTVkWxso5Qn0dLvnFJ6OBhmco1H7pgk920uFEfWN6N
         R6JxGWcnXKn/K3kCzRNq0H9a2YMOrCIXlV3UJ4On07xAIONLy1c7jBevFj5/vdw0puzY
         tY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tdBhzitzhGeIwEPzp4lEU8sSfxvtZV+i3Vmxo3BeinE=;
        b=kb2Abiz2ZN2xS6iRWPA1Vd6UlNwxcgX5P8mTh8akygVro/zZORiHDXzYmM7QfnDgtr
         CD5xPq1E+p140ZS2SGIsRgT45qzuwDS3BIExcPf6e7/tdykdPRn3i3cSVASXd18v0z27
         zfGE9AR8TMtutT2+ATZd43iDuff/GqziV6lAgIGVLSEEL8s6RpQbM0QKJrKceAFJLFfF
         EZknl+TSuda5/qgZ/ZLW8elX2iCFwZMUOpJzXh8gaVUoGqHHI8HTDsRy7YP3tc2oGpI6
         aXwecoW9ztcaHoO5H/9biF40O68ZKbQ9pPx0h8x3/G5bxLqIGQnVc0251B6kntfnnu9D
         qy8w==
X-Gm-Message-State: AOAM531CnzANVwkxs11Per86Ioxedm2hQfI27ul8KCtcG/UHoynKkCme
        H/Wanwma9JsDjJcJEBIKms4=
X-Google-Smtp-Source: ABdhPJwl1ob56cadTi6A8KyzF3A0CE9hEW9zN1yI4FxUXKnIlxG1gD6H+tKowmNHhPzQ/8ndan95dg==
X-Received: by 2002:a05:6808:145:: with SMTP id h5mr266734oie.87.1611246814393;
        Thu, 21 Jan 2021 08:33:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p132sm1109203oia.41.2021.01.21.08.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 08:33:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/5] watchdog: remove tango driver
To:     Arnd Bergmann <arnd@kernel.org>,
        =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
References: <20210120162745.61268-1-arnd@kernel.org>
 <20210120162745.61268-5-arnd@kernel.org> <yw1xv9bqxucj.fsf@mansr.com>
 <CAK8P3a2QFewbxz+HEo9MCE3+RuZBT=yM3Bd2pGhtvN0=-9sj_g@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <b57e94ac-85a2-8aa6-5400-400ead370848@roeck-us.net>
Date:   Thu, 21 Jan 2021 08:33:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2QFewbxz+HEo9MCE3+RuZBT=yM3Bd2pGhtvN0=-9sj_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/21/21 7:18 AM, Arnd Bergmann wrote:
> On Thu, Jan 21, 2021 at 3:01 PM Måns Rullgård <mans@mansr.com> wrote:
>> Arnd Bergmann <arnd@kernel.org> writes:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The tango platform is getting removed, so the driver is no
>>> longer needed.
>>>
>>> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
>>> Cc: Mans Rullgard <mans@mansr.com>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>  drivers/watchdog/Kconfig      |  11 --
>>>  drivers/watchdog/Makefile     |   1 -
>>>  drivers/watchdog/tangox_wdt.c | 209 ----------------------------------
>>>  3 files changed, 221 deletions(-)
>>>  delete mode 100644 drivers/watchdog/tangox_wdt.c
>>
>> The DT binding can go as well.
> 
> Good catch! I thought I had cross-checked all DT compatible strings of the
> removed dts files, bindings and drivers to make sure everything is gone
> at once, but it seems I missed a couple of files including this one.
> 
> Guenter and Wim, let me know if I should resend this patch or all watchdog
> patches, or just remove the binding as part of the platform removal in the
> soc tree.

I'd suggest to just resend this patch, or to send another one on top of it.
It is Wim's call to make, though, since he will apply the patches.

Guenter
