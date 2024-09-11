Return-Path: <linux-watchdog+bounces-1855-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE4975213
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 14:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5DF91F218C9
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 12:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CD2187321;
	Wed, 11 Sep 2024 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eDutfCiW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A91922E9
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Sep 2024 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057676; cv=none; b=USYkdVsezyizatDo0YmuywyLZmdf8rM2WhEcmMmrLhKnhG27ClzWDxZ20wU8id/mf6AM8R4RuV/QaVJbCkp/dMCAUeO7G7YnMhyTmXAwJDCe1UyEAvO3xbmpcKU3D0u51dr/+PoUEQ7n43fOi1NEGLF7cRq2RoWta7Hmu8vB9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057676; c=relaxed/simple;
	bh=hCyv+3gn+MQYPHXJntRjENuvk/D30440d+7guoUICwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN8a/kB0ci38eT5OdFKwTAorhReeZdmIgr46qQ9CtYU+vdurkHh5oVQCsrD+Tb6HTS1lEqgg3Hw7cmrQeNYmXVIy+VAg5pibn0IHoGxkBWB8cxA5U0s6WcZuEsGZndRd6r3j6r7wGLDXTxkjv17fc6eSLakUeFkn+HhwDMTzBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eDutfCiW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726057673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/NSXqDGhdhn7Jx5pa1Emu+bzY3oWOLypAKpBZONwLs=;
	b=eDutfCiW9P9G4W0q9/o2hg+VigyQasJjSNiOkleUZoT87LGx7yOG+iRRuy/gCDoxtVmN74
	fbV2P7S2iTPTEy4/YnyFdh7rQqAdMlJLvZoe6WZQtFF9spMEZrAoUQ/OFozU7SsSCwsaP9
	JZjF24C1q2wk/Bdg8qCkIsptUvXrTXQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-ZKmWXSwANrqDfnZUCkjh_A-1; Wed, 11 Sep 2024 08:27:52 -0400
X-MC-Unique: ZKmWXSwANrqDfnZUCkjh_A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8d1a00e0beso107746566b.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Sep 2024 05:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057670; x=1726662470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/NSXqDGhdhn7Jx5pa1Emu+bzY3oWOLypAKpBZONwLs=;
        b=CuKudN0QRRQ619qeZfx7KObCU2nRrpvnJ9BJSyZGRxYIQcOoWxWl1y7WkdVXKTVFx4
         ooOXXPOSOPJvpy357m8kXOiA3BJddEO61Yzxg2Q3x51WU0YIx8zZcsvs6hGVknsya1KQ
         /8IeGOd5esQbFlPOc2ZKw8+GCGmkPr7KaNLKRyKCn+nGujQbxNKrZMXshtmTPCTy08+G
         NpBI1EwwWQnq5dG3lchGFYfiRtStt3kIdk5TmTbOxZ8EYNOGr54/RFqKu6vmP40xiGmQ
         7mHLSovx5lAVzwH4Ji+qT0D+Z1ZA8mIoNXMWwBpgfqxEKPgict16hJ0NGXFBkND6v1R7
         N6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAaZCYzBgADaieVuu7KRmBYl3tVajjhjoXD1ES2AckMrRO2/T/3IVYCIpdqViJWW794k0YJvTW15aA7rJlQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX30ft2AxFRxLPYWjGWwpWgwUQqaN5o0HVLm9BN2lvIroWFgbq
	aLmIjVwl+BwzGXvQLt496LVJdQFcA+9/U52QsoyqNqstzRpSmwXjTW53LR0dwS3mFj+Z7781PQE
	OUxrr+em9okov01PInV7dnaKzWhQHg1pTELAnWdsDbJ88oNvSNTJd7U/RzX48bceC
X-Received: by 2002:a17:907:d15:b0:a8a:cc5a:7f30 with SMTP id a640c23a62f3a-a8ffb29dd63mr451037666b.25.1726057670190;
        Wed, 11 Sep 2024 05:27:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/c1X3DRA/mWIVTcTk+QQnZxO9T4fi76uQn0cYUplb9zL6FkZdwQdjqe7jLbHQzM45Cmmfyg==
X-Received: by 2002:a17:907:d15:b0:a8a:cc5a:7f30 with SMTP id a640c23a62f3a-a8ffb29dd63mr451031966b.25.1726057669606;
        Wed, 11 Sep 2024 05:27:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25952c01sm611232466b.64.2024.09.11.05.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 05:27:49 -0700 (PDT)
Message-ID: <9158a89f-6e06-41ad-8c68-97ecc3409c16@redhat.com>
Date: Wed, 11 Sep 2024 14:27:47 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] platform/x86: intel_scu: Move headers to x86
 subfolder
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Utkarsh Patel <utkarsh.h.patel@intel.com>, Guenter Roeck
 <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Zha Qipeng <qipeng.zha@intel.com>,
 Lee Jones <lee@kernel.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20240909124952.1152017-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240909124952.1152017-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/9/24 2:41 PM, Andy Shevchenko wrote:
> Add the record to the MAINTAINERS to follow what is going on with the
> Intel MID platform related code and drivers.
> 
> With that, clean up a bit a couple of headers, i.e. move them to x86
> subfolder of include/linux/platform_data where they belong to.
> 
> No functional changes intended.
> 
> Taking into account nature of this change it's supposed to go via PDx86
> tree, please Ack.

Since the changes outside of drivers/platform/x86 are tiny and the merge
window is close I've decided to take the series without waiting for acks:

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
> v2:
> - Maintained --> Supported (Dave)
> - added two cleanup patches (Mika and me)
> 
> Andy Shevchenko (2):
>   MAINTAINERS: Add Intel MID section
>   platform/x86: intel_scu_wdt: Move intel_scu_wdt.h to x86 subfolder
> 
> Mika Westerberg (1):
>   platform/x86: intel_scu_ipc: Move intel_scu_ipc.h out of
>     arch/x86/include/asm
> 
>  MAINTAINERS                                   | 20 ++++++++++++++++++-
>  arch/x86/include/asm/intel_telemetry.h        |  2 +-
>  arch/x86/platform/intel-mid/intel-mid.c       |  3 ++-
>  drivers/mfd/intel_pmc_bxt.c                   |  3 +--
>  drivers/mfd/intel_soc_pmic_bxtwc.c            |  3 +--
>  drivers/mfd/intel_soc_pmic_mrfld.c            |  3 +--
>  drivers/platform/x86/intel_scu_ipc.c          |  2 +-
>  drivers/platform/x86/intel_scu_ipcutil.c      |  2 +-
>  drivers/platform/x86/intel_scu_pcidrv.c       |  2 +-
>  drivers/platform/x86/intel_scu_pltdrv.c       |  2 +-
>  drivers/platform/x86/intel_scu_wdt.c          |  3 ++-
>  drivers/usb/typec/mux/intel_pmc_mux.c         |  3 +--
>  drivers/watchdog/intel-mid_wdt.c              |  5 ++---
>  .../platform_data/{ => x86}/intel-mid_wdt.h   |  6 +++---
>  .../linux/platform_data/x86}/intel_scu_ipc.h  |  4 ++--
>  15 files changed, 39 insertions(+), 24 deletions(-)
>  rename include/linux/platform_data/{ => x86}/intel-mid_wdt.h (74%)
>  rename {arch/x86/include/asm => include/linux/platform_data/x86}/intel_scu_ipc.h (96%)
> 


