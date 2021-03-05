Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB86E32EFCB
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 17:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhCEQO6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 11:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37778 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231241AbhCEQOe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 11:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614960874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gGF2B9jC4mRRbN7Sez5okSBrNKXE5BxhZsBexlqjeas=;
        b=Iw3bICcVjpaUthAoFJRhAEpUkBLhIAtj/3RnH0GFYc5BWfYvfwN5cXJ81sJ4R87IS0djtE
        eWC7EY28l+FxlGEOHyyzTRBLe7Xza898NdIhlM5R3YWBEnxnbVjQ2M678k3/tctg3Wb0rR
        TQzo6zNcdf6575dlNRy13T0PwuSPPBk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-o0S6ZW8ZPriF3Ra9hZWilw-1; Fri, 05 Mar 2021 11:14:32 -0500
X-MC-Unique: o0S6ZW8ZPriF3Ra9hZWilw-1
Received: by mail-ej1-f72.google.com with SMTP id si4so1064005ejb.23
        for <linux-watchdog@vger.kernel.org>; Fri, 05 Mar 2021 08:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gGF2B9jC4mRRbN7Sez5okSBrNKXE5BxhZsBexlqjeas=;
        b=bjRraKbl6aFVlJHKX9uHnDvVK0uNqL+2GVwY5+p6HxOFkjkTlBdlfGbUXu8Pqs7WKi
         Xn5ueuCbDrAI3/la3vE4VlRdPFhgYOwzyqYY0MFTWS6QjYMvEqt/CRE0hozw0j/ujcSY
         ExBXyvDj7GDwg8fyAmhCPpc70oIRtYpCexbiohK2X07aR2KpnhsBwy/uvNpP1gvQe524
         W7wOZh/fPYrGH4mWkblfeFeeAqtYx3JXZLJVmD188w+B9xhvLnwfPFc7Qc0x7T9pCEpH
         j+7u8hNnFZzmwK9dBeqSHq6bzWldqz1eaMNxAZFk9wlPUbWOqjWMmMPOk1YD3i5e/s2l
         wJKg==
X-Gm-Message-State: AOAM530/4ZJxwSDtQyjKDoz1suDoR674wIQrMETx25M1NhYJCTO4Nqik
        82pQBaC1+rsIzWihJubAyWHPkOBePibOWkFiRjAiPNR7gIObZNLJbxzWfLmX6N0lcUSjlQ6QeJK
        dKEN4sjUR1kamfgFZqdgmLT7shyY=
X-Received: by 2002:a17:906:2dda:: with SMTP id h26mr2845475eji.163.1614960871418;
        Fri, 05 Mar 2021 08:14:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+qwkCCU1ZThE1lqkMQEpKaShKnxdYkrIqoIcjTX9NcDSTzTVYQJxqtGGbJ78ONvj8GRUExQ==
X-Received: by 2002:a17:906:2dda:: with SMTP id h26mr2845463eji.163.1614960871253;
        Fri, 05 Mar 2021 08:14:31 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id de17sm1715896ejc.16.2021.03.05.08.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 08:14:30 -0800 (PST)
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com>
 <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com>
 <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ec54b2ba-3eb2-0981-e409-4d8f9d3e45c1@redhat.com>
Date:   Fri, 5 Mar 2021 17:14:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 3/5/21 4:42 PM, Andy Shevchenko wrote:
> On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 3/4/21 11:11 AM, Andy Shevchenko wrote:
>>> On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
>>> <henning.schild@siemens.com> wrote:
> 
> ...
> 
>>>> +u32 simatic_ipc_get_membase0(unsigned int p2sb)
>>>> +{
>>>> +       u32 bar0 = 0;
>>>
>>>> +#ifdef CONFIG_PCI
>>>
>>> It's ugly besides the fact that you have a dependency.
>>>
>>>> +       struct pci_bus *bus;
>>>
>>> Missed blank line.
>>>
>>>> +       /*
>>>> +        * The GPIO memory is bar0 of the hidden P2SB device. Unhide the device
>>>> +        * to have a quick look at it, before we hide it again.
>>>> +        * Also grab the pci rescan lock so that device does not get discovered
>>>> +        * and remapped while it is visible.
>>>> +        * This code is inspired by drivers/mfd/lpc_ich.c
>>>> +        */
>>>> +       bus = pci_find_bus(0, 0);
>>>> +       pci_lock_rescan_remove();
>>>> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
>>>> +       pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
>>>> +
>>>> +       bar0 &= ~0xf;
>>>> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
>>>> +       pci_unlock_rescan_remove();
>>>> +#endif /* CONFIG_PCI */
>>>> +       return bar0;
>>>> +}
>>>> +EXPORT_SYMBOL(simatic_ipc_get_membase0);
>>>
>>> Oy vey! I know what this is and let's do it differently. I have some
>>> (relatively old) patch series I can send you privately for testing.
>>
>> This bit stood out the most to me too, it would be good if we can this fixed
>> in some cleaner work. So I'm curious how things will look with Andy's work
>> integrated.
>>
>> Also I don't think this should be exported. Instead this (or its replacement)
>> should be used to get the address for an IOMEM resource to add the platform
>> devices when they are instantiated. Then the platform-dev drivers can just
>> use the regular functions to get their resources instead of relying on this
>> module.
> 
> I have published a WIP branch [1]. I have no means to test (I don't
> know what hardware at hand I can use right now), but I made it compile
> after 4 years of gathering dust...

So I took a quick look at the following 2 commits:

"platform/x86: p2sb: New Primary to Sideband bridge support library"
"mfd: lpc_ich: Switch to generic p2sb_bar()"

And this looks good to me, although compared to the code from this
patch-set you are missing the pci_lock_rescan_remove(); and
pci_unlock_rescan_remove(); calls.

> Feel free to give any kind of comments or share your ideas on how it
> can be improved (the above idea on IOMEM resource is interesting, but
> devices are PCI, not sure how this can be done).

The code added by this patch introduces a register_platform_devices()
function which creates a bunch of platform-devices; and then the
device-drivers for those call simatic_ipc_get_membase0() to get their
base-address.

My suggestion was to instead put the  simatic_ipc_get_membase0() call
inside the code instantiating the platform devices and to add the
base-address for that pdev as IOMEM resource to the instantiated
platform-devices.

I hope this helps to clarify what I was trying to say.

Regards,

Hans

