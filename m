Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC2E3764B5
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 May 2021 13:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhEGLyi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 May 2021 07:54:38 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:64313 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhEGLyh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 May 2021 07:54:37 -0400
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te654cd0384ac14110e2488@ACLMS4.ADVANTECH.CORP>;
 Fri, 7 May 2021 19:53:20 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May
 2021 19:53:19 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     <hdegoede@redhat.com>
CC:     <andy.shevchenko@gmail.com>, <campion.kang@advantech.com.tw>,
        <chia-lin.kao@canonical.com>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <jdelvare@suse.com>,
        <lee.jones@linaro.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux@roeck-us.net>,
        <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
        <robh+dt@kernel.org>, <wim@linux-watchdog.org>
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded controller entry
Date:   Fri, 7 May 2021 19:53:19 +0800
Message-ID: <20210507115319.22109-1-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cf181436-152c-7cd8-76cf-350705cd2bcb@redhat.com>
References: <cf181436-152c-7cd8-76cf-350705cd2bcb@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 4B8C7CD8814247C1F67AD58EF2BF9FAF5F4E7C8A84C91213BA7094E79A2771972000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Very thanks your time for reviewing.

>-----Original Message-----
>From: Hans de Goede <hdegoede@redhat.com>
>Sent: Thursday, May 6, 2021 5:39 PM
>Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
>controller entry
>
>Hi,
>
>On 5/6/21 11:23 AM, Andy Shevchenko wrote:
>> On Thu, May 6, 2021 at 11:48 AM Hans de Goede <hdegoede@redhat.com>
>wrote:
>>> I'm replying here since this series has no cover-letter, for
>>> the next version for a series touching so many different
>>> sub-systems it would be good to start with a cover-letter
>>> providing some background info on the series.
>>>

Sorry about that, i will study what is cover-letter and its content.
Would you kindly provide me a good reference?
Can I resend a [Patch v7 0/7] for these patch or provide it in next version?


>>> I see this is binding to an ACPI device, yet it is also using
>>> devicetree bindings and properties.
>>>
>>> So I take it this means that your ACPI tables are using the
>>> optional capability of embedded device-tree blobs inside the
>>> ACPI tables ?
>>>
>>> That is an unusual combination on a x86 device, note it is
>>> not wrong
>>
>> It's actually not okay. We have agreed at some point with DT people,
>> that ACPI should not use non-native variants of natively supported
>> things. For example, it shouldn't use "interrupt" property for IOxAPIC
>> (or xIC) provided interrupts, rather Interrupt() has to be used and so
>> on.

In our experience, most risc platforms are using devicetree, and x86/64 platforms
are using ACPI table or grub configure for their specific settings in different HW paltform.
In this case, EC chip is a LPC interface that can be integrated in whenever risc or x86/64.
So in my understand, I think it is not conflict.
(please correct me if i am misunderstanding, i will try to describe more)

If the EC chip is connected to the risc processor, we will bind its properties in the device-tree without modifing the source.
If the EC chip is connected to the X86/64 processor, we bind its the properties in the ACPI table and also without modifing the source.
Why do we need to bind the properties in ACPI or in the device-tree? Because it is an LPC interface, it cannot automatically load the driver like a USB or PCI device.
In the early days, we had to install the EC driver module in our HW platform and manually load it at every boot. Different Advantech HW platforms have different properties for HWMON and others sub-systems. This causes the EC source to be a bit dirty. It is necessary to obtain the hardware platform name from the BIOS DMI table and determine its attributes according to its platform name.
Now bind the attributes to ACPI table or device-tree, the EC source is more clear and universal for Advantech devices, and it is important that if the ACPI table matches, it can be automatically loaded.

>
>Right, but that is not the case here, they are using 2 device-tree
>properties (1), from patch 3/7:
>
>+properties:
>+  compatible:
>+    const: advantech,ahc1ec0
>+
>+  advantech,hwmon-profile:
>+    description:
>+      The number of sub-devices specified in the platform. Defines for the
>+      hwmon profiles can found in dt-bindings/mfd/ahc1ec0-dt.
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+    maxItems: 1
>+
>+  advantech,has-watchdog:
>+    description:
>+      Some implementations of the EC include a watchdog used to monitor
>the
>+      system. This boolean flag is used to specify whether this watchdog is
>+      present or not. Default is true, otherwise set to false.
>+    type: boolean
>
>
>>> but AFAIK you are the first to do this on x86.
>>
>> No, not the first. Once Intel tried to invent the pin control
>> configuration and muxing properties in ACPI, it was luckily rejected
>> (ACPI 6.x OTOH provides a set of special resources for that).
>>
>> So, NAK from me, *if* it's really the case. ACPI tables must be revisited.
>

I am not sure it supports vendor self-defined attributes for ACPI table?

>AFAIK Advantech are not defining things for which an ACPI standard exists,
>although these 2 properties might just as well may be 2 simple ACPI integer
>methods, which would actually make things a bit simpler (.e.g it would
>allow dropping patch 2/7 and 3/7 from the set).
>
>Campion, any reason why you went this route; and can the ACPI tables
>still be changed?
>

If patches 2/7 and 3/7 are removed, it will be even simpler.
This means that there is no device-tree binding designed, in fact, the EC chip only be integrated in the x86/64 platform at present.
Sorry, ACPI table now is integrated in the BIOS for Advantech UNO device, 
it may be revert to previous rule, that is, there is no ACPI table binding and manually loaded the EC driver. If you have any suggestons I would be very grateful.

>Regards,
>
>Hans
