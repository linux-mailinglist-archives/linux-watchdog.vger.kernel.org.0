Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E21E7E41E4
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Nov 2023 15:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjKGOfF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Nov 2023 09:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjKGOfE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Nov 2023 09:35:04 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CB598
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Nov 2023 06:35:01 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a90d6ab962so67218247b3.2
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Nov 2023 06:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699367700; x=1699972500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yOrH/ReyHc7tsTPrnyaKQaed5Nb9j2/ZSpWBSo9L+k0=;
        b=jnm7KwSZZb7VA7xmf/SuqzCNmT1YUC47SbCSeT+SqD4tHK0TrSKdfgRMxyHI7WM7Ma
         Z6GqX97xEF+tr1AQo+a2+wZb56CohUEXukC0vzLE/jMHf888fZuqAYSTg/Q4MxJvyPJ+
         2z8+r5+0c2b1fZhoCtwt6jcqrVBSKLCvKALWE4UKUQKI8diZ/Bwf0rrRucYRGO/0l9/c
         yD6UixnI5XHgJLPS/QvunyNCTktqnharJ86Taw2t2pg8FOcUB7Mij1LfZr46TB9dbOEO
         paUOgXLZ/5F3hvE3OaU5iBtJHHN4oeMaHm1Mn4kNhbtmhUeeHxL32Fk5wsePNJzVgZQ+
         4Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699367700; x=1699972500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOrH/ReyHc7tsTPrnyaKQaed5Nb9j2/ZSpWBSo9L+k0=;
        b=MnqGdHXX3ba6qRajj7RdZeKggr84seK44cDm8uuTpi8i743EHNf1rUWzpmRfG8703C
         nhwvMttAURsP1Vc8IqiMxOaaAKMXM12Fq2iEbqlHV5Izk+TpxjGZFs8TNcwllhqua4qO
         WVyIHXqYpa46yGhkzhDVMCRokB9H66Z9XMmSWvPAMWKmk601GYuH0/I48UmKLPn6A4h8
         FZC+m1jc3vltulf6L7S+XCzgEFaPxuzlF7hMJfuXBhcvMP/9d4u2hhPN3c2QNtRihmwh
         qSF7bsv4dwGFZCLN26EhZ50og8CDghknf/JGGiO271hKZq1SDjISUpIORRyb82UfdNkZ
         PhqA==
X-Gm-Message-State: AOJu0YwsOHGyNDE2v2VJ4SNtr44lYuBJ8DwmyuBuJBNhoESklPSjg0Yi
        6sD/ONLLHruE+XQdtzyMaFw=
X-Google-Smtp-Source: AGHT+IGB4uE01L1xHSYq7jlK2XrXYmwKVFFLEGb9KueYf9FPXGGARj0yhIZUPFur7tmYwMANZF7msQ==
X-Received: by 2002:a05:690c:101:b0:5b3:60c2:5781 with SMTP id bd1-20020a05690c010100b005b360c25781mr15146725ywb.32.1699367700284;
        Tue, 07 Nov 2023 06:35:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j68-20020a0df947000000b00582b239674esm5646836ywf.129.2023.11.07.06.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 06:34:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <140b264d-341f-465b-8715-dacfe84b3f71@roeck-us.net>
Date:   Tue, 7 Nov 2023 06:34:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] improve it87_wdt (IT8784/IT8786) / keeping WDTCTRL
 unchanged / deactivate watchdog by setting WDTVALLSB/WDTVALMSB 0
Content-Language: en-US
To:     Werner Fischer <devlists@wefi.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Hanspeter Portner <dev@open-music-kontrollers.ch>
Cc:     linux-watchdog@vger.kernel.org
References: <87b1c97177c43eeec640483cc2f83f5f4d7b1060.camel@wefi.net>
 <fdc9d9c1cb641441cf8e0cc9d7c902951bb32115.camel@wefi.net>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fdc9d9c1cb641441cf8e0cc9d7c902951bb32115.camel@wefi.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/7/23 05:18, Werner Fischer wrote:
