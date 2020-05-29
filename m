Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11A51E8BC9
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 May 2020 01:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgE2XMG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 May 2020 19:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE2XMF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 May 2020 19:12:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A399FC03E969;
        Fri, 29 May 2020 16:12:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d10so609133pgn.4;
        Fri, 29 May 2020 16:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UyD3DwGcPFptU34is7EBy9YqqMnLUZNp6l2qXoFpLUE=;
        b=KWMd43IrffgFVyqMXJVHCo1L/0r4bxXyP8w8IXQQJBHaFIFwcli6fMMhWX08dAjuqp
         R+mvzDXwFtlljp/NSH3OYW2IG36F68+64krJhOorza5BJbMBCoru8hufOJYvwP2DoDzn
         rPaHs05yJDNBKwF7CliZViMXmVvOdoMIk+yO7e/np74gP2RXzjz1tCndiCvXo2Dkwa1t
         OtvPvxvIyNEoY630eTqmv9ykaclEm9hjk1pVYR2GC6Ul5ToLbnoJ35g6TBp3eYgcrYTN
         YROVdgUQVS6boKkCNVKbYWLh2R6zIf/eQGsLPZmbDHSnF+VPd1a6b5mLMWGH+Wrj9kNu
         sZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UyD3DwGcPFptU34is7EBy9YqqMnLUZNp6l2qXoFpLUE=;
        b=kVCt/T2wMUuSShDzuUaFwheY1KeBHeWfetQ3LSUulmARjd9zmkTZOdfjszsSeEVxRF
         KIZzc4eFr0YqhZOlErj/6KcKIucHTTFSd9FdH1PMHP66/XoNYw/Rq1hLWBKsL3xQjpMH
         GBislKgwCunSysxGEOlQWDZvOQFGBmlkMAdiS2jZuvG21NtERb3OrQ+gBvZmpcM+gMur
         3xT64qBRYgIdq6NxflxLOliGKiCUaDlchicFim8msP0+OIO+Vp4JpUDqjZFcQFJ2ntFA
         yqTISgYGiaC4nxXFcoPlg/WLzrXm72UXZiiEUlkAms4gkL00oOBVzA01Ez3PoXhDVeq0
         b4bA==
X-Gm-Message-State: AOAM531Cfgot4uZKK0xehUosDZrqeEM+kFJeqINMkzQSL1+381DfJMUF
        5ic1NwwbBFFE1PmUDpiC0O0=
X-Google-Smtp-Source: ABdhPJxnglhpTNHWzamGYEiCl0lK3nOnuiGvha9vD2jdtALH5qFgqdHaUnqtVkzGpYa1uTPvyh26vQ==
X-Received: by 2002:a63:348:: with SMTP id 69mr9283139pgd.68.1590793925167;
        Fri, 29 May 2020 16:12:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v129sm8403630pfv.18.2020.05.29.16.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 16:12:04 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
To:     Michael Shych <michaelsh@mellanox.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
 <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
 <AM6PR05MB6168698F8A3D49F0EF61EFF0D9B70@AM6PR05MB6168.eurprd05.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <be4e03f9-8b20-6775-96cf-dc6d13027184@roeck-us.net>
Date:   Fri, 29 May 2020 16:12:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB6168698F8A3D49F0EF61EFF0D9B70@AM6PR05MB6168.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/21/20 7:25 AM, Michael Shych wrote:
> Hi Andy, Guenter,
> 
> Did you understand to which branch it will be better to take this patchset?
> 

I created an immutable branch at
    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-mlx-immutable

Guenter

> Thanks,
>    Michael.
> 
>> -----Original Message-----
>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Sent: Tuesday, May 5, 2020 7:14 PM
>> To: Guenter Roeck <linux@roeck-us.net>
>> Cc: Michael Shych <michaelsh@mellanox.com>; Wim Van Sebroeck <wim@linux-
>> watchdog.org>; Andy Shevchenko <andy@infradead.org>; Darren Hart
>> <dvhart@infradead.org>; linux-watchdog@vger.kernel.org; Platform Driver
>> <platform-driver-x86@vger.kernel.org>; Vadim Pasternak
>> <vadimp@mellanox.com>
>> Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
>>
>> On Tue, May 5, 2020 at 7:09 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> On 5/4/20 7:14 AM, michaelsh@mellanox.com wrote:
>>>> From: Michael Shych <michaelsh@mellanox.com>
>>
>>>> Michael Shych (4):
>>>>   platform_data/mlxreg: support new watchdog type with longer timeout
>>>>     period
>>>>   platform/x86: mlx-platform: support new watchdog type with longer
>>>>     timeout
>>>>   watchdog: mlx-wdt: support new watchdog type with longer timeout
>>>>     period
>>>>   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
>>>>
>>>>  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
>>>>  drivers/platform/x86/mlx-platform.c  | 106
>> ++++++++++++++++++++++++++++++
>>>>  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
>>>>  include/linux/platform_data/mlxreg.h |   5 +-
>>
>>> Guess the big question is now which branch to use to take this series.
>>> Thoughts, anyone ?
>>
>> count(watchdog) = 8
>> count(platform) = 6
>>
>> Thoughts?
>>
>> --
>> With Best Regards,
>> Andy Shevchenko

