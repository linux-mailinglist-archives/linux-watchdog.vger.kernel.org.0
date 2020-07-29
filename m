Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC80231AF4
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 10:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2IPQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 04:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2IPP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 04:15:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C0EC061794;
        Wed, 29 Jul 2020 01:15:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 184so2038731wmb.0;
        Wed, 29 Jul 2020 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rlchZqwkXTtwtE28PNsYh99vPS/5jVQbHUXJ9dhuRrA=;
        b=P9cG23A4bFDPWjtj4larjxw9qub354zQJMGt5m62NGpQZpZF1zWrdiDiI0E56b8bbe
         Ibl63wLkvwrYw1yO6bvu5qRR9Is94HvtOtHxhoV9oNvJaQ6wzhwYo58wAPYP6JEmn5ss
         Fxh0ydAuS41xj5OPLQZeuyR6PC2OE20K19zt26Wi35TVcs6YS4rEz7U2RT7l4TI14jpK
         GTF52mTM953Tbhi4XahEtPtjuefcbB0wRQ/zCPFf3HwOtRa5ydkptAcivPwhBZ33d7hs
         vjfp2wbqX5WHkzIB1+JoASZsOhQc+oxdW+PUvytH/UlkuJOnqcb9Vp2rZUcAW/2Mg4gO
         Q7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rlchZqwkXTtwtE28PNsYh99vPS/5jVQbHUXJ9dhuRrA=;
        b=Kuc4zgLqKVHwT+foG33YBcLyzpQrS0lHDf34O/h6OfLCEq5Ql/3yVKdOYG2jXFBAdK
         mcweZRiye6qev9IvS3rbbtfF6ccOrqkq1odH8qjljVEF6DziYN4GPUuy6QXzbLkzMIl5
         Ts9pescZrCcJGKzKD+o8amPwFz65x4aSe2X4nLKIKQRwz6tV8++mlK5rJfqAhGSJE4a2
         FnLloUQjbiBU5tLfU3Z6fWq+RWeG8zhPYfW5W5RM9Kqaar6HI15Ou3QGbkLub5CbSMoF
         jF47s5qNcFM0BW7KGOAh3jmHBa5LRHKS0EgQ2PuUI6D3qVjdzaqbexvVWYdVocnOKK1r
         5jRA==
X-Gm-Message-State: AOAM5302LwFYTSvWr5ZbNnRsr9ycRfho4W6ZFvMXNdQhF9v+DTM7y0cH
        UlYeNqcSsbLFcJYtT07Zzts=
X-Google-Smtp-Source: ABdhPJyFW7pSFOpmJYqx4oK1oTZOOOz/JCxfYIwaWtqZ29VmQTDiliOunqQhsLOYzEtFTRU+wQ5fgA==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr7413895wmj.122.1596010514275;
        Wed, 29 Jul 2020 01:15:14 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id p6sm3336770wru.33.2020.07.29.01.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 01:15:13 -0700 (PDT)
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
To:     Crystal Guo <crystal.guo@mediatek.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= 
        <seiya.wang@mediatek.com>,
        =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
 <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
 <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
 <1596010313.11360.2.camel@mhfsdcap03>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <72d317ef-7f69-9e61-b1d5-23d660c58560@gmail.com>
Date:   Wed, 29 Jul 2020 10:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596010313.11360.2.camel@mhfsdcap03>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 29/07/2020 10:11, Crystal Guo wrote:
> On Wed, 2020-07-29 at 15:42 +0800, Matthias Brugger wrote:
>> Hi Crystal,
>>
>> On 29/07/2020 08:30, Crystal Guo wrote:
>>> merge all the reset numbers in one head file.
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>    include/dt-bindings/reset-controller/mtk-resets.h | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>    create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h
>>>
>>> diff --git a/include/dt-bindings/reset-controller/mtk-resets.h b/include/dt-bindings/reset-controller/mtk-resets.h
>>> new file mode 100644
>>> index 0000000..d73a4ba
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset-controller/mtk-resets.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2020 Mediatek Inc.
>>> + *
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MTK
>>> +#define _DT_BINDINGS_RESET_CONTROLLER_MTK
>>> +
>>> +#define MT2712_TOPRGU_SW_RST_NUM	11
>>> +#define MT8183_TOPRGU_SW_RST_NUM        19
>>
>> Maybe I didn't explain myself properly. We want to have all resets in one file
>> and do not want to have the resets for the watchdog in a different file. That
>> means I don't thin your patch is correct and the effort should be abandoned.
>>
>> Regards,
>> Matthias
> 
> Do you mean to keep the current way unchanged? For example, with a new
> SOC 8192, should add a new head file mt8192_resets.h for the resets
> numbers.
> 

Exactly.

Regards,
Matthias
