Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D64F25DDF9
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Sep 2020 17:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgIDPk3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Sep 2020 11:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIDPkY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Sep 2020 11:40:24 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A5CC061244;
        Fri,  4 Sep 2020 08:40:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z15so1330872plo.7;
        Fri, 04 Sep 2020 08:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IQDo8FpZy7wFoQHqQEGpuc/VN48kIyQ/D/5kCAdKndk=;
        b=M4Iyt6hmbuC0Nc1C+qmGy0wqKy3g7yP3OwrgHydu/W17QGa5LA0SEC8NOWK8g7RdN/
         tvQa78oWiD6OWtUkE/xRkoZj8WnVN538mg1l7XKcHv0mszsqV8zEu5QZGBcY1B6lCgyu
         QTJSSBiNSHwy7BK59Zu8tiXVOLAm1qjSwSWtct41vqcHSJFOl7VlHhxggz3zsmiENGiG
         HGkLwmTYFk9IGB5qMYbuWT5gpIrJ0zMU6XbaEjyUG5znsZQTvpxae1OT84ZyyMHoTxwD
         Lm1Bc9Bw3al/mmId8M40rDWu6D5fJpIoB/zoxBoHvRuyc50AMuvMFSgcSEH3iJ+p3kDN
         nd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IQDo8FpZy7wFoQHqQEGpuc/VN48kIyQ/D/5kCAdKndk=;
        b=onnhuTO2HfgdJDSbjiQrQ5FL6a4iZnYz/zW4rUUKD9qi7hahnzXRKVGU9pZ1Z034Y7
         RMeH3lFyX7hRKgkpzI1Qc+3awpBbqk04ymCcBjvtqOj4WwbI5KF3BTmPXjzhwBT27ar0
         0CfBt+NI4Sm4uC4hxBQFXshKJko8FIO8D+CCQjJVUKBzzkDJBT7M+mBFU47z2Q/Dh8oT
         vkC97R7A6OWGxUMOd2jlvyYQL1PjH526US/MxAsN4xMx0+RB8zecGdhsOucR+okDrbLs
         csgTqY4ko27BxWLCgucUAqnxT46kRnS+Gu7eu9U2JT49J45ax6t9mTmEELA8taljWyV2
         JRwA==
X-Gm-Message-State: AOAM533JiTf95FuK+0L8lggPhHzOxcWWwOy8IgBAvUSqwMPAbl1ne+ZM
        L02YyHDUDrqIzw6DHEoI22Y=
X-Google-Smtp-Source: ABdhPJzX0Yhp5J3UeAfE+CsyKGNiSh6rI3Mpd1uBXgvYBR9CDaJEgfIYRv4WtYU7vXCEQXAc+2pKlA==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id na15mr8514030pjb.119.1599234023415;
        Fri, 04 Sep 2020 08:40:23 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v17sm6889773pfn.24.2020.09.04.08.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 08:40:22 -0700 (PDT)
Subject: Re: [PATCH 00/10] dt-bindings: Convert SP805 to Json-schema (and fix
 users)
To:     =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chanho Min <chanho.min@lge.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
 <19c6a67e-48f0-c0b6-3653-32a5a1f09e07@gmail.com>
 <CACRpkdbMbNd87145iwdL7=x501cvgU7wiZXNLF456sn6WvoodQ@mail.gmail.com>
 <302c54fd-5183-c8d0-7038-f6e60c7bb056@gmail.com>
 <26416b9b-d390-d7df-ee1f-8ec7ca08ba72@arm.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1eea5f98-b437-1fda-d967-facf878c704c@gmail.com>
Date:   Fri, 4 Sep 2020 08:40:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <26416b9b-d390-d7df-ee1f-8ec7ca08ba72@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 9/4/2020 8:35 AM, André Przywara wrote:
> On 04/09/2020 16:29, Florian Fainelli wrote:
> 
> Hi,
> 
>> On 9/4/2020 1:58 AM, Linus Walleij wrote:>> On Fri, Aug 28, 2020 at 9:34 PM Florian Fainelli
>>> <f.fainelli@gmail.com> wrote:
>>>> On 8/28/20 6:05 AM, Andre Przywara wrote:
>>>
>>>> What is the plan for merging this series? Should Rob pick up all changes
>>>> or since those are non critical changes, should we just leave it to the
>>>> SoC maintainers to pick up the changes in their tree?
>>>
>>> What about André just send a pull request to the ARM SoC maintainers
>>> for the whole thing?
>>
>> I already applied some of the patches, if we got that route please CC me
>> so I can drop them from my local queue. Thanks
> 
> I would for sure drop these from any PR.
> 
> Rob, are you happy with the actual binding conversion? If you are
> willing to take it as it is (Viresh has already acked), I could then
> split off the DT fixes and either chase the maintainers or send ARM SoC
> a PR. But this really depends on the binding being good.

We had discussed this in an another leg of this thread that starts here:

https://lore.kernel.org/linux-devicetree/CAL_JsqKvcGAotS6xL7pu+wM8X33PLCQCuoaXYmWrA3j3OdoR5A@mail.gmail.com/
--
Florian
