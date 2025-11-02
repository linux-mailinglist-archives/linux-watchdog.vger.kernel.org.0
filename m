Return-Path: <linux-watchdog+bounces-4500-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1249C2996A
	for <lists+linux-watchdog@lfdr.de>; Mon, 03 Nov 2025 00:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A56A34E47E3
	for <lists+linux-watchdog@lfdr.de>; Sun,  2 Nov 2025 23:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2DB1A01C6;
	Sun,  2 Nov 2025 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLkdI3On"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08A6846F
	for <linux-watchdog@vger.kernel.org>; Sun,  2 Nov 2025 23:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124717; cv=none; b=PzhYzZv7hwWAPxf4MZF4SHVo4L2dkaRqUPqAa2sXWVwfU1Uatw3FxyLHj2H1OOkVG2qPkTpnNf+HxV2PV7egosItO/GaWYrJgQHrycOWIvkDbGwYXaaGP+PYNYCnWQAQN2QVdOIIqkDXQz72P43MtUs62MYSFOhLvkWqMpH2q24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124717; c=relaxed/simple;
	bh=wG/TB/yBUOa5PfKMTvyXFGJg1zEUMEZaOs6dpKyYV7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jmmP/UBWsfG9u/NjUDbkHF8iHf/A0bkUKR2J0rOXmESG9H8X0wbED5GItLT6yLKJfsBP+etwU9B7tP0SU/s9fgMyTN54UvPsqBLDcadGONMIwfzAz/Y0I82ESQl/Ran6RnHs8S/JETEl78/KO9o6lcgUoTyJW18OUjPJntLzCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLkdI3On; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3779898b3a.1
        for <linux-watchdog@vger.kernel.org>; Sun, 02 Nov 2025 15:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762124715; x=1762729515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G9e650DG6U+kXqpscGtLd6L6xEiKmB25aynSmc10qEE=;
        b=aLkdI3OnCtFO0HXjkzM6imiwinX3OSIMU9W7MD233HjHOQzdmKhFOtyFsBOWXmh0li
         7snj5gN9mpKhfq4eot96hmrO85CDmaFFVZnBRVdq8sa1aDVBX8Pe5bUDAMrJ/j0uwjzI
         4/Miq1eknCSpiDcV+9pufXRVDUSouDqr6iNmAjB0wSjvsInUFT7zV9gJW1sNgquen1lG
         +nh5DjooAOZCIjkcMafdCiBWgeOo7P2q8M3x8UgE9OxzUVjFO89iShnI398MWOANyiiv
         D+lBfXeAslxj39DN8GBKx8X9gKTMFe0rFxl59mHm5e+t1e+ai+qkMGBkPeWs13LAiOxT
         tzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762124715; x=1762729515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9e650DG6U+kXqpscGtLd6L6xEiKmB25aynSmc10qEE=;
        b=lrNIN6OMmnAEkzm29uCvw7CE1yl6of7bh0dojdsuCGVaBAeD6YImP3wf9UeLiqnqen
         tT+T44rczUrXT+6LZ0WzhDeMfe1nwbtrFpAyEjIoRVDutxezwnZ8jz1HRep8oO9gPvVC
         QnNdCOpDg7+Ll0J10Xc7Y4Atp0+g56fwu/rIu2BG6vtyZ3GfwumV9rSVcZFpz2lHsNF+
         12ZEMxKaaoWg87vY3yuWNhESzAByPBrBrx7EBKtRMmcVcpvnjqPvi3xpWPew49BHWeqg
         +uT4wTGXsa4MFF+95kajQobj95Djsa61+aPM1foGOf5gvaDE211bnphgbmU0aL7h+UUM
         00FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgAV2uBmc/jwdK5SLpEDCZzAWja2Udo5mkmCuXyBbjQh5yohfNGJqab6iDJ50dfGAa5TxAu7v8LW2cOw/NAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFgwcgeIUJY0nhIRbCNDnQxgfPyKc9rXdPNB1jcoZtcgg8Iti
	GJ5qyu71guxrgYyrZaKFuwxFC9894iThsESP/d7dvGSgba3dz6mx07ZX
