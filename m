Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E764744C6
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2019 07:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390504AbfGYFMX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jul 2019 01:12:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45023 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390362AbfGYFMX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jul 2019 01:12:23 -0400
Received: by mail-ot1-f67.google.com with SMTP id b7so202778otl.11
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jul 2019 22:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1HavsQi0PIVHE/5wuO+aYwrYRfGtBVcCZTVvBrVhq0E=;
        b=T5kP8fdSRTvshBPEpuaYQzIzZ0Jj23tcm7iIucIeecgMkiulRFwLMAXR2e/zS1ZaxB
         2TxranTYalP9Xtp6W7AKARIETevKkOxvqPoKv0LMyqS7WjmNg5UbBGU2YIeRXI3fOeCO
         nMS/V5Z/OICrzQvpF46oN9Xf6rsvZZsTGvBExd3rEHgGoBh+Ccm1XPC7jo2Av2a7JRmT
         B6TpARwzD3pK3oPTAGjj8OjScwG3sN4uQ3ghRdVBPwHgV/v1ypdAGkhGqnqARow7EGvJ
         beSBKko4oteGiGErP91gRlEuY21dj/7JyizaA+dG7soVh4E7j14+aAroDgOKmpT8mewM
         DI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1HavsQi0PIVHE/5wuO+aYwrYRfGtBVcCZTVvBrVhq0E=;
        b=VG2hAq8VO0S0j7ChuOGD6TK4z0xf95CQQpmk05v0b8kb0MSLlcbcLnpv4JWSSilLTf
         OwAwfoYLL1g73QBZufpx5A5HWri15JOi2DS6187gPUkWHrAJPzWmseTjlC7IGCiiZ0sd
         OA/SClqUMisrGZwq9+blpr07Q2jtgGsLr4qTRXYMxfiLqGYQrJ8RDqFFciWzYuMah1Ry
         dyiOsOeyfBM4E3hH/M9KGEtmk5xUA0tBSG7Xa7A74XttLRQ1Jv36ot9dPnPikgxJyZUd
         G/oAfmUOsDvHtKr2Mxp6weDoOFADmcL+nawSUd+JAD80zyDg6L+AUxAwGNy2owKEDV4M
         d9rQ==
X-Gm-Message-State: APjAAAW/4JSQMqR0n4Jy7mUeCZkCnL3GW4AnT033ZDNmcQ1hVtNqx8kH
        macU1VYs1HXa4hnTTtPyE0WkLjHrZs4H/Gfj7vTtRtlm
X-Google-Smtp-Source: APXvYqxdLT9oV7QDovoxb7mV+P1oX+U/iH6JkTiMg6gCWCBYNoPtI/odzhUUxblN8zSdZGOlpktt19+7ezSi3r6fL6o=
X-Received: by 2002:a9d:2c26:: with SMTP id f35mr62787865otb.362.1564031542285;
 Wed, 24 Jul 2019 22:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
 <97817286-92ae-cd13-4cc1-7a0355140414@roeck-us.net>
In-Reply-To: <97817286-92ae-cd13-4cc1-7a0355140414@roeck-us.net>
From:   Vignesh Raman <vignesh.raman.in@gmail.com>
Date:   Thu, 25 Jul 2019 10:42:11 +0530
Message-ID: <CAH3OF53G3bHfxpGVLHKns9k-QBAUroiqvkcdQ4d+gOmsLvaN6w@mail.gmail.com>
Subject: Re: watchdog: iTCO_wdt: failed to load
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rajneesh.bhardwaj@linux.intel.com, mika.westerberg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On Wed, Jul 24, 2019 at 6:57 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> What is the output of /proc/iomem, what PCI devices does it have, and what are
> the ACPI devices ? Reason for asking is that I don't immediately see the ACPI
> or PCI devices associated with above patch in your dmesg. If not, the patch
> might actually cause the watchdog in your system not to work.

/proc/iomem  - http://paste.debian.net/1092996/
PCI devices  - http://paste.debian.net/1092997/
ACPI devices - http://paste.debian.net/1093003/

> Also, did this ever work in your system ? If it did work, did the failure
> start after a kernel update or after a BIOS update ?

The hardware watchdog has never worked in the system. Without the
patch https://lore.kernel.org/patchwork/patch/770990/ the probe error
is seen,
[    3.828440] iTCO_wdt iTCO_wdt: can't request region for resource
[mem 0x00c5fffc-0x00c5ffff]
[    3.828803] iTCO_wdt: probe of iTCO_wdt failed with error -16

With the patch the module loads fine, but the hardware watchdog does not work.

Regards,
Vignesh
