Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA299E890
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 15:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfH0NGg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Aug 2019 09:06:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35112 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfH0NGg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Aug 2019 09:06:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id n4so12687617pgv.2;
        Tue, 27 Aug 2019 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tLfakLGpMLvdTV8QFc4nFi+HIp0PsQAUDM5NCWw4kOM=;
        b=e3RW4O/bkBNjJRXt0syqTSuQGa6iNaNuqgXq1e20CmuXTlkyv4RT1GXqxjJswj3P9n
         /YdtWylwjfbPGSAQdoXp4eYTIbehmw1D9qGRsg1gTqCMVaKrxKQWjCdN86PKqUq51kRq
         NR8qAB0zKrdjK75IhJeRlJgDOAXQNeFdgAjdFD4dBsx4aN9OEFmUQFHpIvf8vtA0Bj70
         ket1ALJGUasj0Ii86eSbQCX2dj2wHIOF1zoAwi0pGp63B+/MuqFU13+jrGuTeNXLRXKG
         6OQqyleuALUIjqcKCCtWtnbGPvmSg1mzEQWWArfw4basGrT1oA/gbONb+qvQ5t4qTte8
         UQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tLfakLGpMLvdTV8QFc4nFi+HIp0PsQAUDM5NCWw4kOM=;
        b=pbHCZEAOLetKCRzGf5GsdRs6WElwESHdRdobz/kwaeb9+CxleZWf83EgnNYlTqSZmL
         p+rMYNKNN6c2z7AZXG2EXdxzdWUN0m5Lc/P8WIgtZDGW0HuUIZY97oM/0gCjdvG5ny83
         SCoyeAfbKWzzIJwBl+opfvQ+5ACs5rCatKMDnKhduNjYpWUhejeGvtB9zdr7S0dpWulh
         FhVT9s5f4AYN1sxUcKBlLG0l/AZlGdPqZHMQUyhNStH9/8cx9t7fuBRD+P1iieToYSsW
         SyKB+LI5/hrvcs9e/rONdQ5rhSifob+D5RX61vgg8wZo5jJHhYwRDF2dojZ3gZzvvKa0
         TEDw==
X-Gm-Message-State: APjAAAW7uHObV+ILc8VSmdcBBS9YwsHvI3phIa9NDExXdpeXH9wXrYrv
        2XhzDbObJwtimc1xrFoDY9QBGC6p
X-Google-Smtp-Source: APXvYqwfc3SZsT1Lj8EgzY5d72Zcg5rMHFxdArytviyXSiZ1V1oA2QmZOxx6LeKLWB7fM8fNGtzyfw==
X-Received: by 2002:a63:c203:: with SMTP id b3mr21289785pgd.450.1566911194546;
        Tue, 27 Aug 2019 06:06:34 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id a23sm11467191pfc.71.2019.08.27.06.06.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 06:06:32 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] watchdog/aspeed: add support for dual boot
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>,
        openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-4-i.mikhaylov@yadro.com>
 <0df27d36-b45f-2059-6ead-a09ceb4b7605@roeck-us.net>
 <818746d20661b51914a7802dcbe0081352900b05.camel@yadro.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d46685d9-c6d2-46af-67aa-844d2b0296a9@roeck-us.net>
Date:   Tue, 27 Aug 2019 06:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <818746d20661b51914a7802dcbe0081352900b05.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/27/19 2:24 AM, Ivan Mikhaylov wrote:
> On Mon, 2019-08-26 at 17:14 -0700, Guenter Roeck wrote:
>>> +/*
>>> + * At alternate side the 'access_cs0' sysfs node provides:
>>> + *   ast2400: a way to get access to the primary SPI flash chip at CS0
>>> + *            after booting from the alternate chip at CS1.
>>> + *   ast2500: a way to restore the normal address mapping from
>>> + *            (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
>>> + *
>>> + * Clearing the boot code selection and timeout counter also resets to the
>>> + * initial state the chip select line mapping. When the SoC is in normal
>>> + * mapping state (i.e. booted from CS0), clearing those bits does nothing
>>> for
>>> + * both versions of the SoC. For alternate boot mode (booted from CS1 due
>>> to
>>> + * wdt2 expiration) the behavior differs as described above.
>>> + *
>> The above needs to be in the sysfs attribute documentation as well.
> 
> My apologies but I didn't find any suitable, only watchdog parameters with
> dtbindings file, where should I put it? Documentation/watchdog/aspeed-wdt-
> sysfs.rst?
> 

Documentation/ABI/testing/sysfs-class-watchdog

Guenter

>>> + * This option can be used with wdt2 (watchdog1) only.
>>
>> This implies a specific watchdog numbering which is not guaranteed.
>> Someone might implement a system with some external watchdog.
>>
>>> + */
>>> +static DEVICE_ATTR_RW(access_cs0);
>>> +
>>> +static struct attribute *bswitch_attrs[] = {
>>> +	&dev_attr_access_cs0.attr,
>>> +	NULL
>>> +};
>>> +ATTRIBUTE_GROUPS(bswitch);
>>> +
>>>    static const struct watchdog_ops aspeed_wdt_ops = {
>>>    	.start		= aspeed_wdt_start,
>>>    	.stop		= aspeed_wdt_stop,
>>> @@ -306,9 +359,16 @@ static int aspeed_wdt_probe(struct platform_device
>>> *pdev)
>>>    	}
>>>    
>>>    	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
>>> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
>>> +	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
>>>    		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>>>    
>>> +		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
>>> +			of_device_is_compatible(np, "aspeed,ast2500-wdt"))
>>> +			wdt->wdd.groups = bswitch_groups;
> 
>> Kind of odd that the attribute only exists if the system booted from the
>> second flash, but if that is what you want I won't object. Just make sure
>> that this is explained properly.
> Perhaps dts configuration option would be better solution for it then? "force-
> cs0-switch" as example? Also, if it would be an option, dtbindings/wdt file for

You said earlier that this can not be done automatically but _must_ be done
from user space after the system has booted. Otherwise you could just
automatically switch to cs0 when the driver probes.

As I said, all I am asking for is proper documentation.

Guenter

> documentation will be the right place for it. Usage of this at side 0 will not
> get any good/bad results, it just makes user confused, so I decided to put it
> only at side 1. It works only for ast2400/2500 board unfortunately, for 2600
> there is big difference in switching mechanism. Any other thoughts how to make
> it better?
> 
> Thanks.
> 
> 

