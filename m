Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E41106D53
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 11:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730411AbfKVK7L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 05:59:11 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45884 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730136AbfKVK7K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 05:59:10 -0500
Received: by mail-ot1-f68.google.com with SMTP id r24so5763618otk.12
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Nov 2019 02:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u4KpibUO0ikw2xmkMM0cpKf5Oyfg15afERy7joABjTE=;
        b=Ik3PrcnmfELA1CJhU3+T+NFFlPHHkjcPw0bPEv60bRIbe+xXNIerVnNIeTFWudihBU
         k7D5LdXO7NY3qot9uzAJK87svT+JAqDjnR/cu6CrgK+JoKRdoARAXFzLqjZTK7Esba4A
         O21vWJQKf06NyIUTAtYF1Wk8vW8SLQCtGhuufU9TCF7Wro8xjInp92mpsNgmYEXVTnYR
         hX4tVC8ps7qCN8Vc+kxPV1FnDcNJu1yfkmymDoYGO4tY6VpNQjQMur1Q6y3XB2VXUSB5
         awGyoQWrI1qZH1L4U3VDmqYlavBk71kRd+EmMv/pSAQaDB+NtLtRZV4rqW34q9bs0evy
         ENpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u4KpibUO0ikw2xmkMM0cpKf5Oyfg15afERy7joABjTE=;
        b=XZns+Vx0lykAoLKGgK0NmCsh4JX+OLVCTys9TyjwevIFVcGMI8ToLoFloU501hzONy
         Pf8vJwYoziswABeevyg/dDsRyaqyMwcQoNarCFv0JmaXbvL+IUhCa7v/XEbjX6tfT0iN
         rugmVkCrsY54M0gqK9p//ZsTGYamkvEybi2gelQAJ/iWeoDH9mnENx8di26avkxviwAJ
         gKshLqpXbml0aBCkDZi3HXKFSJQITwcO0EhWesfA24a5+SSb7TvwptcXv+BOMMXYXavJ
         Qppr+yzthQcTMeaoVHEkw6aEywBUF41U3/DrDn/9IuhQAeFL6HKCF2aV4EZg62FoEdek
         W97w==
X-Gm-Message-State: APjAAAXTWB3p1hx+dx8L8Et6evvbin69T+AgJbzeto5X7S4YQAJmWLRx
        HvxchJ8QCzyYoJSkT2Rzi5Y+9jC1
X-Google-Smtp-Source: APXvYqyd/E9mHMyWDk12nt5O0f3yOe9YHErpskszTTwrdx3NCxFsYQdkUe1uhgyOo6FJVhTqIirGdQ==
X-Received: by 2002:a9d:6149:: with SMTP id c9mr9883938otk.279.1574420350208;
        Fri, 22 Nov 2019 02:59:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m205sm1978905oib.27.2019.11.22.02.59.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 02:59:09 -0800 (PST)
Subject: Re: watchdog: how to enable?
To:     Muni Sekhar <munisekharrms@gmail.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
References: <CAHhAz+h6SuGKWn0qNqsCdNjDks_vHuJW-KfiQja_b3x8x=vq_A@mail.gmail.com>
 <20191118143838.GA29359@google.com>
 <CAHhAz+j7v-Utpir8wyCVORv_fthdLLg_spR_G+8TjBBSyJa6wA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f28024de-bfad-5f3e-6332-aebfa48991a8@roeck-us.net>
Date:   Fri, 22 Nov 2019 02:59:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHhAz+j7v-Utpir8wyCVORv_fthdLLg_spR_G+8TjBBSyJa6wA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/18/19 7:09 AM, Muni Sekhar wrote:
> On Mon, Nov 18, 2019 at 8:08 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>>
>> [-cc linux-pci (nothing here is PCI-specific)]
>>
>> On Sat, Nov 16, 2019 at 06:05:05AM +0530, Muni Sekhar wrote:
>>> My kernel is built with the following options:
>>>
>>> $ cat /boot/config-5.0.1 | grep NO_HZ
>>> CONFIG_NO_HZ_COMMON=y
>>> CONFIG_NO_HZ_IDLE=y
>>> # CONFIG_NO_HZ_FULL is not set
>>> CONFIG_NO_HZ=y
>>> CONFIG_RCU_FAST_NO_HZ=y
>>>
>>> I booted with watchdog enabled(nmi_watchdog=1) as given below:
>>>
>>> BOOT_IMAGE=/boot/vmlinuz-5.0.1
>>> root=UUID=f65454ae-3f1d-4b9e-b4be-74a29becbe1e ro debug
>>> ignore_loglevel console=ttyUSB0,115200 console=tty0 console=tty1
>>> console=ttyS2,115200 memmap=1M!1023M nmi_watchdog=1
>>> crashkernel=384M-:128M
>>>
>>> When the system is frozen or the kernel is locked up(I noticed that in
>>> this state kernel is not responding for ALT-SysRq-<command key>) but
>>> watchdog is not triggered. So I want to understand how to enable the
>>> watchdog timer and how to verify the basic watchdog functionality
>>> behavior?
>>
>> I don't know much about the watchdog, but I assume you've found these
>> already?
>>
>>    Documentation/admin-guide/lockup-watchdogs.rst
>>    Documentation/admin-guide/sysctl/kernel.rst
>>
>> Do you have CONFIG_HAVE_NMI_WATCHDOG=y?  (See arch/Kconfig)
> 
> I don’t have CONFIG_HAVE_NMI_WATCHDOG in kernel .config file.
> 

That would mean you don't have NMI in the first place. What is your
architecture ?

Guenter

> $cat /boot/config-5.0.1 | grep CONFIG_HAVE_NMI_WATCHDOG
> 
> But tried to enable CONFIG_HAVE_NMI_WATCHDOG via menuconfig, but could
> not able to find it. What is the role of CONFIG_HAVE_NMI_WATCHDOG?
> 
> Symbol: HAVE_NMI_WATCHDOG [=n]
> 
>                                              │
>    │ Type  : bool
> 
>                                                  │
>    │   Defined at arch/Kconfig:339
> 
>                                                  │
>    │   Depends on: HAVE_NMI [=y]
> 
>                                                  │
>    │   Selected by [n]:
> 
>                                                  │
>    │   - HAVE_HARDLOCKUP_DETECTOR_ARCH [=n]
> 
> 
>    │ Symbol: HAVE_HARDLOCKUP_DETECTOR_ARCH [=n]
> 
>                                                  │
>    │ Type  : bool
> 
>                                                  │
>    │   Defined at arch/Kconfig:346
> 
>                                                  │
>    │   Selects: HAVE_NMI_WATCHDOG [=n]
> 
> 
> 
> 
> 

