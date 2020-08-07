Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D711723F29F
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 20:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgHGSTd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 14:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgHGSTc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 14:19:32 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88686C061756;
        Fri,  7 Aug 2020 11:19:32 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id m34so1309884pgl.11;
        Fri, 07 Aug 2020 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fSRpWcOVF3aGowVmb2ZX9/VJomqmzBc1ofgY63/xntg=;
        b=eEEnfS7KIrgLmrPKm7m2x6fZvPAePWRcWfxSn225OD5Kj3uBTJFO6BcirJ3emnSxGP
         /1jyJNR6G8M5XvzXRNOTFsW8n8z7IqlfrsxUk5iW4DefCm/0x4//TT1k+U8MHBngP+FS
         GYuJMIaLcKeY/rjKXq6mG1djV0OZVZ+ARXRRIUOnJvhgFZxhNbDxG1s4yFfSluT+RCex
         SttPHNheT47uCmqyADVkQVrX1oaIAKRJ643lxxLXjX18iSz+K01AA31yEzdOOmf1o35G
         NdlRvvmmAkSlOJ2TijxJAHPbwPhAEWkrTNaUbxeQn5wyY/pS4oiHMYmZD7kXzKZeGztR
         BLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fSRpWcOVF3aGowVmb2ZX9/VJomqmzBc1ofgY63/xntg=;
        b=aMgh5T5ZL/SjfRDR6fTlwOt7InJ3RoVKHn6ifbry+WrvhAXgm7wyWhBGL9Dl8iQj/2
         8/zr8AvV9Q/CVd/K6zsmq00eK1DzirN/Pujv1Vd03ghG0b/gAiG02VLvYfrhEl3kCXT8
         1F8pcHcY1wYwnSFCbWd/0NPvUH5IHVk3OQdDtJEjtXJ8HFbLo3MnsAT8psqBZiuQCf9I
         khMhHY3RTswFTnL6px5vCHLwP2qTzODDyMpsCL5LNZ6Vc+yEEjdbHbNG2Odd2XkXJEGT
         aOmGMQqCPHngKFOs8gPcr8UI63P2GmiMfPBZFzIyQge2dgcTP4iVvzhdoatCjfuCd5Q1
         MlxA==
X-Gm-Message-State: AOAM530yLHgdqPwzLanqO1/fpaDpkWo6q6eh/FDKAzf81l4J8njoedfh
        2+6s+VPHq2MnXMwG1mpACbA=
X-Google-Smtp-Source: ABdhPJyAljMDuXZyrw7TJwGuspxE0CzXrRiSy0TCfNBax1QY4N/pczqZz/WFn4AUKtxVHIbWfWix8A==
X-Received: by 2002:a63:5552:: with SMTP id f18mr12042295pgm.298.1596824372139;
        Fri, 07 Aug 2020 11:19:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r25sm11292590pgv.88.2020.08.07.11.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 11:19:31 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
To:     Florian Fainelli <f.fainelli@gmail.com>,
        madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net>
 <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <12bde31e-e1d5-584c-8120-a43f54794536@roeck-us.net>
Date:   Fri, 7 Aug 2020 11:19:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/7/20 11:08 AM, Florian Fainelli wrote:
> 
> 
> On 8/7/2020 9:21 AM, Guenter Roeck wrote:
>> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>>> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>
>>> In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>>> after misc_register(), hence if ioctl is called before its
>>> initialization which can call rdc321x_wdt_start() function,
>>> it will see an uninitialized value of rdc321x_wdt_device.queue,
>>> hence initialize it before misc_register().
>>> Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>>> function called from write callback, thus initialize it before
>>> misc_register().
>>>
>>> Found by Linux Driver Verification project (linuxtesting.org).
>>>
>>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Having said that ... this is yet another potentially obsolete driver.
>> You are really wasting your (and, fwiw, my) time.
>>
>> Florian, any thoughts if support for this chip can/should be deprecated
>> or even removed ?
> 
> I am still using my rdc321x-based SoC, so no, this is not obsolete as
> far as I am concerned, time permitting, modernizing the driver is on my
> TODO after checking/fixing the Ethernet driver first.
> 

Ok, fair enough.

> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 

Thanks,
Guenter
