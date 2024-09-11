Return-Path: <linux-watchdog+bounces-1863-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B12DC97557C
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 16:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39A2D1F27AFD
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 14:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A527A1714AC;
	Wed, 11 Sep 2024 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXkd+WyC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A37719E992;
	Wed, 11 Sep 2024 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065163; cv=none; b=d3wZYmGJBn1PKXK4GlZ8de6Suw76aK67CbAJgU5g1zMatu01xnVv86yGHkczp9TxvnKfpaAT/U73FnH4gGC7+KU8GxIF+hSWx2basRPzDnO9uIUQd0ONmlHkip9glaISkQgAk3/RpSBHgdqiEfBs3kYh8IP0T0dFtkzkYD3xssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065163; c=relaxed/simple;
	bh=jfcMosZKGqQXI5QVRMHCF+GKS0zzHRVNb0uYU3UNrv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyMA1ZmS9rp3OIZgSOnoEtnhcOuqCuQs9o40TBOkdQcYQEShtNIWWeWn6h3Iwj7KmskUJp3DMQe/l7NGOy5JuV51XshCRt7JzBIIw25XbY3HUeGv7Xj9VtUSJOTuRTszEGwBswn3DtZg+QczK0s7BaT5R3cSeP3fQopjuyhlyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXkd+WyC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2057835395aso21981315ad.3;
        Wed, 11 Sep 2024 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726065161; x=1726669961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=n5NidkcZrH/768JCnNFNiqCS2fmQO/daX4yiCZWTu7U=;
        b=SXkd+WyCiMYa59WlUUysXP8LkUvL1Ij2zxs+QgVe9IV1zbCwq1bLlthLfXiZXGkE7Q
         BIaEfynTBT0KWEkOk/x8ho+mpBTOq1xd923TAhdU0PR1mY9ldWIur6UChD5vxAbD+vhO
         sAJIpPVR1u/9rru0OQbRO1jbWCXKQ7Xz/c2frq28tE3isskrdjghTy/mICxxmtETM7GI
         +R1AujkDTxmLUiyJXodtzXtePxHzF/mGwZvtAc3vAZ0jpHo5RzXNyoGYfUkh19/vl9FJ
         j8IuTNDu+xSAQIC0Lieg3IhNqGcTdWJdRqlFqlETPFI05bhBstn266E/r+KHvsOLK0R3
         H9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065161; x=1726669961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5NidkcZrH/768JCnNFNiqCS2fmQO/daX4yiCZWTu7U=;
        b=SKqHp3bnj4N/jfVuGuDlftYXI3vgJEhB/LdEjIqPgqNCztf6NxzqJcA2SqRyg7Pitq
         J68rfMvnOy0GFl4fmGBIDUjgHUUcCUDUsnO1WGmIcji31dtko4ePEJGX3TY0OJGcz2v1
         4UQZRgAC6Wx6LDhYe/j9DGjMjNquvaDu4QMhUQ9KYa1RfhpkC/EF6u/u1XDAMt1ErhAH
         1Si9tSDa8OGqulUyhdZamg2hAOkwsCD5ETFMOX4RYPaeXgPC0QttTR4uxIYvDQlDZjV8
         HZ5H/voZqi31AriAYG5/60zMM9l2pTlfpUzhRsPob0FQPcH1Hoh4p6OW7SrNI/V0znqJ
         KYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDKaoy0sYJObIu4RpvEeopWlZECZPQ8JKMM9cBaXcgRr0ysXOxw6ElCkO40BhkDu+tkI2m1RoqI6m111ITFZhzpg==@vger.kernel.org, AJvYcCXr+wF4j6BJDFSPtdyFUsy63SB3nNPgmDtDSvmtpyNEgr54jV1Qo0tWW057m+kCnOAG/5P0cIFlClJQTkv9BH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5cmStYEFZ1zPOSRzIt1PMQK4cA0ztHaPMbO07DAJI7cPFjFL
	wjADEKLrTV5jsGsRYIX3XUI8eQDe/BaB/TdSOwCw2nFWaT2B2yTwZamqGw==
X-Google-Smtp-Source: AGHT+IFzD+FUIvWrv8kn+9weVA2+tVBqJmPPJP3gK0Y31lG3GTiu6ndHi1T+rXNls63xDDwwRu56XQ==
X-Received: by 2002:a17:902:e5c8:b0:205:3e68:7367 with SMTP id d9443c01a7336-207521971cbmr34531945ad.21.1726065160685;
        Wed, 11 Sep 2024 07:32:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af2568esm406515ad.14.2024.09.11.07.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 07:32:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3383bc21-9e51-40c4-8bee-07fc59437434@roeck-us.net>
Date: Wed, 11 Sep 2024 07:32:38 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rzv2h_wdt: Add missing MODULE_LICENSE tag to
 fix modpost error
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240911132031.544479-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240911132031.544479-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/24 06:20, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the missing `MODULE_LICENSE()` tag to the `rzv2h_wdt` driver, which
> resolves the following modpost error when built as a module:
> 
>      ERROR: modpost: missing MODULE_LICENSE() in drivers/watchdog/rzv2h_wdt.o
> 
> Fixes: f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Hi Wim,
> 
> As `rzv2h_wdt.c` still not in -next maybe we can merge this patch in
> original commit in the watchdog tree?
> 
> Cheers,
> Prabhakar
> ---
>   drivers/watchdog/rzv2h_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> index 2da7a631fb2a..1d1b17312747 100644
> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -270,3 +270,4 @@ static struct platform_driver rzv2h_wdt_driver = {
>   module_platform_driver(rzv2h_wdt_driver);
>   MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
>   MODULE_DESCRIPTION("Renesas RZ/V2H(P) WDT Watchdog Driver");
> +MODULE_LICENSE("GPL");


