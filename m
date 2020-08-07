Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C413323F38A
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 22:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgHGUJJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 16:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGUJJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 16:09:09 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F7EC061756;
        Fri,  7 Aug 2020 13:09:08 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id l64so2847648qkb.8;
        Fri, 07 Aug 2020 13:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v6shjW3mv0CzotYibzehFT5/hINT+XFxzYyCDrE83Dc=;
        b=Ve3N/HXwsKv8ySPPGskSnRr5Uacjl8x1Kputs8iftdehBMa8UVQ30VCtrkGpg4pA1J
         fIoi7mUMWwDUbL7lEeZUzkTSYGzk+kavkV3YwUrCg/Mwi3/cIdkw99a23kUQ7rCks1JB
         iNXh7CbDevDlHYGKRcsjuxVLIdZXq2glnT7xi9PaTrPbe0nPQ0ZKS+DRaz/K/n9+sm/d
         t3DWG4TtMRUPtUs1Mx8bhJOie6SGgh6iidRRoOxIxioT+YZ1N2ydkIJpRx8FGnVP8Kcb
         6kPOrnKsaXZ70kQ0DYDruyvlDh4M8PC44n/c9Fr6354XzrS8/QYdmCjbtOcok5at1VYm
         6ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v6shjW3mv0CzotYibzehFT5/hINT+XFxzYyCDrE83Dc=;
        b=GHzdK+x32F4QVXwpqujAG2jNBg9RHkJuSMJp/VjLrK1sp9Yj8XzWH1ubAE+qQ676gg
         9i2LFrcC9GJMfDF30vFQ//CYPF5PjIDkYWLEP2aj16sPAE4isEuti5BuP79RwUfwpaXL
         EW6hnPWeXDfSEzJmxMyLojWvlx9Eoyb0TcV8pj9fZRXa5kOwemyF/BtXkwYRzHEMiYSJ
         /8AWjBcmLtcPVyPde42uAgquczsjcSzmT0tDZML0zEXeWWkaCEswrvWNNx4pz/HoQ+Nw
         yeVmDVa8r8Q9oEf7skudFxLfkSsoqSwNoKOoEq5a81QlkqirNX0MHq++yL4zup6DifW+
         7BBA==
X-Gm-Message-State: AOAM530tQXgDsCQIkW9VU8GV65A0tZLGKsQHzL/OG3PuTHhzeOMERYw6
        xxg/NGJxJ4urPTAfbf45/3M=
X-Google-Smtp-Source: ABdhPJxg6bRetxEVAOaiKqqoKUtFx4kiO3EkBtA3TT/yB2Ood5h2cAJoMzEOKPTQ/EC5B8xE+zcKBg==
X-Received: by 2002:a37:a6c3:: with SMTP id p186mr14827311qke.135.1596830947429;
        Fri, 07 Aug 2020 13:09:07 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id n127sm8006909qke.29.2020.08.07.13.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 13:09:06 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
To:     Guenter Roeck <linux@roeck-us.net>, madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net>
 <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
 <bc8c5d7d-91a4-e955-854f-eef88812ac1a@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1b9db5ad-0edf-091b-a04e-a8f3a6ac08e2@gmail.com>
Date:   Fri, 7 Aug 2020 13:09:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bc8c5d7d-91a4-e955-854f-eef88812ac1a@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/7/2020 12:08 PM, Guenter Roeck wrote:
> On 8/7/20 11:08 AM, Florian Fainelli wrote:
>>
>>
>> On 8/7/2020 9:21 AM, Guenter Roeck wrote:
>>> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>>>> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>>
>>>> In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>>>> after misc_register(), hence if ioctl is called before its
>>>> initialization which can call rdc321x_wdt_start() function,
>>>> it will see an uninitialized value of rdc321x_wdt_device.queue,
>>>> hence initialize it before misc_register().
>>>> Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>>>> function called from write callback, thus initialize it before
>>>> misc_register().
>>>>
>>>> Found by Linux Driver Verification project (linuxtesting.org).
>>>>
>>>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Having said that ... this is yet another potentially obsolete driver.
>>> You are really wasting your (and, fwiw, my) time.
>>>
>>> Florian, any thoughts if support for this chip can/should be deprecated
>>> or even removed ?
>>
>> I am still using my rdc321x-based SoC, so no, this is not obsolete as
>> far as I am concerned, time permitting, modernizing the driver is on my
>> TODO after checking/fixing the Ethernet driver first.
>>
> 
> Do you have a manual ? I'd give it a try if you can test it - conversion
> should be simple enough (I have a coccinelle script which partially
> automates it), but this chip seems to have a fast timeout, and the
> comments in the code ("set the timeout to 81.92 us") seem to be quite
> obviously wrong.

Yes, there is a public manual for that SoC, search for RDC R8610 and the
first link you find should be a 276 page long manual for the SoC.

I probably won't be able to test anything until the middle of next week
though.
--
Florian
