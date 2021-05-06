Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E519C3751A7
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 11:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhEFJjw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 05:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56012 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234023AbhEFJju (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 05:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620293932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p52RRVDShx6NwBL9aQkjgj+5ixdcF28Fa0Bi2oa7Re8=;
        b=b5yCJwyzQ4QwWO+GlTP+tgyNSQ/t+PqyW+w12dfytqIPw0qpu1tQkOm1100NUZWvRcDZHR
        4BFrSu5SuY5XaeFypC0MdYGq8BKhNlLwVFLcIjJH/rcrcG61XaSbb1lLfnAqkuNblAd8cx
        dVcZ/stxbwNkISVQsopvf9uOMktmkfg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-eeKyiffmNdmGom5Ixk_diw-1; Thu, 06 May 2021 05:38:49 -0400
X-MC-Unique: eeKyiffmNdmGom5Ixk_diw-1
Received: by mail-ej1-f71.google.com with SMTP id cs18-20020a170906dc92b02903a8adf202d6so400985ejc.23
        for <linux-watchdog@vger.kernel.org>; Thu, 06 May 2021 02:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p52RRVDShx6NwBL9aQkjgj+5ixdcF28Fa0Bi2oa7Re8=;
        b=VbcTmOnD7GE3mkCSYHaWZEou/ENWKzm0AfQkAEqKUjaAfPJeHRvnFMCBsQc0HGCaKK
         GrP2iOpWw22FdoSnqgUOSWiuX7/a3wTeoYKeRaiQiDg3wFQyqrLkPRKvXPeuImMLFuJm
         N6sHOBUMr7rgQT691wEKz6UwLrjs9w1u77tdYXEASxfVv8nTc9DpV4mqvjrOJmEPGhxe
         bvZmEp+OjCJubw5urIEoKAILnv4GbJo7nsoZJHyzBFUen1tNCGwtPM2/dOSwj0sr7qR7
         xhpmeUbmxo2Iqo5OZHjS16pf8TO60YQ7M2r87xGeJvTpLJVVjxucNb9qhAoq4Ow7bU1G
         CAuw==
X-Gm-Message-State: AOAM531ZspPrr2zNY101L73nRSK5gJVPJANc1dh90AqxrWA32/QD1HpF
        mvW7irgVPy1EkIzeS2olvE/7rW0Y3inQSgUmm+jC/rRiw5sSnZkqrL9ZjEuUeZKbTbyqZswo0c5
        TWAizmxEv1Btbgi4e1qpkCDbPZx4=
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr4064236eds.220.1620293927880;
        Thu, 06 May 2021 02:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+4qyVOHI06BR7s1AYqjMSV9ZbPDO6ac3yUuTtnTY2Clx45ALcLve0fnR6T0PF02cdmOccWQ==
X-Received: by 2002:aa7:d84e:: with SMTP id f14mr4064221eds.220.1620293927722;
        Thu, 06 May 2021 02:38:47 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e4sm1015832ejh.98.2021.05.06.02.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 02:38:47 -0700 (PDT)
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
 controller entry
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Campion Kang <campion.kang@advantech.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
 <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
 <CAHp75VdPmkKTf_fbjAjrD3GC1ZZLuYsTJa0QtA3tuYtWwCgPMQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cf181436-152c-7cd8-76cf-350705cd2bcb@redhat.com>
Date:   Thu, 6 May 2021 11:38:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdPmkKTf_fbjAjrD3GC1ZZLuYsTJa0QtA3tuYtWwCgPMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 5/6/21 11:23 AM, Andy Shevchenko wrote:
> On Thu, May 6, 2021 at 11:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> I'm replying here since this series has no cover-letter, for
>> the next version for a series touching so many different
>> sub-systems it would be good to start with a cover-letter
>> providing some background info on the series.
>>
>> I see this is binding to an ACPI device, yet it is also using
>> devicetree bindings and properties.
>>
>> So I take it this means that your ACPI tables are using the
>> optional capability of embedded device-tree blobs inside the
>> ACPI tables ?
>>
>> That is an unusual combination on a x86 device, note it is
>> not wrong
> 
> It's actually not okay. We have agreed at some point with DT people,
> that ACPI should not use non-native variants of natively supported
> things. For example, it shouldn't use "interrupt" property for IOxAPIC
> (or xIC) provided interrupts, rather Interrupt() has to be used and so
> on.

Right, but that is not the case here, they are using 2 device-tree
properties (1), from patch 3/7:

+properties:
+  compatible:
+    const: advantech,ahc1ec0
+
+  advantech,hwmon-profile:
+    description:
+      The number of sub-devices specified in the platform. Defines for the
+      hwmon profiles can found in dt-bindings/mfd/ahc1ec0-dt.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  advantech,has-watchdog:
+    description:
+      Some implementations of the EC include a watchdog used to monitor the
+      system. This boolean flag is used to specify whether this watchdog is
+      present or not. Default is true, otherwise set to false.
+    type: boolean


>> but AFAIK you are the first to do this on x86.
> 
> No, not the first. Once Intel tried to invent the pin control
> configuration and muxing properties in ACPI, it was luckily rejected
> (ACPI 6.x OTOH provides a set of special resources for that).
> 
> So, NAK from me, *if* it's really the case. ACPI tables must be revisited.

AFAIK Advantech are not defining things for which an ACPI standard exists,
although these 2 properties might just as well may be 2 simple ACPI integer
methods, which would actually make things a bit simpler (.e.g it would
allow dropping patch 2/7 and 3/7 from the set).

Campion, any reason why you went this route; and can the ACPI tables
still be changed? 

Regards,

Hans

