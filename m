Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C4874F00
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2019 15:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389731AbfGYNSS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jul 2019 09:18:18 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39558 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389452AbfGYNSS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jul 2019 09:18:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id m202so37638257oig.6
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Jul 2019 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yos3RCeDKRYJA/LJZzIa9p6sY8vYb6dMFCeeTFnjrnE=;
        b=RcHjhO/D3R0jAiLfCv/5TA9qpc6l0xbUQpFry6mFlNXSNwgOY4wadpj0/RkLdKLs+Y
         2CmjPzHYDF04IHGuhNn2QaF2ZH7XxOCKP39C4lj2PHRKyfcWDVEp+AlOMj7psj5RFkww
         nZzR5jS6VvCqb6XX73vQDeF6bHY63/I396ZlSdRwSWOzzJkki4HYgKAtpKpstX8K9494
         xXofC3BO8EYVilDHb0yBOWwxxiExpjrVy26nqvRlzGUFNH/EKfJSxSFcVianDFbJ2lDP
         1VzmmwjIzvvFII+YaRXX7Oi3lB+d95fQBGSfIqEEp0FZ9JkG785kpRNJRNdcLqZLd5t2
         JHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yos3RCeDKRYJA/LJZzIa9p6sY8vYb6dMFCeeTFnjrnE=;
        b=HKhe3bbNc7Mu+t8Z5VFdKM23sgEUzow8MsRAufsylUwUNiQyQbLnr6SGmvI2KGwxWT
         ddDbVBV3UfwwcnQ0dylZ8GCRjJc5wNrftGzcLe96vDvrnmh89CpWqfXmQLd9kKInnb5H
         CrrUo8Wbl1kR35Qpf15CcYHi6fTh+2SQ4oQEc9eEweZBSKpaSjp51lD9o7rxm1xg8l0N
         pxgESszCQzFNMoPpKs0Rxy99Y+NUXmNK08evkh1RhDG1fnbr9dKCFsWlxBUtPLl0CIeo
         y3MpwETPVyaS2q8jDRszheSE8V3Jm/4MsSfZ0Z2mnUkbhOkSh2d6Ix1KZZKirObeaSGD
         2a7w==
X-Gm-Message-State: APjAAAUoynPeXVsURalNboSGbEQTYsY8EG8DHsLHJpDmeGCbrmF3RB66
        uBvreNVZCCPgoTVmpmQPzqf/qg7V
X-Google-Smtp-Source: APXvYqy8VLQS0JufP+4NM1GV1kv2D/dRu6pUb+l4nQD+TYZsTE5wzRKulqrTT1+beNfUxll603pgoQ==
X-Received: by 2002:a63:9e54:: with SMTP id r20mr51840309pgo.64.1564060236004;
        Thu, 25 Jul 2019 06:10:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 23sm53778963pfn.176.2019.07.25.06.10.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 06:10:34 -0700 (PDT)
Subject: Re: watchdog: iTCO_wdt: failed to load
To:     Vignesh Raman <vignesh.raman.in@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rajneesh.bhardwaj@linux.intel.com, mika.westerberg@linux.intel.com
References: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
 <97817286-92ae-cd13-4cc1-7a0355140414@roeck-us.net>
 <CAH3OF53G3bHfxpGVLHKns9k-QBAUroiqvkcdQ4d+gOmsLvaN6w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e1f4f561-ba33-b9ce-66db-c67cb260ecdf@roeck-us.net>
Date:   Thu, 25 Jul 2019 06:10:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH3OF53G3bHfxpGVLHKns9k-QBAUroiqvkcdQ4d+gOmsLvaN6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/24/19 10:12 PM, Vignesh Raman wrote:
> Hi Guenter,
> 
> On Wed, Jul 24, 2019 at 6:57 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> What is the output of /proc/iomem, what PCI devices does it have, and what are
>> the ACPI devices ? Reason for asking is that I don't immediately see the ACPI
>> or PCI devices associated with above patch in your dmesg. If not, the patch
>> might actually cause the watchdog in your system not to work.
> 
> /proc/iomem  - http://paste.debian.net/1092996/

Here is your problem:

00100000-5e431017 : System RAM
   00c5fffc-00c5ffff : iTCO_wdt

The address range requested by the watchdog is marked by the BIOS as system memory.

The patch referenced below tries to address a different problem and does not apply
to your system.

Guenter

> PCI devices  - http://paste.debian.net/1092997/
> ACPI devices - http://paste.debian.net/1093003/
> 
>> Also, did this ever work in your system ? If it did work, did the failure
>> start after a kernel update or after a BIOS update ?
> 
> The hardware watchdog has never worked in the system. Without the
> patch https://lore.kernel.org/patchwork/patch/770990/ the probe error
> is seen,
> [    3.828440] iTCO_wdt iTCO_wdt: can't request region for resource
> [mem 0x00c5fffc-0x00c5ffff]
> [    3.828803] iTCO_wdt: probe of iTCO_wdt failed with error -16
> 
> With the patch the module loads fine, but the hardware watchdog does not work.
> 
> Regards,
> Vignesh
> 

