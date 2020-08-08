Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1353D23F683
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Aug 2020 06:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgHHE66 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 8 Aug 2020 00:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgHHE65 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 8 Aug 2020 00:58:57 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAB9C061756;
        Fri,  7 Aug 2020 21:58:56 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f193so2227999pfa.12;
        Fri, 07 Aug 2020 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AtN3leZvyrHwsnihwoXNii9DGQJPzkVjm+8KYGRqCWw=;
        b=VKi5wb6jEgPcrFUNrdphw98y8K61diXt2QwQ4peFOATWqvkOOajn5RdiGydmQd+HRk
         aEYD9psqZTPmWrZo2R6K/IhPioDYbyOmRg2jkSO0Rc2hn5AUtcOeB1tDLLBLP8oZHwfF
         DRs5n4KdeZVvcXJiM8SdDF0kRXy/HK/9JQK5UXD3LqQxUSREUD1InjEXNQBXtBilBCt9
         i/Tmbw3+oLJV7Bk/T4ijP7mG3quzboa3f8uf2QNYqlCyiI7BkE22qVtTfGzlo8pI9PhE
         DkQMSwCEADJLNGXtxsUo+mT9nHS+HetR390yDyCAzT4r3IHYXi5X5Mhgxziik7EngMhI
         nyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AtN3leZvyrHwsnihwoXNii9DGQJPzkVjm+8KYGRqCWw=;
        b=asAgsJBv2E72hPg48gW7+E9aGpAlhdkuoz90z1FlvciWJ3gwLp0G0QPwc64+B3PXKc
         mODORFLbG+e0uF3PfY6s1BVnYVcWvLqFBSzjkh19/IOH3NBAwYIMhvPBCgZ7ec6pQDqC
         nzRaFBO0j86OniqiaM1ceKFaG8SRx2Cu4gsrFSV36B1OwnBctGJkyad3UtW/nmubswf0
         xvVTOZSE4z7Mkc3uAfQgfZkikoIqjrAd/wKEI14VHAY221Dcc5hxP3UpWe421J4vwM/G
         SMZtKJiZZwmQyfD8+nGy1HDt+1PlgI4JDPvww3Bb4bE9a9wSlw3lRtZ/wL2jbcX/UfVD
         TmQw==
X-Gm-Message-State: AOAM533oUHzoaYNwI5SqAco+74cqoksPDLx668LYOHdXzHLE7OYNk9Q9
        /TuR6HCJUQHAPNLIpkeZAmFDkwAM
X-Google-Smtp-Source: ABdhPJw88erkJZ2kESTHWK9ssgV1iVUEPr8AxJkkMhXtBB0Ip27dwTtXdhoNhjMDVXoqj0n0/7SBDg==
X-Received: by 2002:a62:928d:: with SMTP id o135mr15419131pfd.22.1596862736236;
        Fri, 07 Aug 2020 21:58:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10sm15100404pfb.82.2020.08.07.21.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 21:58:55 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
To:     Florian Fainelli <f.fainelli@gmail.com>,
        madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net>
 <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
 <bc8c5d7d-91a4-e955-854f-eef88812ac1a@roeck-us.net>
 <1b9db5ad-0edf-091b-a04e-a8f3a6ac08e2@gmail.com>
 <c7a03401-2c50-868b-57b0-ae3c0bd61e70@roeck-us.net>
 <5c048af7-e7b0-4928-9088-b0bbbcfab0ed@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1b9fa0f7-4ea8-f4bb-3abb-375532142e91@roeck-us.net>
Date:   Fri, 7 Aug 2020 21:58:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5c048af7-e7b0-4928-9088-b0bbbcfab0ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

[ ... ]
> The R8610-G datasheet is the one that I have had and used thus far.
> 

Mine is draft version 0.2. Do you have a newer version, by any chance ?

>> Unfortunately, none of those
>> describes the use of bit(31) in the watchdog register, nor the meaning
>> of bit(12) and bit(13). Bit(31) is described in the code as "Mask",
>> and it is set by a couple of commands. I _suspect_ that bit(31) has to be
>> set to change some of the register bits, for example the counter value.
>> That is just a wild guess, but it would explain why the driver works
>> in the first place.
>>
>> It is also not clear if the bits in the counter register are accumulative
>> or if only the highest bit counts. The datasheets suggest that only the
>> highest bit counts, but then the value of RDC_CLS_TMR doesn't make much
>> sense since it sets two bits.
>>
>> Since you wrote the driver, I was hoping that you might have a datasheet
>> which explains all this in more detail.
> 
> I do not, and this was over 12 years ago, and I honestly do not recall
> all the details, when I get the board running a newish kernel, I will
> poke around.
> 
Surprise :-)

Thanks,
Guenter
