Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E9A380B00
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 May 2021 16:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhENOFs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 May 2021 10:05:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43764 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbhENOFr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 May 2021 10:05:47 -0400
Received: from mail-vk1-f198.google.com ([209.85.221.198])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lhYQc-00034B-F7
        for linux-watchdog@vger.kernel.org; Fri, 14 May 2021 14:04:34 +0000
Received: by mail-vk1-f198.google.com with SMTP id b188-20020a1f34c50000b02901fb4237dbbaso2214447vka.17
        for <linux-watchdog@vger.kernel.org>; Fri, 14 May 2021 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QU/Hksxi2+pFDWpDvWUPYqDD7PqBm7YcgQmJYrRUtOY=;
        b=jG+WwC5EzJYqw+z4pDZibmSvZgq5Sx6qcwpwr3XBV30yIepvnMGvu49uKM4wPHJUOm
         BSzO4zXIkjdENRx1IUWNPx4Iqw5hRko8qdv2R7GNEv9OLEflx1+UqKS3IBeOzJTp+bZ1
         wHGAidPrbRU5hIXYBddR5Y5QLiGv4zfRMbjXm+a4P0CFTE4XnOwtD2q2NdiZOHeUPGFB
         WQTKQx1ka1FBJdtVQRU2/SOTyAuGQ41ykfCRo8IlZsmhx0lTo2tV6qA55S3UpGGC1TRg
         HbkpNGDbm5npB8RBIJz+LrasXMeE30GyoPIC+7tNfFF8zChs6QR0djL7eMhtohPIE8AQ
         TQeQ==
X-Gm-Message-State: AOAM533faUSrmE9KeEM1b6qSato3sO5mqIvoKLRUATQxQrWg3m3puKNF
        DshK6W5SqJ1mzJUTqQQCurmOtaXKB43Y+C1H73hyd5gI93dNrDIOkWZHbfrECTWLd0HW06s6qJ/
        sned42svxFs8fYx0wbLDNxNju+4wwSfrM8mcqQRXxKZND
X-Received: by 2002:a1f:160c:: with SMTP id 12mr37650306vkw.25.1621001073613;
        Fri, 14 May 2021 07:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwylx1xY4Sf3udb6i6sdh04vHdujnzpZFF+f+9W/4TRbEFNhRCcUwNy8maLRsZ7g612dyKCKA==
X-Received: by 2002:a1f:160c:: with SMTP id 12mr37650275vkw.25.1621001073395;
        Fri, 14 May 2021 07:04:33 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id b2sm851232uaq.16.2021.05.14.07.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 07:04:32 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel test robot <lkp@intel.com>
References: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
 <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a15e7f62-12a0-1ec7-5104-f01f9e3eccc7@canonical.com>
Date:   Fri, 14 May 2021 10:04:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 14/05/2021 09:48, Guenter Roeck wrote:
> On 5/14/21 6:17 AM, Krzysztof Kozlowski wrote:
>> When rt2880_wdt watchdog driver is built as a module, the
>> rt_sysc_membase needs to be exported (it is being used via inlined
>> rt_sysc_r32):
>>
>>    ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> I don't see a recent change in the code. Has that problem been there
> all along ?

I think the problem was there always but 0-day builder did not hit it
until recently:
https://lore.kernel.org/lkml/202105082122.yrF7ploN-lkp@intel.com/


Best regards,
Krzysztof