X-Gm-Gg: ASbGnctcuvzYzkzh68dDfZc6jteK1VYzYqfNkiXsovXyo/HiM4MtkQxL1p6sCkThbc9
	QA0xm9vH3K0giuuILOXndbAric9QHJprh+rg8l1N1irESe8fv2uep4WRLWorF0AmbUQYRzXLkfZ
	/A25EBm61nxZWmpz5TT9dAVl+8dTq98RABeGPelyN6wlhHLvjObhkI0nVmepCxb0/yYai8w5Keo
	78LVj891EfX+JJoUNCnSV1/jtptKpaermmQiJNwHWatdf1Mvizqgl2WiFbPpu5PjE1t2CuOnia2
	pOjSMVbO5fJJcCAp6UHNgNECBOCbt23Ab+pukb8tuqfiVyILjeX4sVOhdHkwPhqTCO2X1Ii85c4
	ppaxlm81+inb7qGwLbQZxz5HM8St+RWrEZ8szprGLCHMP0QCqywbo3iWUTJqqEdWy1Rl0XlZ9QM
	exlHdL4QJN8NFa+dwtwvWWyLgfygte3VWkGp2h9pykop+ifqn507qyxxp7SJk=
X-Google-Smtp-Source: AGHT+IGlJTgyGSsMQo9sCsFMIGOIdR99/zS9ytPFEE1UNZomlcRHBMl9rppbeMpOnObIopGkj8r8XQ==
X-Received: by 2002:a05:6a00:2d11:b0:7aa:1e36:207 with SMTP id d2e1a72fcca58-7aa1e3610efmr3976233b3a.15.1762124714851;
        Sun, 02 Nov 2025 15:05:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e764sm9005578b3a.3.2025.11.02.15.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 15:05:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4a11992c-023e-4d8d-859f-9abb659ed4c1@roeck-us.net>
Date: Sun, 2 Nov 2025 15:05:13 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog/diag288: Fix module comment typos
To: Zoe Gates <zoe.blair.gates@icloud.com>, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, wim@linux-watchdog.org, linux-s390@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <fe09cb336dca5f277769b115dae55b9639dc92a7.camel@icloud.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <fe09cb336dca5f277769b115dae55b9639dc92a7.camel@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 21:01, Zoe Gates wrote:
>  From ebec904b22077c3ebd0a18956397a9b0540a2714 Mon Sep 17 00:00:00 2001
> From: Zoe Gates <zoe@zeocities.dev>
> Date: Mon, 27 Oct 2025 22:14:50 -0500
> Subject: [PATCH 2/3] watchdog/diag288: Fix module comment typos
> 
> Correct spelling and capitalizaion in the header comment so the
> documentation reads cleanly.
> 
> Signed-off-by: Zoe Gates <zoe@zeocities.dev>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/diag288_wdt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/diag288_wdt.c
> b/drivers/watchdog/diag288_wdt.c
> index 887d5a6c155b..656b937f7653 100644
> --- a/drivers/watchdog/diag288_wdt.c
> +++ b/drivers/watchdog/diag288_wdt.c
> @@ -6,10 +6,10 @@
>    * to CP.
>    *
>    * The command can be altered using the module parameter "cmd". This
> is
> - * not recommended because it's only supported on z/VM but not whith
> LPAR.
> + * not recommended because it's only supported on z/VM but not with
> LPAR.
>    *
> - * On LPAR, the watchdog will always trigger a system restart. the
> module
> - * paramter cmd is meaningless here.
> + * On LPAR, the watchdog will always trigger a system restart. The
> module
> + * parameter cmd is meaningless here.
>    *
>    *
>    * Copyright IBM Corp. 2004, 2013


