Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A752745AF27
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Nov 2021 23:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236619AbhKWWgj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Nov 2021 17:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhKWWgi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Nov 2021 17:36:38 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDC1C061574;
        Tue, 23 Nov 2021 14:33:30 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so1121110otj.7;
        Tue, 23 Nov 2021 14:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dyxw3UzFMU8+JD16HBUNANb/F69dE+rjzj7mbo+jQwE=;
        b=CFtA8iioOQOhJrTC0YqEpZcdE/2zA7fPQ/nG55eXNGGqpSARfIFv1+qEYnGhAZ+2ql
         GrquGBW2ABVPhb1G7MGLnbKc59q9ekwWG9Yqkzk75n3NGvwCFtZMvuvaCEVB/+/a1pd2
         jymBkW7sLQt2tGOMZWTmlZPROYd3W8Igj31sHlFbO1nkHCsCK9qkyTzx01xdUxOPQb0W
         yp9HvzNt8MMJXwcFnyDA7mDna63wDAhXsxyQ87CPGFOCtX7s7ckeE9U/nUb/zns/BASo
         RrGSI/bLEq3GbumAZqxJFXoUXkEJJcbv2T7roQurW/cglbHdQcX0pi4hqdqXVi27jWIb
         DOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dyxw3UzFMU8+JD16HBUNANb/F69dE+rjzj7mbo+jQwE=;
        b=g0BhmCmcIKtGwKikXesjmQKXi+Uf76SRf5mEnc/NeeqwDwAF3ikGVdpKR3mT6QS/zY
         BxTVm74WkKlCYZpFhkSTwgwQlp6yS3zwwf2DIpkVMoaYz81zSZ+9/LnrUOKvj90ll1Ly
         2WtryA+mGee0vM+7vPMCopEnxSOfkQn8+QVbCuo6/6QPd4MaTpsxG2q4nOF4CKx0MIC0
         BPlSXWWdWIWsDWNu7vL2FdycPEh5fve6q7qwtvaBrpbx4cU0X7Q4HuoYhz0xXLBMNMTY
         hnJNx1lPYO4RGxDDwEOiEoDo8J+gxRDX5/T34Gz7DF/IzaimW4qaX8ue1ri9Q0IpWilF
         kFvw==
X-Gm-Message-State: AOAM531BG3//uVvSAyBY/y6Sx7RcoRRN6vflcIExAT9LjMTmQ4QJeiA8
        ssjEJIPN9WdS61fd4NLnoCIcq4DQkd4=
X-Google-Smtp-Source: ABdhPJyqwkmfi2l6Ox93gI62QXjyHNsqRIhmj8wKDD/L+jU91pgTifLvzEo0Ig/rwyqOc2qtT7Jh6A==
X-Received: by 2002:a9d:74cd:: with SMTP id a13mr8201153otl.71.1637706809183;
        Tue, 23 Nov 2021 14:33:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h1sm2443304otq.45.2021.11.23.14.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 14:33:28 -0800 (PST)
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c16afd75-f54c-6c2b-7f61-1f1c7a4b3c46@roeck-us.net>
Date:   Tue, 23 Nov 2021 14:33:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mwhH5C6zSxWDboNucZPvt2c=F7Qaa9V_XJHbJzbFNL3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/23/21 8:17 AM, Sam Protsenko wrote:
> On Tue, 23 Nov 2021 at 18:06, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Sun, Nov 21, 2021 at 06:56:44PM +0200, Sam Protsenko wrote:
>>> Now that PMU enablement code was extended for new Exynos SoCs, it
>>> doesn't look very cohesive and consistent anymore. Do a bit of renaming,
>>> grouping and style changes, to make it look good again. While at it, add
>>> quirks documentation as well.
>>>
>>> No functional change, just a refactoring commit.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> Changes in v4:
>>>    - Added R-b tag by Guenter Roeck
>>>
>>> Changes in v3:
>>>    - Added quirks documentation
>>>    - Added R-b tag by Krzysztof Kozlowski
>>>
>>> Changes in v2:
>>>    - (none): it's a new patch
>>>
>>>   drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
>>>   1 file changed, 58 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>> index ec341c876225..f211be8bf976 100644
>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>> @@ -56,17 +56,51 @@
>>>   #define EXYNOS5_RST_STAT_REG_OFFSET          0x0404
>>>   #define EXYNOS5_WDT_DISABLE_REG_OFFSET               0x0408
>>>   #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET    0x040c
>>> -#define QUIRK_HAS_PMU_CONFIG                 (1 << 0)
>>> -#define QUIRK_HAS_RST_STAT                   (1 << 1)
>>> -#define QUIRK_HAS_WTCLRINT_REG                       (1 << 2)
>>> +
>>> +/**
>>
>> 0-day complains:
>>
>> drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk flags for different Samsung watchdog IP(). Prototype was for QUIRK_HAS_WTCLRINT_REG() instead
>>
>> It doesn't seem to like the idea of documented bit masks. Not really sure
>> what to do here. I am inclined to ignore it, but I don't want to get flooded
>> by 0-day complaints until I retire either. Any idea ?
>>
> 
> Seems like 0-day thinks this kernel-doc comment is for the first
> define only, and thus the comment has wrong format, or something like
> that. I tried to follow the same style as GFP_KERNEL and others are
> documented.
> 
> Anyway, if you don't like 0-day complaints, can you please just
> replace kernel-doc comment (/**) with regular comment (/*), by
> removing one asterisk in the patch? Or I can re-send the patch
> correspondingly -- then just let me know.
> 

Oh, never mind. Let's just hope that 0-day stops complaining at some point.

Guenter
