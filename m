Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBA637A604
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 13:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhEKLtV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 07:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46957 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231465AbhEKLtU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 07:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620733694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tCTd+S2Axg2X1q7f2AmsrNqMwgII9y4Yy/+j9XgTu+E=;
        b=Fj5+kR1LJgadz7sTIhDZjJ2YVjyRGrbmTl4MXsm9A/Ea/t9Mh//IZbpzY9NaZ6SMsEmUja
        102W88HF+4bboXUXLGFasAymz7fbFtDgG7GIAirIL9PqArLpSeDKAyWXRqwbqxVh42shbo
        HSEaWuDEMswxEpiWP0urDsJj6s+IPWY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-k_J4sSnDMXqvFULeQhuwKw-1; Tue, 11 May 2021 07:48:12 -0400
X-MC-Unique: k_J4sSnDMXqvFULeQhuwKw-1
Received: by mail-ej1-f72.google.com with SMTP id f8-20020a1709068248b02903a8adf1f5c2so4762047ejx.19
        for <linux-watchdog@vger.kernel.org>; Tue, 11 May 2021 04:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tCTd+S2Axg2X1q7f2AmsrNqMwgII9y4Yy/+j9XgTu+E=;
        b=oYmZc76hZH3dcEjaHXQh6L6d1Q68wdJ7y+wD8t/pKUtKYpuAsRS47JFg+3Tqr7NXwU
         cWe0zcltpc3dSbGmUfmfos5hoP8deHqZ4FL1GpwgDv3JUoedIhNf04NsFseLzMUuMR+K
         CArqpP6Ca0aQvi1q3tb90Yp7OIlsfySoti+nv8lFX6zj1KDwWqRHSuRsw9qskb+AWWhb
         V9hWTldVwFpRhaBklNjEAmUtsTdWJqQJxdWH+x6icWDU5IUgGBQKrCWTzQ1WelMPFQd5
         DyYAbZmjG4mSocIVhwp8Ze5NVajJab/rOitWqPajKYdZUY0i9gmdGYLTOzFSlOnJ/+ML
         gPPw==
X-Gm-Message-State: AOAM530PG5x26gtKFrBwlF/+iL7ZciJgRg49dnzMni8BdgUikrWUkckV
        CsQaTV3gcvp5NyYkOE1cFTLch6wrrnqzTBxL9eJWzvt/dsltZ7Gv/jT8ThXGBATMV3DXHaVDDlS
        cJXBYXdTT6nGfSZ6XKfcIai99PFA=
X-Received: by 2002:a17:907:f91:: with SMTP id kb17mr30722708ejc.521.1620733691343;
        Tue, 11 May 2021 04:48:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK1wG8GPs1uiWXaXij0uLW/nSHZ5xv/Mp/aP4/ksfEpDozfyQJa04/xi8Vel+362v042qcCA==
X-Received: by 2002:a17:907:f91:: with SMTP id kb17mr30722691ejc.521.1620733691162;
        Tue, 11 May 2021 04:48:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ga28sm11316864ejc.20.2021.05.11.04.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 04:48:10 -0700 (PDT)
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
 controller entry
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     andy.shevchenko@gmail.com, chia-lin.kao@canonical.com,
        corbet@lwn.net, devicetree@vger.kernel.org, jdelvare@suse.com,
        lee.jones@linaro.org, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        robh+dt@kernel.org, wim@linux-watchdog.org
References: <cf181436-152c-7cd8-76cf-350705cd2bcb@redhat.com>
 <20210507115319.22109-1-campion.kang@advantech.com.tw>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0a64dcbd-25d6-ddcd-4a4e-18619e8270ba@redhat.com>
Date:   Tue, 11 May 2021 13:48:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210507115319.22109-1-campion.kang@advantech.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 5/7/21 1:53 PM, Campion Kang wrote:
> Hi, Very thanks your time for reviewing.
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Thursday, May 6, 2021 5:39 PM
>> Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
>> controller entry
>>
>> Hi,
>>
>> On 5/6/21 11:23 AM, Andy Shevchenko wrote:
>>> On Thu, May 6, 2021 at 11:48 AM Hans de Goede <hdegoede@redhat.com>
>> wrote:
>>>> I'm replying here since this series has no cover-letter, for
>>>> the next version for a series touching so many different
>>>> sub-systems it would be good to start with a cover-letter
>>>> providing some background info on the series.
>>>>
> 
> Sorry about that, i will study what is cover-letter and its content.
> Would you kindly provide me a good reference?
> Can I resend a [Patch v7 0/7] for these patch or provide it in next version?

