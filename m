Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F3425DDBD
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Sep 2020 17:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgIDPaD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Sep 2020 11:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgIDPaC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Sep 2020 11:30:02 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331D2C061244;
        Fri,  4 Sep 2020 08:30:02 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gf14so3195992pjb.5;
        Fri, 04 Sep 2020 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iebi0z2mlsaS/MsI2PAICvEB1QQjSGqa/F+RwGkGDOI=;
        b=qPYjFdX5evc0l2TJ203QDpjrFD6lufBE+yb+11A/VO/XZ6rv25HLw62qs9LAJL1XYO
         ii8//MHd1dduxpUkQRGcf2d9untvUQrKXQyEWBVTiPzC6PiE9XRsMNhuoBAp1ZJ8jykl
         hdfsFk7xGuDq9swEYSEw5HOpv6s1zyk1YLyeN5sAskT1ifGgeuvmaZVGRKEOw4Q9Z42Y
         f6TDMFdIsTdXLvzKDS0slyfLls+i4gmwUz/BhcigDEMZPdRXtgaKigCGSkTNZLL+wYjE
         eCQdts4zkpStdcUOr2mywi+Oei4RUi8QEpYNM5GYksnyC+K5INGITXR+d/FAp1LDw2YB
         4SAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iebi0z2mlsaS/MsI2PAICvEB1QQjSGqa/F+RwGkGDOI=;
        b=T2TKXqzI/8J42zGMea/Wj1dGvILt7cZeiCAu4Y7rCj4ANkrztZ5fSCMYcxXzsgwM8s
         QdHUOlWfQUReAxs9C1hwVZ653bMvF0nS4kVXQaLtmDI2ZYiSXPpgbh9QJ3infL+fOSv/
         5vG2mtfswDzKfQ1hRV6izgYQuS+jBn9lR9ZxRNRyxlvhVtiqBYyzErR/WwkB+wsVVCba
         JLOy6jOlElLcwaBLRL/sOEuJZwjEwijrcIKHdAXpQzWfcSYaPXYjjdGfW0+X3suIl5Mb
         qkUsnSwPgGEissSrSkT+AbgzK5irFi8FzUmEpbwVfosZ/K8I+l0Xm1qRTBSNs8/LEExC
         u7Vg==
X-Gm-Message-State: AOAM5314gQReqFBDO24jgVjytsKFE7v+jyGZqQGXJZHKgM7Hg/R9F+nn
        1JrPKZO0XKA9gpV1rnWJapU=
X-Google-Smtp-Source: ABdhPJz2hYfNBzOEEK9l+8DUohjFIb9XcVD4neyJl/SxS3d+OlhUR9w3ukXGK2jcYC7brorIMOkPsg==
X-Received: by 2002:a17:90b:4a4f:: with SMTP id lb15mr7224272pjb.146.1599233401669;
        Fri, 04 Sep 2020 08:30:01 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id w10sm5603097pjq.46.2020.09.04.08.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 08:30:01 -0700 (PDT)
Subject: Re: [PATCH 00/10] dt-bindings: Convert SP805 to Json-schema (and fix
 users)
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <302c54fd-5183-c8d0-7038-f6e60c7bb056@gmail.com>
Date:   Fri, 4 Sep 2020 08:29:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdbMbNd87145iwdL7=x501cvgU7wiZXNLF456sn6WvoodQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 9/4/2020 1:58 AM, Linus Walleij wrote:
> On Fri, Aug 28, 2020 at 9:34 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>> On 8/28/20 6:05 AM, Andre Przywara wrote:
> 
>> What is the plan for merging this series? Should Rob pick up all changes
>> or since those are non critical changes, should we just leave it to the
>> SoC maintainers to pick up the changes in their tree?
> 
> What about André just send a pull request to the ARM SoC maintainers
> for the whole thing?

I already applied some of the patches, if we got that route please CC me 
so I can drop them from my local queue. Thanks
-- 
Florian
