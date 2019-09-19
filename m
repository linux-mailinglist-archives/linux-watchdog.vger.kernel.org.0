Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A21B7A56
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2019 15:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388397AbfISNVH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 19 Sep 2019 09:21:07 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36728 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388331AbfISNVH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 19 Sep 2019 09:21:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id m29so1918088pgc.3;
        Thu, 19 Sep 2019 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TWj8wi/W/y3NPkqvf0NKVnATCDxltPrPKngFMa6MT0s=;
        b=Y4fY0PhQqhQoEaixXfXZjTEOhZXcKpywx+3Wo6ut+4+vtadA2HmM+V7DG6Lba+QqqJ
         Ibawe+GS7NufpmlffYyuBMMrbHkHCYnD0GRrkJ29sp6ZDW3+vlneN8/bPNskpwGE0C02
         lOh1Mv5oBS9w0pxQQqROTOKounj91L21WDKHj4j6pP0QY5MOgZYWNefFk2uSUVFPMB0X
         sTEgDDddL+QGmjfrj0chcYMpfM/bfnGRyPoNrhfc9aGQSlRfDxH+/mx0kYyJdn+lxIgV
         kKFBZhmBt71HTGxIYmGqxPfLbxxGcv6/cEBjlmb7W12bTBqtx2l3ndn9thkeCmMGcObT
         El/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TWj8wi/W/y3NPkqvf0NKVnATCDxltPrPKngFMa6MT0s=;
        b=HycqqQqvn25Jx/dhfKtRMybnxpS4Y7AJ+DxM5w7Y2xBYOyFXT63D4kMwGRW7/rQ4ap
         HgezEMNxDtK+3UPO1ELDXrHcb67jaljQHfu/9oRZcF0oLw5WSdyXTO98ioPO7JzkySWC
         rBj95vpd97unNc1a+c8yhbboMn5HmDMBrnCVPZDhzk7uvjlS4GkdrZszclM/+uZZ+qCy
         7MLz0Ou/jERBVrZTanQcYO04jnTAzRepLHnbw0BFSYtiJAXxW3BkWbwV3/z2/QPOfbUM
         YI+uJ25P4JrhVXMABHq4mV60jpcKrgTzUHbqO6jEoO4d59xdsNFJGO2mkZgpQID8qYPz
         M3SA==
X-Gm-Message-State: APjAAAXVSWIPlE4Cg4EzuKbm2QRikt39QZvVHhcpn0kf6qJ1/vPbzgKc
        H61gMhdsTiFn7WfTHeVLoZJ5VKCs
X-Google-Smtp-Source: APXvYqztELJdJHxrj9P4GMw+iZM7vvunGRnoBq6VXncOyEVdPZEUXbwkj2Svl925QlhBuwsmCHey4Q==
X-Received: by 2002:a65:6915:: with SMTP id s21mr6178274pgq.278.1568899266202;
        Thu, 19 Sep 2019 06:21:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 30sm5515966pjk.25.2019.09.19.06.21.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 06:21:05 -0700 (PDT)
Subject: Re: Samsung based S3C2440A chipset - watchdog timer issue
To:     Suniel Mahesh <sunil.m@techveda.org>, kgene@kernel.org,
        krzk@kernel.org, wim@linux-watchdog.org, heiko@sntech.de
Cc:     linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <652bf0b2-3681-47f2-3b50-40edff52a7b5@techveda.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <331a804f-bee2-c273-9a26-b40627d68880@roeck-us.net>
Date:   Thu, 19 Sep 2019 06:21:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <652bf0b2-3681-47f2-3b50-40edff52a7b5@techveda.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/19/19 12:40 AM, Suniel Mahesh wrote:
> Hi,
> 
> I am working on one of the Samsung based S3C2440A chipset based target .
> 
> I have couple of questions and I request someone to shed some light on these: (Thank you)
> 
> The watchdog driver in linux, looks like, it just configured WDT but didn't start it (code snippet included below).
> 
> May i know the reasson why WDT is not started ? Is it because u-boot already started WDT, implies it is not required to do the
> same once we jump into linux ? or is there any specific reason ?
> 

The driver does not detect if the watchdog is not running when probed.
What u-boot does is irrelevant. To start the watchdog at boot, you would
have to provide the tmr_atboot=1 module parameter. Otherwise, it is explicitly
disabled, as shown in the code, and opening the watchdog device would start
the watchdog.

Having said that, the code is less than perfect. Initializing the timeout
in the probe function should be handled differently, and the kernel should
be informed that/if the watchdog is started at boot. It should also be
possible to detect if the watchdog is running instead of relying on tmr_atboot,
and inform the kernel accordingly. But those are not bugs, just possible
improvements.

Guenter

> drivers/watchdog/s3c2410_wdt.c (line 53 and lines 616 - 625)
> 
> #define S3C2410_WATCHDOG_ATBOOT         (0)
> ....
> static int tmr_atboot   = S3C2410_WATCHDOG_ATBOOT;
> ...
> ...
> if (tmr_atboot && started == 0) {
>                  dev_info(dev, "starting watchdog timer\n");
>                  s3c2410wdt_start(&wdt->wdt_device);
>          } else if (!tmr_atboot) {
>                  /* if we're not enabling the watchdog, then ensure it is
>                   * disabled if it has been left running from the bootloader
>                   * or other source */
> 
>                  s3c2410wdt_stop(&wdt->wdt_device);
>          }
> ...
> ...
> 
> Tried to start WDT in linux by assigning value 1 to S3C2410_WATCHDOG_ATBOOT. The target resets.
> 
> please comment.
> 
> Thanks--
> Suniel Mahesh
> 

