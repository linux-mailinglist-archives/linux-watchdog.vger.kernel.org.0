Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B16506F8B
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Apr 2022 15:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243924AbiDSOAc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Apr 2022 10:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345292AbiDSN6j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Apr 2022 09:58:39 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B930C38BE9
        for <linux-watchdog@vger.kernel.org>; Tue, 19 Apr 2022 06:55:56 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-e5e433d66dso6205082fac.5
        for <linux-watchdog@vger.kernel.org>; Tue, 19 Apr 2022 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5pelNMQjpgW13OY4Rl38V7A/rJKbj4bBQqFbIHcsvPk=;
        b=N3s/SEWvMZk+qzE1jqKGNGTNVIyT2eoCdYJV69l4jwNDgLfEF4YRrd0sE/dj1B3C+O
         yMykDvdAPgWCT+jlOshe28zYk9U/Jj9acysFHpfv1IjcWXIXFWMvYvSRYniHGEVOtmQE
         CVl16eRKAROOTyLfZiS4YUza7axRz8bBzX1pBWyyGPoWtRxdAevawXyWUE/xsEqCD0gF
         IQBnua4rRnqcvy0emvk+Mmq0eBy5z6+NL+5MGIg//79eDZnrbDWQvTp17R1fYd1B08FF
         xVctL3LHPDuXC7vR8Zw9QebRI3EFiT+p6N6uTRS55kNx5YX/eoRIQFF1vjHMAHutIFDT
         EgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5pelNMQjpgW13OY4Rl38V7A/rJKbj4bBQqFbIHcsvPk=;
        b=LUpdXFjgq2mZ15L3ff3ZCmAjxjmKHGfNT5G8zJQxWCcSMSJha6cxm0y4Jwu9XMBfHX
         LQgMO22vhK3in+7OqOxWpCOHv9LUDOiZx3Smhoa/k1qXMfuQpD/2Qqo5bhld06jXU9lf
         iLo9mThh0tqQlrwc1KNTcLe/nhfvHjj/61YerO1wkVGytnrK5gZReOQAazOGPV8Nz7q0
         e992X/xW6CXSCN2gPVDRymYkyZPHB7yCqiU8EYGCRF5Mqz/CpBJ9psadZ2NO6O+NGoCY
         +dKa8ynGOjshW9xecFL42wllz9VaSOMbjYsRtI+4/0N48l9LvB9FnHZs7/WcHD5Mr+94
         GRyA==
X-Gm-Message-State: AOAM532vljMdZ7RawVcnFWl3jts1JtvOhTgp5ui3n4rcWNOTabUaZnJz
        pcHRpjZVS+WEgKLoSZuL3Qo=
X-Google-Smtp-Source: ABdhPJx08XkRJYZ5Snoyj4caUt9HYFs0yuXE+4lg1DJIaR+T1Tn8uERHoAQYgJP2aukC0VXqxACSPQ==
X-Received: by 2002:a05:6870:8327:b0:dd:b065:6a80 with SMTP id p39-20020a056870832700b000ddb0656a80mr6680728oae.167.1650376556115;
        Tue, 19 Apr 2022 06:55:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m15-20020a9d644f000000b005ce0a146bfcsm5264356otl.59.2022.04.19.06.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 06:55:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <688d694f-8585-644d-41ae-028a4c0ab8ed@roeck-us.net>
Date:   Tue, 19 Apr 2022 06:55:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v1 0/2] Add driver for PAPR watchdog timers
Content-Language: en-US
To:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     bjking@linux.ibm.com, nathanl@linux.ibm.com, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
 <6c685640-ebbe-e227-a096-99d60b9d499b@ozlabs.ru>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <6c685640-ebbe-e227-a096-99d60b9d499b@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/19/22 01:49, Alexey Kardashevskiy wrote:
> 
> 
> On 14/04/2022 02:51, Scott Cheloha wrote:
>> This series adds a driver for PAPR hypercall-based watchdog timers,
>> tentatively named "pseries-wdt".
>>
>> I wanted to get some clarification on a few things before submitting
>> the series as a patch, hence the RFC.  The first patch adding the
>> hypercall to hvcall.h is straightforward, but I have questions about
>> the second patch (the driver).  In particular:
>>
>> - In pseries_wdt_probe() we register the watchdog device with
>>    devm_watchdog_register_device().  However, in pseries_wdt_remove(),
>>    calling watchdog_unregister_devce() causes a kernel panic later,
>>    so I assume this is the wrong thing to do.
> 
> 
> It should have been devm_watchdog_unregister_device() (no difference though) and what was the backtrace? Most watchdog drivers do it this way  :-/
> 

Please make yourself familiar with devm_ functions and their use.
There is no exported devm_watchdog_unregister_device() because it is
not needed.

> 
>>    Do we need to do anything to clean up the watchdog device during
>>    pseries_wdt_remove()?  Or does devm_watchdog_register_device()
>>    ensure the cleanup is handled transparently?
>>
>> - In pseries_wdt_probe(), is it incorrect to devm_kfree() my
>>    allocation in the event that devm_watchdog_register_device()
>>    fails?
> 
> I am pretty sure nothing is going to free the memory you allocated in devm_kzalloc() as you do not even pass the allocated pointer to devm_watchdog_register_device(), it is an offset. The only reason devm_kfree(&pw->wd) won't barf1 is @wd is the first member of the pseries_wdt struct.
> 

Again, please make yourself familiar with devm_ functions
and their use.

Guenter
