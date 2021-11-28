Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1ED9460847
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Nov 2021 19:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358911AbhK1SDd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 28 Nov 2021 13:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358823AbhK1SBb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 28 Nov 2021 13:01:31 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A14C0613F3;
        Sun, 28 Nov 2021 09:56:37 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso22188760ots.6;
        Sun, 28 Nov 2021 09:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xPilmmIoPbL/Kyg3qdST0XkTbU51nNs/sJ0o28MWEuQ=;
        b=PxhJGdCFIKNPITQ+sJJPQrAJogUFW9vyc+YOgjEuvrXkd8thBAg+fZWl1ev9eUtatJ
         FVWcayoyNtAulvTse139ExkODnTDrcYkCl0OcrAcqnLb3GguTDM3NOyHGu6obU29v6FW
         Sdek1/ZlY47iNBUG1oGauIAAO6+/ORkJ5NxFjUdVyebW33P0zDd0CfJ/knyeIH7AsLg/
         Q4qyX+stJBSzdJQMYtWiUJOVQ6vTEONSWgouyHJFEq9p0ZZLYXYqQZudvvMw283x31RE
         LzKSLDj2DntdGwiWstjN2PVYVuJ8pXYbGD5XSYs/OBCm+9/Di16fHeWRRDZlrTSc2wu9
         HGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xPilmmIoPbL/Kyg3qdST0XkTbU51nNs/sJ0o28MWEuQ=;
        b=L6dEfiivqOKjbvN2zmvW01rGXMFKJlQobgWXQoZ9qhQNgeIRKL9MO61CCVOc9ajDhH
         MC+oouiyBfwVTsqv2Sw19F7adLNabx2KkeCfUmAfy2nXRSUHg/VLiPWbgQD74LjZwzMZ
         oSXKDj4EULGiWak6jt8jALVVkB9Oo9JCjEBgfoY++H57PZ2Yu3cYam2Vww55j/sNlo0k
         zC1QfPGHkL6w4sq3Ats2Pfd85nPnfG5NbUYdw3mT3HneKU245CkaGJszQ7RdyBqkWx+R
         vz7ugCH/h0QLk+ZeHATbdU23ZFN+ZxuH/n1STH0PCItzKWh47MTID8bsHqoE+hD0Vmdd
         T+pw==
X-Gm-Message-State: AOAM532YucV/lYHTpPsTYrSAmjAxBDN5pB409ZiYkLtGH27EGQsFgQ5C
        s004wtfZU1CNiRnB8ZGdQfIry1KCoqA=
X-Google-Smtp-Source: ABdhPJyCJAJxvclb67zl3R1eBIGHCRfvvjbwPuYD0uIlBe3kLh23VXQIxH/fM0kGOhYEQXIzsz7FFA==
X-Received: by 2002:a9d:200b:: with SMTP id n11mr40754957ota.169.1638122197060;
        Sun, 28 Nov 2021 09:56:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g4sm1960738oof.40.2021.11.28.09.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 09:56:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 09/12] watchdog: s3c2410: Cleanup PMU related code
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
 <20211121165647.26706-10-semen.protsenko@linaro.org>
 <20211123160623.GB2326185@roeck-us.net>
 <CAPLW+4mwhH5C6zSxWDboNucZPvt2c=F7Qaa9V_XJHbJzbFNL3w@mail.gmail.com>
 <c16afd75-f54c-6c2b-7f61-1f1c7a4b3c46@roeck-us.net>
 <CAPLW+4kmUqg=2vYOiWfMhQFqFw1sh0Eo6Yqv8nPEbV_0MObn5A@mail.gmail.com>
 <CAPLW+4=pqZMry-O6_XT=V5AeZ+FfUwZLVp_=QjqudDrbxbZrCg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <037e8534-746d-da0a-24da-a47a9856d689@roeck-us.net>
