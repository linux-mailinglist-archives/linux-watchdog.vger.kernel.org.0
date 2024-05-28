Return-Path: <linux-watchdog+bounces-1076-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC628D1D3A
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 15:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78770B2280C
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD19131E3C;
	Tue, 28 May 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mcxiyh3R"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDFA17C7F;
	Tue, 28 May 2024 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903483; cv=none; b=Y7NO2sWVawbJWSZiBTclVyts51qxfhQXjQ4NofeiZhDSCzFmI/apjaV2jx09892BXx3Fsn7mwTEd5DOgmIrXkcIxjGijVlEV+CkfY8J+gO4zTduQivE5dbNjm+jiCBramTK022VKJGU+gi/BLKOW5Thhs/mEf70YKNQdVzqP9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903483; c=relaxed/simple;
	bh=d/PzWi9qwp3gQF7kZ8Ej4uHSWw8xW9QHZYuQwYRPTDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uA4jIwQhU/bN7MCIgo3Xs4tyKcTVV1zdkW6LElPYxaV6lw7VmgDuz3l4jzallUz1J9hWUZ1H/LxpH6c1aKe0qYFGPsgr0N8HAw5xzY/f+Cp/9lDL0vtvERyqaX+umx0wPkI9yax4Dn7V0S8+fTxfaTykhGzq+k8qxfe54N8mO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mcxiyh3R; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f47f07aceaso7450415ad.0;
        Tue, 28 May 2024 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716903481; x=1717508281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6qJWbw1fdAeS4ogDSsgAOA+33bH6Pnzp7UwpXEY9FH4=;
        b=Mcxiyh3RIC8Xa0FF855QTAadacpMryJ8oRl6BvuV3wpqrUSAhi3kPW4YOFwhupp6/p
         RCkhQPEzGM6M29iwWxaRXqZ7u+7hKdj7rb5ZRCPxaP4E8tIcu0qUGuWZ2D8h4cfiApUG
         xaYP4IiOzXmgBXCdManVcng33upwn3Rxd969yHP6wqn2gBoj4ZFEsYymW4Ogm3mFsy+J
         H7rF/tivON1WRrcBnlQbP2+IQPzfi7J2gkan+RUCKJ+QLdcH12aJN4ZL3jNqZCEJLo2E
         +q6+ru+aSmyQQ9d43jwTrfkuW9x5i3HEBP64jKLyvWnXTdij5/qctZjDGf26lIDEpT0D
         q5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716903481; x=1717508281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qJWbw1fdAeS4ogDSsgAOA+33bH6Pnzp7UwpXEY9FH4=;
        b=AhAN5hiXeNp5NDMx/1/EYBvsEamK4cN1BLAF+xCmYiYmXT36wCUWcWw7n2XJsV7kl0
         C8LnqObUOJyGRgN9JFCtLbcxWhfbXkf5D3hX4cYZiVZYIqrdbdmVgBfp5TkOkOL0ZVZh
         oQYpn5sgC3CTnrYyKAc7bILzbtbrxOP/ajZRYpOyCLgIaURlGopGu8rFcSfOfH03YtQg
         2p9jKdM3HiSBxfJIRmVcEY9BaUbBJm5uA/pfjBFI8GogWJ63IjeWink29P4aBHPcomzt
         PtaSntrrUQ6BX+q7uSyPekIyDRuYvkpWfAe2/yfj4NtQq7hp4vi011sOfAlkRzjtXW79
         IuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUN2sEGPvsBkyBYE+QWNTG9nf+EvqPRWHC53S61A6DoiHhT9FvWP3mqtXauAyVpqYAVZBDkQGDPvSUhHmJvRFkmZeg7x33Rq65oH9Adc2i/z6kvWrhuRYsOQ/1UQD5PAaTv+GGDn/0GzHE374=
X-Gm-Message-State: AOJu0YyvCiqTrf19afHymQJcPmZMh6tvXGiQRusmWlnFAIfyuUe7/LgQ
	FJD8m8hD/Eo3/++dYhHEI/0KoGYX+bXPF22/RE6jAR0ZLMRkJzFLJBmZYQ==
X-Google-Smtp-Source: AGHT+IHAT/6DooQvh7OuDiCQ75Ef2Bo+NQPsHnxYwpQgTD/ELFosvTUwryX37WeHBX01HGENUtKwHw==
X-Received: by 2002:a17:902:e543:b0:1f4:6f3a:a13c with SMTP id d9443c01a7336-1f46f3aa69dmr82936765ad.47.1716903481174;
        Tue, 28 May 2024 06:38:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c760a21sm80123075ad.4.2024.05.28.06.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:38:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fed00be4-2974-40cb-9d87-6c7c69cc1b98@roeck-us.net>
Date: Tue, 28 May 2024 06:37:58 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: lenovo_se10_wdt: add HAS_IOPORT dependency
To: Arnd Bergmann <arnd@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 David Ober <dober@lenovo.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240528120759.3491774-1-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240528120759.3491774-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 05:07, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Once the inb()/outb() helpers become conditional, the newly added driver
> fails to link on targets without CONFIG_HAS_IOPORT:
> 
> In file included from arch/arm64/include/asm/io.h:299,
>                   from include/linux/io.h:14,
>                   from drivers/watchdog/lenovo_se10_wdt.c:8:
> drivers/watchdog/lenovo_se10_wdt.c: In function 'set_bram':
> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
>    596 | #define _outb _outb
> include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
>    655 | #define outb _outb
>        |              ^~~~~
> drivers/watchdog/lenovo_se10_wdt.c:67:9: note: in expansion of macro 'outb'
>     67 |         outb(offset, bram_base);
>        |         ^~~~
> 
> Add the same dependency we added to the other such drivers.
> 
> Fixes: 1f6602c8ed1e ("watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 5f91921afc79..24ea3b6f95fe 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -257,6 +257,7 @@ config GPIO_WATCHDOG_ARCH_INITCALL
>   config LENOVO_SE10_WDT
>   	tristate "Lenovo SE10 Watchdog"
>   	depends on (X86 && DMI) || COMPILE_TEST
> +	depends on HAS_IOPORT
>   	select WATCHDOG_CORE
>   	help
>   	  If you say yes here you get support for the watchdog


