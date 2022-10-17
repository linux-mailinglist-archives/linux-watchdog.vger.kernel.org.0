Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FC1600FFD
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Oct 2022 15:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiJQNMf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Oct 2022 09:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiJQNMe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Oct 2022 09:12:34 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3102CDE9
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Oct 2022 06:12:25 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id p127so11367492oih.9
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Oct 2022 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=15gaj/hiuDmQH6upG5SfHv7x3HIT6b34tqYQGCcQSmU=;
        b=pGdcfDE8aEm0w/uAOZ6yi9OIhmu+CqdZh9mMDQwk2qEch1FAt3h+7vvkn6mzP0nmqX
         yhtQQh+FxhSCu/s9KNX2sKjOq7Mu6usuVnsUg4V2ZXoMEuFkwW7bwzzvmFgTkV/6yRJ7
         i9K5GCqmnjMyGbUwfOcT20AmOwcOb73aAiZBLFd/HB1WuQnEukDsBQ0RFF2iSi/Wi+e4
         3VzZSrKcai2TAELpP6Se8dLjG+3S1xDFPyOgxieNFDQqX8uNgrS7IU6vu7+UYmq/T2eJ
         f2Yp+zqWs4V0ay+MH1YDhBcKHhhiCL3MwDK716l0qM6LlCfwtZ9AFRmRGWuTHJtwogwm
         zfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15gaj/hiuDmQH6upG5SfHv7x3HIT6b34tqYQGCcQSmU=;
        b=WzbyRMsvpOxnf4nwsGdmQjfqpA5FFYvWy51CIdcYTQQ1xnXA829ngIkGHarN178Vcf
         bNX1rUYkIyUFK0aFLr+ySFnp9prfxD2J2RT4B02U8kMpi2I8N03bMGNvJ9X6ZrTo8K+Y
         1PhvGQDdfWwjSqdXnNo9SMY/wNFns+m2do8c6so0d7H9Co7UhkSb26Qg/VmuaFL+5n9L
         OUBdSaT1m6FjjyKE/p16W62V75L5IECfsWGOiyd4MrhgQNjh/wMMHPNAZJHxkjNH8233
         TWQzMQBZAv5fDt73nX3Qjxjm2icw+M1WN/bChPGSG6Mhdvb7UxREmrornBZcHEDev1iZ
         dLbg==
X-Gm-Message-State: ACrzQf1k2Ds1acLXbGRNCAPfPhqvZR8+ulODSfHBjb8R9zdeG2p0x/pT
        xQpwC4FcTA9XuluM3DVFS4EWx8B+bu8=
X-Google-Smtp-Source: AMsMyM6xYkqaE8ZPHaSx38ZBszdVqlYZuT8ISrwGwic88NO/VgKCHRTkD3Zww9J9bva5DoohXlvpuA==
X-Received: by 2002:aca:1e15:0:b0:353:f508:f9e0 with SMTP id m21-20020aca1e15000000b00353f508f9e0mr13302178oic.290.1666012335044;
        Mon, 17 Oct 2022 06:12:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i184-20020acab8c1000000b0035028730c90sm4308347oif.1.2022.10.17.06.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 06:12:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <42d72266-c983-d0a1-8254-daff97de58ee@roeck-us.net>
Date:   Mon, 17 Oct 2022 06:12:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drivers: watchdog: advantech_ec_wdt.c Add Advantech EC
 watchdog driver
Content-Language: en-US
To:     Thomas Kastner <code@kastnerfamily.de>
Cc:     Thomas Kastner <thomas.kastner@advantech.com>,
        linux-watchdog@vger.kernel.org
References: <Y00S08UV7g6ZSm9J@EIS-S230>
 <2ce281ff-264f-006f-00ec-7596fa7d855f@roeck-us.net>
 <Y01Ty4bo6TuaXj6x@EIS-S230>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y01Ty4bo6TuaXj6x@EIS-S230>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/17/22 06:08, Thomas Kastner wrote:
> On Mon, Oct 17, 2022 at 05:24:07AM -0700, Guenter Roeck wrote:
>>
>> Please drop "drivers:" and the driver name from the subject,
>> version your patches, and provide change logs.
>>
>> Also, please fix the following problems reported by checkpatch.
> 
> Thanks for your patience.
> 
> Can you please confirm the version of checkpatch or any parameters used?
> 
> I'm using v0.32 which seems to be the latest in GKH's staging tree as
> well as Linus' mainline. It has just given me the quoted string warning,
> but not the others as below- although of course those are valid.
> Just trying to get to the same result...
> 
> No questions on the other items, Will implement the changes and provide
> a versioned v3 with change notes later.
> 

CHECK is only reported if checkpatch.pl --strict is used.

Guenter

>>
>> CHECK: Alignment should match open parenthesis
>> #144: FILE: drivers/watchdog/advantech_ec_wdt.c:55:
>> +MODULE_PARM_DESC(timeout,
>> +	"Default Watchdog timer setting ("
>>
>> WARNING: quoted string split across lines
>> #146: FILE: drivers/watchdog/advantech_ec_wdt.c:57:
>> +	__MODULE_STRING(DEFAULT_TIME) "s)."
>> +	"The range is from " __MODULE_STRING(MIN_TIME)
>>
>> CHECK: Please don't use multiple blank lines
>> #270: FILE: drivers/watchdog/advantech_ec_wdt.c:181:

