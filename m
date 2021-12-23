Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8DA47E6BE
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Dec 2021 18:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349443AbhLWRRI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Dec 2021 12:17:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46429 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349440AbhLWRRH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Dec 2021 12:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640279827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5tKxu5jvc2qNkzWCP2pb4IkOAYj+EJYXt6ivrVtbtg4=;
        b=AX8V6Xm8R3ybVrGzprhX3WdrIx55WJGc25H3fMfb6Ax+tZIdynfEQDnQCYQiwZL452XELt
        CNuyeWLksNZnfeYKoI4SfbkI+mCHBtMosvnYdfxniRoPn8FL3f/SIlbtgrVnB7S13yX4Zn
        EFpwt3D27rsK9X1dYuWW+91//SwWB24=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-K1sEQ8uvNJWWyexAy2i2uA-1; Thu, 23 Dec 2021 12:17:05 -0500
X-MC-Unique: K1sEQ8uvNJWWyexAy2i2uA-1
Received: by mail-ed1-f71.google.com with SMTP id o20-20020a056402439400b003f83cf1e472so4950420edc.18
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Dec 2021 09:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5tKxu5jvc2qNkzWCP2pb4IkOAYj+EJYXt6ivrVtbtg4=;
        b=IcyiPxBzbnx1d4EsI6g5GswgSZkJyS3uf/6P8AUeiWFLB7umnZqZS436UxfutvLFSB
         e7Hn0e69qjRecwpqsMGrSJ3v3b0elxsAPp8DZJSXqb6RsZErtWmK10lhnVd7CElTGJ9W
         9tnyw4pqLb6hAvR+c1UuH1yD8bD88ZwrSiOQ9dWx2RfNGiZFBCBkjQCv5hhsOVmMcmrG
         /NpCZsNheJ+YBREcUZZqeJLEOH00iYYpUAu4TjjE+tmXtyDSUI0TiQZHUqEljbEdiH7q
         fP19O0hkzlbigKGcocprxn+CnAMicVQ7sK+q1Hut3/k/yiIWyfgvzfkz3cW8h3/3mgz/
         cMqw==
X-Gm-Message-State: AOAM532d/ATmyOYbGNRSzrZ19cesmkqCjtLaU3mSvmt4F8fiuLxt2jTW
        O4l7JyIv8+I5ct9ElH842c7xT2ezN2B3mxWVEmltAj5WTebtRRlxRUckC1JMrV1F2Meo6TgdVLQ
        7CwkNe1GlsRj7lHV73MwxRMx1g0k=
X-Received: by 2002:a05:6402:1203:: with SMTP id c3mr2823831edw.253.1640279824641;
        Thu, 23 Dec 2021 09:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuQV2fwk4RqZ2vQ67AF5f6k8exjGMP0tCUN/8g51odv/cVFyvaVH9DnbUlOrIu52FAAhF7cg==
X-Received: by 2002:a05:6402:1203:: with SMTP id c3mr2823817edw.253.1640279824478;
        Thu, 23 Dec 2021 09:17:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id y5sm1906647ejk.203.2021.12.23.09.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 09:17:03 -0800 (PST)
Message-ID: <674e8c50-ece7-9aad-7876-c739dbc96498@redhat.com>
Date:   Thu, 23 Dec 2021 18:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 0/4] add device drivers for Siemens Industrial PCs
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
References: <20211213120502.20661-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211213120502.20661-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 12/13/21 13:04, Henning Schild wrote:
> changes since v4:
> - make everything around GPIO memory usage more verbose
>   - commit messages, FIXME in p1, cover-letter
> 
> changes since v3:
> 
> - fix io access width and region reservations
> - fix style in p1
> 
> changes since v2:
> 
> - remove "simatic-ipc" prefix from LED names
> - fix style issues found in v2, mainly LED driver
> - fix OEM specific dmi code, and remove magic numbers
> - more "simatic_ipc" name prefixing
> - improved pmc quirk code using callbacks
> 
> changes since v1:
> 
> - fixed lots of style issues found in v1
>   - (debug) printing
>   - header ordering
> - fixed license issues GPLv2 and SPDX in all files
> - module_platform_driver instead of __init __exit
> - wdt simplifications cleanup
> - lots of fixes in wdt driver, all that was found in v1
> - fixed dmi length in dmi helper
> - changed LED names to allowed ones
> - move led driver to simple/
> - switched pmc_atom to dmi callback with global variable
> 
> 
> This series adds support for watchdogs and leds of several x86 devices
> from Siemens.
> 
> It is structured with a platform driver that mainly does identification
> of the machines. It might trigger loading of the actual device drivers
> by attaching devices to the platform bus.
> 
> The identification is vendor specific, parsing a special binary DMI
> entry. The implementation of that platform identification is applied on
> pmc_atom clock quirks in the final patch.
> 
> It is all structured in a way that we can easily add more devices and
> more platform drivers later. Internally we have some more code for
> hardware monitoring, more leds, watchdogs etc. This will follow some
> day.
> 
> The LED as well as the watchdog drivers access GPIO memory directly.
> Using pinctrl is not possible because the machines lack ACPI entries for
> the pinctrl drivers. Updates to the ACPI tables are not expected. So we
> can rule out a conflict where two drivers would try and access that GPIO
> memory.
> So we do not use those pins as "general purpose" but as "Siemens
> purpose", after having identified the devices very clearly. 
> 
> Henning Schild (4):
>   platform/x86: simatic-ipc: add main driver for Siemens devices
>   leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
>   watchdog: simatic-ipc-wdt: add new driver for Siemens Industrial PCs
>   platform/x86: pmc_atom: improve critclk_systems matching for Siemens
>     PCs


Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
>  drivers/leds/Kconfig                          |   3 +
>  drivers/leds/Makefile                         |   3 +
>  drivers/leds/simple/Kconfig                   |  11 +
>  drivers/leds/simple/Makefile                  |   2 +
>  drivers/leds/simple/simatic-ipc-leds.c        | 202 ++++++++++++++++
>  drivers/platform/x86/Kconfig                  |  12 +
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/pmc_atom.c               |  54 +++--
>  drivers/platform/x86/simatic-ipc.c            | 176 ++++++++++++++
>  drivers/watchdog/Kconfig                      |  11 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/simatic-ipc-wdt.c            | 228 ++++++++++++++++++
>  .../platform_data/x86/simatic-ipc-base.h      |  29 +++
>  include/linux/platform_data/x86/simatic-ipc.h |  72 ++++++
>  14 files changed, 786 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/leds/simple/Kconfig
>  create mode 100644 drivers/leds/simple/Makefile
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds.c
>  create mode 100644 drivers/platform/x86/simatic-ipc.c
>  create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
>  create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
>  create mode 100644 include/linux/platform_data/x86/simatic-ipc.h
> 