> Hi Guenter, hi Wim, hi Hanspeter,
> 
> On Mon, 2023-10-16 at 15:16 +0200, Werner Fischer wrote:
>> Hi Guenter, hi Hanspeter,
>>
>> I currently testing two devices with IT8784 and IT8786 watchdog
>> timers.
>> Although the chips are supported by it87_wdt.c after Hanspeter's
>> patches back in 2020, the watchdog functionality does not work in my
>> following test:
>> - Debian 12 using Kernel 6.1.58 or current 6.6-rc
>> - loading module it87_wdt
>> - starting wd_keepalive Deamon
>> - killing wd_keepalive using signal 9
>> -> system keeps on running even after the configured watchdog timeout
>>
>> For debugging purposes, I have used the patch below to report the
>> content of the watchdog registers 0x71 (WDTCTRL), 0x72 (WDTCFG), 0x73
>> (WDTVALLSB), and 0x74 (WDTVALMSB) to the system log.
>>
>> It turned out, that 0x71 (WDTCTRL) has initially the following value
>> set (before the module changes it to 0x00):
>> - 8 decimal (IT8784 / IT8786)
>> - 4 decimal (IT8613)
>>
>> I figured out, that the following code line makes the watchdog of
>> IT8784 and IT8786 non-functional for me:
>>    superio_outb(0x00, WDTCTRL);
>> I have removed this code in my patch below, then the watchdog works
>> for IT8784 and IT8786.
>>
>> I'm not sure, why the WDTCTRL register is set to 0x00 in the code. As
>> it seems, the register can have different meanings for differnt
>> IT8xxx chips. Accoring to [1] it seems sufficient to set both
>> WDTVALLSB and WDTVALMSB to 0x00 to deactivate the watchdog timer:
>> "When the WDT Time-out Value register is set to a non-zero value, the
>> WDT loads the value and begin counting down from the value."
>> This happens e.g. also when wd_keepalive is stopped cleanly.
>>
>> I am open to support to improve the it87_wdt code.
>>
>> But before I'm writing and sending a patch, I have the following
>> question:
>> * What is the reason, why WDTCTRL is set to 0x00 in the code? and
>> * Could we think about removing this (at least for IT8784/8786)?
> It seems to me that setting WDTCTRL to 0x00 has been in the code from
> the beginning.
> 
> For my test systems with IT8784 and IT8786 I got the following
> information from the system vendor:
> "71H bit 3 is the mode choice for the clock input of the IT8784/IT8786
> chip. This bit is set to 1 (= PCICLK mode) and can not be set to 0."
> Setting it to 0 breaks the watchdog functionality.
> 
> Unfortunately, ITE does not provide the specifications PDFs publicly
> anymore. But the documentation at [2] provides details regarding the

They really never did, or at least not for a long time. Some board
vendors used to be Linux-friendly and provided datasheets on request,
but that is no longer the case. My recommendation used to be, and still is,
not to use boards with Super-IO chips from ITE to run Linux. This is not
only due to lack of datasheets, but also due to the lack of support from
both chip and board vendors if there are any issues when trying to support
the chips in Linux.

> Watchdog Timer Control Register (71h) of an ITE chip, which has the
> description "External CLK_IN Select: 1: PCICLK" for bit 3, too.
> 
> As it seems system-dependent, removing
>    superio_outb(0x00, WDTCTRL);
> from the code may lead to problems with other ITE chips, which maybe
> could need WDTCTRL set to 0x00.
> 

Bit 4..7 of the register are used to control watchdog timer resets (pings).
Skipping the write entirely is therefore unacceptable even for IT8784/IT8786
because we _don't_ want activity on a (legacy) keyboard, mouse, game,
or infrared port to reset the watchdog timer.

> So my idea to be on the safe side for exiting users of it87_wdt, too:
> * What do you think about an optional module parameter to let the user
>    choose to leave WDTCTRL untouched? (this would make the watchdog work
>    e.g. with my test systems with IT8784 and IT8786, too)
> 

Make it conditional for IT8784/IT8786: On those chips, read the value from
the chip and clear all but bit 3. This is the safest we can do. Future
chips can be added as needed.

Guenter

