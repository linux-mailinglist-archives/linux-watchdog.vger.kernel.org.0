Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E2477B4A3
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Aug 2023 10:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbjHNItw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Aug 2023 04:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbjHNItM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Aug 2023 04:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E251737
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692002890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PcuucrLtVYwCl1xaIpqj9xzz1ALk8SHx+jhC/+VTuqc=;
        b=VYK4Pl4m/rldbJK9bssJMZR8M0Ct7sDwxrF12JcksPzmhAVQbnZf8DvjHOxbs6ey7iyUMm
        OxWq1Iw+1bEG+umOAEimTVf1l0FQarFieCndHg0WHj03zOWk3u/KumBhfKmefGDPCHFAc3
        aR6sHuBXViq8cISY7rJJh7jiAYkjRXk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-Tcskr775MEWwKpMIv15TwQ-1; Mon, 14 Aug 2023 04:48:08 -0400
X-MC-Unique: Tcskr775MEWwKpMIv15TwQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5230741478cso2890218a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002887; x=1692607687;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcuucrLtVYwCl1xaIpqj9xzz1ALk8SHx+jhC/+VTuqc=;
        b=RanrAmzClkX1sMzcmxyJ/iH0wwMCZWGJYW7OVyI1ZC+zTdyrjF+NBD1dierL/LS1N6
         CXzXeqoSOyyEZY9utjU5sRafTHjIuDKL1r81LD32FhZvcYpyLVGJvA/kYeAwYE+iKNfr
         W6eEA8FNOdgTtIRqnlI/GNJgbcNRZw6uQThGmMrfBXLoND40ywhIhLh9Dcz98m0OLqNd
         lh7uqfK253A52yggfOvjGMg0braPu5Go45FnOfs+M525mkmh7Yah5SRdKM1wTffcDOm+
         8F/9NQqHv4cALMlrVJlqpa2rRVGBoKBvq2caK2/SyWkqtj9Xcr5AlmckcyS7oLfsRqns
         oIsQ==
X-Gm-Message-State: AOJu0YyCSThQIxDF57zgrsZkjOr4EZ6DYXX9xqugMX3kLGj4yeUu6xBT
        SUuX7PW56eNhK/imfFsW2UBYpPK6kj7nOxdFOY9cPVjisSRUIcZzBmDQV+mBGjE8ArKFJI9AJf/
        PIxMWQq/XpAT1H2lcrl03VXHIozk=
X-Received: by 2002:a05:6402:160b:b0:525:6d74:7122 with SMTP id f11-20020a056402160b00b005256d747122mr385130edv.30.1692002887752;
        Mon, 14 Aug 2023 01:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZRIwcPXSfrqMZ/gV3wzmV4M3r0vG1YLEZjQHVuV/zDdrzfuNWF37yGexep3BV9kyar7AHnQ==
X-Received: by 2002:a05:6402:160b:b0:525:6d74:7122 with SMTP id f11-20020a056402160b00b005256d747122mr385116edv.30.1692002887413;
        Mon, 14 Aug 2023 01:48:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d9-20020aa7d689000000b0052237dfa82fsm5238425edr.64.2023.08.14.01.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:48:06 -0700 (PDT)
Message-ID: <b510b97d-f613-66a6-711f-2b6dde72f884@redhat.com>
Date:   Mon, 14 Aug 2023 10:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] watchdog: simatic: add PCI dependency
Content-Language: en-US, nl
To:     "xingtong.wu" <xingtong_wu@163.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Haeussler, Gerd" <gerd.haeussler.ext@siemens.com>,
        "Schaffner, Tobias" <tobias.schaffner@siemens.com>,
        "Wu, Xing Tong" <XingTong.Wu@siemens.com>
References: <20230814073924.1066390-1-arnd@kernel.org>
 <a6c2f193-ef7c-54a0-dfbb-13915be259a1@163.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a6c2f193-ef7c-54a0-dfbb-13915be259a1@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Xing Tong,

On 8/14/23 10:27, xingtong.wu wrote:
> Hi
> 
> On 2023/8/14 15:38, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The simatic-ipc driver no longer depends on PCI, but its watchdog portion
>> still needs it, otherwise P2SB runs into a build  failure:
> 
> If the simatic-ipc driver no longer depends on PCI, you can
> delete the dependency here:
> https://elixir.bootlin.com/linux/v6.5-rc6/source/drivers/platform/x86/Kconfig#L1079

That has already been done, the latest code of the
simatic-ipc support lives here:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-simatic-ipc

and there that depends on has been dropped, which is actually what is causing the issue this patch addresses.

>> WARNING: unmet direct dependencies detected for P2SB
>>   Depends on [n]: PCI [=n] && X86 [=y]
>>   Selected by [m]:
>>   - SIEMENS_SIMATIC_IPC_WDT [=m] && WATCHDOG [=y] && SIEMENS_SIMATIC_IPC [=y]
>>
>> drivers/platform/x86/p2sb.c:121:3: error: call to undeclared function 'pci_bus_write_config_dword'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>                 pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
>>
>> Add back the minimum dependendency to make it build in random configurations
>> again.
>>
>> Fixes: b72da71ce24b0 ("platform/x86: simatic-ipc: drop PCI runtime depends and header")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/watchdog/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 04e9b40cf7d53..09452384221a4 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1680,7 +1680,7 @@ config NIC7018_WDT
>>  
>>  config SIEMENS_SIMATIC_IPC_WDT
>>  	tristate "Siemens Simatic IPC Watchdog"
>> -	depends on SIEMENS_SIMATIC_IPC
>> +	depends on SIEMENS_SIMATIC_IPC && PCI
> 
> The SIEMENS_SIMATIC_IPC_WDT does not depends on PCI directly,
> it should depends on P2SB, then P2SB depends on PCI

P2SB is a helper library and as such it is selected by all code
which needs it and when selecting the Kconfig entry doing
the selecting Kconfig must either depend on or select all
the Kconfig dependencies of the Kconfig entry it is selecting.

> 
>>  	default y
>>  	select WATCHDOG_CORE
>>  	select P2SB
> 
> You can replace the "select" to "depends on" instead.

No that would mean that we start mixing select and depends on
for P2SB, where as currently all users use select.

Mixing select and depends on is know to cause dependency
cycle issues and thus should be avoided.

Arnd's patch is correct as is (and I have merged it
this morning).

Regards,

Hans



