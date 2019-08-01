Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF3A57D49D
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2019 06:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfHAEng (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Aug 2019 00:43:36 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37877 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfHAEnf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Aug 2019 00:43:35 -0400
Received: by mail-pf1-f196.google.com with SMTP id 19so33232174pfa.4
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Jul 2019 21:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zr2rXe1obZKa4nGRScFzFm+8kBnznfP2urh7yHyuCpc=;
        b=h2txzEX1GjvvvbqqYUYccIIz2/1PXXD3nQp5arDj+uchxTdT/c0F6FPnZyuBdBnop5
         5Ql0HiFVOfV6rEzF1gbaZOmg7uYrETHGLwfRSNplpYzTQK2PUemziA6r/qYONl4LHqRZ
         I8YuIWHq5j+xj3m9CDuNEWtHOTeT2+NZMwuFR2NXmnKR71AneBrJfrAk+Njw1LIy/si1
         cbn33FLHthwcDyumy82jvylkQfsFGsnY+SkKdZP1NHNPpL/9qL8fraNBQdX12wC2CUXa
         k1Qp/ZLBKjNSd3pC1TEWJDkcja0Wq/fGs7+ZjJ3p/aHhyHVCgJobU6YLRUlbCi+dTO+o
         pn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zr2rXe1obZKa4nGRScFzFm+8kBnznfP2urh7yHyuCpc=;
        b=E4zxvmo9fr6zp3+iBz6644Fhwff8T8lRrQ1jwdW9Dlx5aZqNmJY7IzCC+VLH97t48T
         7y/0BgPdtkYn2zS1KS5VIfDftVcfCKU/bFo5LBC68jceDy1H9oPzjaSEM572EacnA+9S
         c3urKZb5TeNNp9sfyHVsgte0mC7z4ofvJw0pd0TUnaRJ8UYzDNcTge3axbLisc+CSuHd
         /lENAOUA/HYblZrogoMJE+/WX7drfpnG+8d0B/35fLlT3u6QJrg3iKoA0+jcv3tBxaD/
         0OFxRk1TQBVgSB3gTATkixdY7lbUAuS1LrrBsTBMKvAs5G67LSXKDms6KRe57JKvkEkK
         w1ew==
X-Gm-Message-State: APjAAAV1+jLwgTWYyf3Sdmm5DhG1nWPteSktqcWTJ1r5BE5o9YNEwvmM
        dft5NROawpSaRlI1RvUIQsjRTLrJ
X-Google-Smtp-Source: APXvYqzYa4p/8YXqawpHE4iub9LD5YWtF+BoymA8iZDc8KsWnuQw0paYKjJ0MbEV1kt8gEpA0caGew==
X-Received: by 2002:a62:d45d:: with SMTP id u29mr50863770pfl.135.1564634615098;
        Wed, 31 Jul 2019 21:43:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r2sm88225467pfl.67.2019.07.31.21.43.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 21:43:33 -0700 (PDT)
Subject: Re: watchdog: iTCO_wdt: failed to load
To:     Vignesh Raman <vignesh.raman.in@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rajneesh.bhardwaj@linux.intel.com, mika.westerberg@linux.intel.com
References: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
 <97817286-92ae-cd13-4cc1-7a0355140414@roeck-us.net>
 <CAH3OF53G3bHfxpGVLHKns9k-QBAUroiqvkcdQ4d+gOmsLvaN6w@mail.gmail.com>
 <e1f4f561-ba33-b9ce-66db-c67cb260ecdf@roeck-us.net>
 <CAH3OF53UrARyB8xnJLu4rXm2EJOzR9S2XViSMrmJXeeRuPgb3w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a92b4ac7-1709-ffc0-77a5-b42bd26fc12d@roeck-us.net>
Date:   Wed, 31 Jul 2019 21:43:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH3OF53UrARyB8xnJLu4rXm2EJOzR9S2XViSMrmJXeeRuPgb3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/31/19 9:18 PM, Vignesh Raman wrote:
> Hi Guenter,
> 
> On Thu, Jul 25, 2019 at 6:40 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Here is your problem:
>>
>> 00100000-5e431017 : System RAM
>>     00c5fffc-00c5ffff : iTCO_wdt
>>
>> The address range requested by the watchdog is marked by the BIOS as system memory.
>>
>> The patch referenced below tries to address a different problem and does not apply
>> to your system.
>>
> 
> Thanks for catching that. In working case the output of /proc/iomem is,
> 

Wasn't me. Someone else had the same or a similar problem, and Jean Delvare
noticed the overlap with system memory.

Guenter

> fd000000-fe7fffff : PCI Bus 0000:00
>    fd000000-fdabffff : pnp 00:09
>    fdac0000-fdacffff : pnp 00:0b
>    fdad0000-fdadffff : pnp 00:09
>    fdae0000-fdaeffff : pnp 00:0b
>    fdaf0000-fdafffff : pnp 00:0b
>    fdb00000-fdffffff : pnp 00:09
>      fdc6000c-fdc6000f : iTCO_wdt
>        fdc6000c-fdc6000f : iTCO_wdt
> 
> This explains why it works in another system (i7-6700).
> 
> Regards,
> Vignesh
> 

