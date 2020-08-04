Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219B023BEC0
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 19:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbgHDRTD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 13:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbgHDRTB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 13:19:01 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D898CC06174A;
        Tue,  4 Aug 2020 10:19:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id d4so2557437pjx.5;
        Tue, 04 Aug 2020 10:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U5FdYHnQn4brLQ5hjMPpg6pLPZ1R2CW8fGxgTfmznHs=;
        b=Qeu8DaXiAWiQjycLoHzq7YLRiTFai89xMgzzO5pg465Z3D1jbcSXKU7+/eFSByQB1T
         tqbkV8SR4BNC2fm0zNxH2MZ+jFxPV3D8NpwP4X1V2T4Jo9fuSriD4npae6n6+gzZ4TmG
         JJAmoH1xcxzw4LPx1wfOFNbpV/ea4v6myz4kEVrBoQv8C9zDGFItQDQA8I3lPbmBWpt5
         ktxeNXoRgxDBCaSFv9dwZDlKunEDKKOE4fBxSCWr4Xwyj1lkwjseBnYF9LNWYe3/qtg2
         dVh1I0OmlqYlhdbdLvnPMDWPknF5dfan+I202dt0gWU2pGca1FL83c9TGWmFBeSC2GWG
         uzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=U5FdYHnQn4brLQ5hjMPpg6pLPZ1R2CW8fGxgTfmznHs=;
        b=tFU/M2LLJ7CDBhFimo401LKsYt1U4198qLlGJE7H7l4YqKL/C35ptFVfv4subZ9EPk
         5+AKmLOPhJ/kUoQNSuqc5ZG5vB3VMqwP5S9+RhAP9ZEegSMXnhNqq55DNXozLXf6IEkC
         7s45ZJ3imuF0Is17BFhsCFc7sh6y3FYbspjDlhwNTirvcXhVgy+BSvt692NzfNOXggsu
         vhksMFmuKaUf4RltZ5wZMBJ0CoQO25WaadMuXxqJj6HW7nAjAgH1KwcaQH/n8szeYKao
         cZ71afb2Agn/XC6f3SkHdun9tKyiGDf4cYBK7pDTc/7RvB8c8Aeo/Mm6vBE8UBMoJ24U
         Vung==
X-Gm-Message-State: AOAM5322RP5BTkUu1xrNlVaQuzh4VWgyhPUZ+CIdyzVr6Pg8u8+PCEA8
        QEEAm1bexzWpBDo5DqBMXtSICJih
X-Google-Smtp-Source: ABdhPJxPHiarJ0+BxSJf9vz0js5Mmk6WC53mN/v2unDxZKL3y1q9JlInswKTs+oOwyFAZwZEWHBjQg==
X-Received: by 2002:a17:90b:4b89:: with SMTP id lr9mr5763097pjb.190.1596561539604;
        Tue, 04 Aug 2020 10:18:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y135sm13064000pfg.148.2020.08.04.10.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 10:18:58 -0700 (PDT)
Subject: Re: iTCO watchdog last reboot reason?
To:     Naveen Kumar P <naveenkumar.parna@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAMciSVWzH3fuo8eStwRUwGJ+VsJjctLucOZo-EVx07ktXzObFA@mail.gmail.com>
 <83ff62ab-42c8-df6c-32c1-c1df2f8cda7a@roeck-us.net>
 <CAMciSVVq7LL+c6Va1xqcCfMMMqcM9+3DXsOi+6cyqjPfdLgpGA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <b5123504-7ed0-1a4b-e796-6a9a7f91419e@roeck-us.net>
Date:   Tue, 4 Aug 2020 10:18:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMciSVVq7LL+c6Va1xqcCfMMMqcM9+3DXsOi+6cyqjPfdLgpGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/4/20 10:09 AM, Naveen Kumar P wrote:
> On Tue, Aug 4, 2020 at 9:45 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 8/4/20 7:41 AM, Naveen Kumar P wrote:
>>> [ Please keep me in CC as I'm not subscribed to the list]
>>>
>>> Hi everyone,
>>>
>>> I enabled the iTCO watchdog in my Linux system.
>>>
>>> sudo cat /dev/watchdog perfectly reboots my system. But, is there a
>>> way to find out on each boot if the machine was rebooted due to a
>>> watchdog timeout or not?
>>>
>>> Any ideas?
>>>
>>
>> If the hardware supports it, the driver could set the reboot reason
>> in its probe function.
> Thank you Guenter for the quick response. Can you please point me to
> the corresponding patch?

I didn't say that one exists, nor that it is possible to actually implement
what I suggested. I only stated a possibility. Please feel free to implement,
test, and submit such a patch yourself.

Thanks,
Guenter