Date:   Sun, 28 Nov 2021 09:56:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=pqZMry-O6_XT=V5AeZ+FfUwZLVp_=QjqudDrbxbZrCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/27/21 2:52 PM, Sam Protsenko wrote:
> On Wed, 24 Nov 2021 at 01:30, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>>
>> On Wed, 24 Nov 2021 at 00:33, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 11/23/21 8:17 AM, Sam Protsenko wrote:
>>>> On Tue, 23 Nov 2021 at 18:06, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On Sun, Nov 21, 2021 at 06:56:44PM +0200, Sam Protsenko wrote:
>>>>>> Now that PMU enablement code was extended for new Exynos SoCs, it
>>>>>> doesn't look very cohesive and consistent anymore. Do a bit of renaming,
>>>>>> grouping and style changes, to make it look good again. While at it, add
>>>>>> quirks documentation as well.
>>>>>>
>>>>>> No functional change, just a refactoring commit.
>>>>>>
>>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>>> ---
>>>>>> Changes in v4:
>>>>>>     - Added R-b tag by Guenter Roeck
>>>>>>
>>>>>> Changes in v3:
>>>>>>     - Added quirks documentation
>>>>>>     - Added R-b tag by Krzysztof Kozlowski
>>>>>>
>>>>>> Changes in v2:
>>>>>>     - (none): it's a new patch
>>>>>>
>>>>>>    drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
>>>>>>    1 file changed, 58 insertions(+), 25 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>>>>> index ec341c876225..f211be8bf976 100644
>>>>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>>>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>>>>> @@ -56,17 +56,51 @@
>>>>>>    #define EXYNOS5_RST_STAT_REG_OFFSET          0x0404
>>>>>>    #define EXYNOS5_WDT_DISABLE_REG_OFFSET               0x0408
>>>>>>    #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET    0x040c
>>>>>> -#define QUIRK_HAS_PMU_CONFIG                 (1 << 0)
>>>>>> -#define QUIRK_HAS_RST_STAT                   (1 << 1)
>>>>>> -#define QUIRK_HAS_WTCLRINT_REG                       (1 << 2)
>>>>>> +
>>>>>> +/**
>>>>>
>>>>> 0-day complains:
>>>>>
>>>>> drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk flags for different Samsung watchdog IP(). Prototype was for QUIRK_HAS_WTCLRINT_REG() instead
>>>>>
>>>>> It doesn't seem to like the idea of documented bit masks. Not really sure
>>>>> what to do here. I am inclined to ignore it, but I don't want to get flooded
>>>>> by 0-day complaints until I retire either. Any idea ?
>>>>>
>>>>
>>>> Seems like 0-day thinks this kernel-doc comment is for the first
>>>> define only, and thus the comment has wrong format, or something like
>>>> that. I tried to follow the same style as GFP_KERNEL and others are
>>>> documented.
>>>>
>>>> Anyway, if you don't like 0-day complaints, can you please just
>>>> replace kernel-doc comment (/**) with regular comment (/*), by
>>>> removing one asterisk in the patch? Or I can re-send the patch
>>>> correspondingly -- then just let me know.
>>>>
>>>
>>> Oh, never mind. Let's just hope that 0-day stops complaining at some point.
>>>
>>
>> Just sent v5 for this patch, fixing that 0-day warning properly. Found
>> info about it here: [1]. So to check that warning, apparently it's
>> enough to run "make W=n" build, or dry-run for kernel-doc script like
>> this:
>>
>>      $ scripts/kernel-doc -v -none drivers/watchdog/s3c2410_wdt.c
>>
>> Anyway, please take v4 series + v5 for this patch. Hope that'll be all
>> for 0-day swearing :)
>>
>> [1] https://github.com/torvalds/linux/blob/master/Documentation/doc-guide/kernel-doc.rst
>>
> 
> Hi Guenter,
> 
> Can you please take this patch:
> 
>      [PATCH v4 12/12] watchdog: s3c2410: Add Exynos850 support
> 
> and replace "Cleanup PMU related code" patch you already applied with this one:
> 
>      [PATCH v5] watchdog: s3c2410: Cleanup PMU related code
> 
> I can see you already took most of WDT patches I sent, but those two
> seem to be missing.
> 

Upstream work is always "time permitting". Done now.

> Also, I can't see my patches (which are already present in your
> "watchdog-next" branch) in linux-next/master. Is that expected, or I'm
> missing something?
> 
My watchdog-next branch is for 0-day coverage only. It is not made
available in linux-next. linux-next pulls watchdog related changes
from the official watchdog repository at
git://www.linux-watchdog.org/linux-watchdog-next.git#master

Guenter