Please add a cover letter to the next version, which will hopefully
also address some of the other remarks already made.

Regards,

Hans


> 
> 
>>>> I see this is binding to an ACPI device, yet it is also using
>>>> devicetree bindings and properties.
>>>>
>>>> So I take it this means that your ACPI tables are using the
>>>> optional capability of embedded device-tree blobs inside the
>>>> ACPI tables ?
>>>>
>>>> That is an unusual combination on a x86 device, note it is
>>>> not wrong
>>>
>>> It's actually not okay. We have agreed at some point with DT people,
>>> that ACPI should not use non-native variants of natively supported
>>> things. For example, it shouldn't use "interrupt" property for IOxAPIC
>>> (or xIC) provided interrupts, rather Interrupt() has to be used and so
>>> on.
> 
> In our experience, most risc platforms are using devicetree, and x86/64 platforms
> are using ACPI table or grub configure for their specific settings in different HW paltform.
> In this case, EC chip is a LPC interface that can be integrated in whenever risc or x86/64.
> So in my understand, I think it is not conflict.
> (please correct me if i am misunderstanding, i will try to describe more)
> 
> If the EC chip is connected to the risc processor, we will bind its properties in the device-tree without modifing the source.
> If the EC chip is connected to the X86/64 processor, we bind its the properties in the ACPI table and also without modifing the source.
> Why do we need to bind the properties in ACPI or in the device-tree? Because it is an LPC interface, it cannot automatically load the driver like a USB or PCI device.
> In the early days, we had to install the EC driver module in our HW platform and manually load it at every boot. Different Advantech HW platforms have different properties for HWMON and others sub-systems. This causes the EC source to be a bit dirty. It is necessary to obtain the hardware platform name from the BIOS DMI table and determine its attributes according to its platform name.
> Now bind the attributes to ACPI table or device-tree, the EC source is more clear and universal for Advantech devices, and it is important that if the ACPI table matches, it can be automatically loaded.
> 
>>
>> Right, but that is not the case here, they are using 2 device-tree
>> properties (1), from patch 3/7:
>>
>> +properties:
>> +  compatible:
>> +    const: advantech,ahc1ec0
>> +
>> +  advantech,hwmon-profile:
>> +    description:
>> +      The number of sub-devices specified in the platform. Defines for the
>> +      hwmon profiles can found in dt-bindings/mfd/ahc1ec0-dt.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maxItems: 1
>> +
>> +  advantech,has-watchdog:
>> +    description:
>> +      Some implementations of the EC include a watchdog used to monitor
>> the
>> +      system. This boolean flag is used to specify whether this watchdog is
>> +      present or not. Default is true, otherwise set to false.
>> +    type: boolean
>>
>>
>>>> but AFAIK you are the first to do this on x86.
>>>
>>> No, not the first. Once Intel tried to invent the pin control
>>> configuration and muxing properties in ACPI, it was luckily rejected
>>> (ACPI 6.x OTOH provides a set of special resources for that).
>>>
>>> So, NAK from me, *if* it's really the case. ACPI tables must be revisited.
>>
> 
> I am not sure it supports vendor self-defined attributes for ACPI table?
> 
>> AFAIK Advantech are not defining things for which an ACPI standard exists,
>> although these 2 properties might just as well may be 2 simple ACPI integer
>> methods, which would actually make things a bit simpler (.e.g it would
>> allow dropping patch 2/7 and 3/7 from the set).
>>
>> Campion, any reason why you went this route; and can the ACPI tables
>> still be changed?
>>
> 
> If patches 2/7 and 3/7 are removed, it will be even simpler.
> This means that there is no device-tree binding designed, in fact, the EC chip only be integrated in the x86/64 platform at present.
> Sorry, ACPI table now is integrated in the BIOS for Advantech UNO device, 
> it may be revert to previous rule, that is, there is no ACPI table binding and manually loaded the EC driver. If you have any suggestons I would be very grateful.
> 
>> Regards,
>>
>> Hans
> 

