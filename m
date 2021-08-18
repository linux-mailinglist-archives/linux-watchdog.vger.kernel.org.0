Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045E03F0CD5
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 22:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbhHRUf0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 16:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbhHRUf0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 16:35:26 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65641C061764;
        Wed, 18 Aug 2021 13:34:51 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so1090975ooq.9;
        Wed, 18 Aug 2021 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Ve2qXUvVG1g/FHypMlz1AcAcLOtOAXueWHwDO5ReDY=;
        b=cY0Go6/qB3WGaGerkculzpd1mi7htexGDJ8vjhkyrIHCIxgE4R2XL5SLmD5ndYz3Iq
         9qW41cuGb51KIidZ2NBKOAJtxDicQrJ/LIoFgACGDNejv0DujMakf7+v6jNkRfWkjJ3e
         0YcfuHrb/yIiXa0YFmq5UaqVpv539DcPCnoxC1zKDBLK/BLl96zJVZjK4JzPedNJJKJy
         Y/2/oHJQVm3iZ62nA18DL9jJZMkDQdo/oCXsFyINq84h5jpjC3e6V13uMZJGRM35RPrk
         8B7dObnoStCEWIFokiOYBe+AqCPwcANOb3ty7wcHjwspcNho9QfYR95w6tJwqHKGmcK1
         tW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Ve2qXUvVG1g/FHypMlz1AcAcLOtOAXueWHwDO5ReDY=;
        b=EHxC71IHTbgzDFDOqkxyAyOIyU7uYR0ZD1e9joy+m8M4UgyboI/q1b0NsgBDuppbWo
         Hbgqih1LLeT3c7Zh0m3frUMq/xZrcoeL+xZVhqfUpn10SHl9wPhci2+pR0ZNfkzfHHyO
         QSOCoerxbi63gjFoj1Su6GwU2xVYGtSXyI+aSFocbIUJr4X/c1UDgopu57Tcb68aNY+t
         J6+gg1xsRT4CbET1gBEz5vyKPjdFm3CLJw31KraxcDfn1W13xwzby+2Q11OV2yRS9jrC
         b7jFowLfpIkNI4Fw5dNrJ2mShMlG9f0a2xxxBta0wM0TRT6fTtQLOram/hQXMl2fbXJV
         QexQ==
X-Gm-Message-State: AOAM530ajWJJ5BS8/x5fHkbhzhAB1I797NBSjDezG6ohryeoihpxHxir
        SgictUMv7KuM5hBeRBCSRxx13zIfxDQ=
X-Google-Smtp-Source: ABdhPJzZjs7NkPCLV2PjCE4YhE7Nkzpq/+l/UxNvtoQzVqp7hxQaN0vWEqsCA30AQbvD/Ngks3+oiA==
X-Received: by 2002:a4a:b601:: with SMTP id z1mr8160473oon.7.1629318890688;
        Wed, 18 Aug 2021 13:34:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v29sm179058ooe.31.2021.08.18.13.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 13:34:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] Watchdog: sp5100_tco: Replace watchdog cd6h/cd7h port I/O
 accesses with MMIO accesses
To:     Terry Bowman <Terry.Bowman@amd.com>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        rrichter@amd.com, thomas.lendacky@amd.com
References: <20210813213216.54780-1-Terry.Bowman@amd.com>
 <416a67a7-646b-eb8d-b617-80cbbbc028c6@roeck-us.net>
 <396d4558-9ddf-55e8-75bf-cb1a15de393a@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b32c2263-94a1-fef5-4455-6d7bef40a968@roeck-us.net>
Date:   Wed, 18 Aug 2021 13:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <396d4558-9ddf-55e8-75bf-cb1a15de393a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/16/21 2:29 PM, Terry Bowman wrote:
> 
> 
> On 8/13/21 5:37 PM, Guenter Roeck wrote:
>> On 8/13/21 2:32 PM, Terry Bowman wrote:
>>> Use MMIO instead of port I/O during SMBus controller address discovery.
>>> Also, update how EFCH capability is determined by replacing a family check
>>> with a PCI revision ID check.
>>>
>>> cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read accesses to
>>> disabled cd6h/cd7h port I/O will return F's and written data is dropped.
>>> The recommended workaround to handle disabled cd6h/cd7h port I/O is
>>> replacing port I/O with MMIO accesses. The MMIO access method has been
>>> available since at least SMBus controllers using PCI revision 0x59.
>>>
>>> The sp5100_tco driver uses a CPU family match of 17h to determine
>>> EFCH_PM_DECODEEN_WDT_TMREN register support. Using a family check requires
>>> driver updates for each new AMD CPU family following 17h. This patch
>>> replaces the family check with a check for SMBus PCI revision ID 0x59 and
>>> later. Note: Family 17h processors use SMBus PCI revision ID 0x59. The
>>> intent is to use the PCI revision ID check to support future AMD processors
>>> while minimizing required driver changes. The caveat with this change is
>>> the sp5100_tco driver must be updated if a new AMD processor family changes
>>> the EFCH design or the SMBus PCI ID value doesn't follow this pattern.
>>>
>>> Tested with forced WDT reset using `cat >> /dev/watchdog`.
>>>
>>
>> I am sorry, I don't understand why the new code can not use devm functions,
>> why the new data structure is necessary in the first place, and why it is
>> not possible to improve alignment with the existing code. This will require
>> a substantial amount of time to review to ensure that the changes are not
>> excessive (at first glance it for sure looks like that to me).
>>
>> Guenter
>>
> 
> Hi Guenter,
> 
> I can change the patch to use devm functions as you mentioned. My
> understanding is the patch's reservation and mapping related functions
> are the focus. I originally chose not to use devm functions because the
> patch's MMIO reserved and mapped resources are not held for the driver
> lifetime as is the case for most device managed resources. The
> sp5100_tco driver must only hold these MMIO resources briefly because
> other drivers use the same EFCH MMIO registers. An example of another
> driver using the same registers is the piix4_smbus driver (drivers/i2c
> /busses/i2c-piix4.c). This patch can be changed to use the devm
> functions but the driver may not benefit from the device management.
> 
> The 'struct efch_cfg' addition is needed for MMIO reads/writes as well
> as during cleanup when leaving sp5100_region_setup(). This structure was
> chosen to contain the data instead of passing multiple parameters to
> each EFCH function called.
> 
> Do you have any recommendations for how to best improve the alignment?
> 

Overall it seems to me that it might make more sense to implement this
as new driver instead of messing with the existing driver. Have you
thought about that ?

Guenter
