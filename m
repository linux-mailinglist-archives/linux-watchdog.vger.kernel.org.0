Return-Path: <linux-watchdog+bounces-4606-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8BC64DCD
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 16:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 48B4628EFA
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 15:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5407F270EBA;
	Mon, 17 Nov 2025 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDA6PxZk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217413370F2
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393078; cv=none; b=F7/SSJr3Xs/gT9QV2mFuVhg2PwKUxXtfB9zwMDV+ChDhH8gpV8ZXvA1+YCptuPDCsroZeQmuhmbnfXXvrjlRyrPHiPNk5OMkJqts1GlwNES4mH1rWz/lcSpTnIGR+4KTS96+B1O8Bcpt9mga0LJuvUVNUNoHOw9XPFdjviLUG1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393078; c=relaxed/simple;
	bh=BrI7oN/gW4IccJJk3cioKiIJZA4rsaicJtpTf8J1ZcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M45WlYzA8MsnrMiriF0yTaFNGZz5zfeaYwJK+R0UzCiYW7N5uMVvNMv9tU1/xjqZ5b8Ue99phvpTF1tdzfJhZuJug+N9dje8+7ZV61banjoY1CzWsIeVglGNwZNRDAtBCbff4Kn7LHCxN9I63WEoSWmEqqrFYRZeAMG4q6+9wg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDA6PxZk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2958db8ae4fso40768385ad.2
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 07:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763393075; x=1763997875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zoq4aC9kle0K5A78aH0c2WTFCpMzgvcADSnyRnsuEAc=;
        b=GDA6PxZkzIYLvRF8aqAjRlx57kD7SVcZJ95IfldlOx0LVvm1PFvnMYdFJPT4VSJdLh
         lDRm7+cZC6idqt/CpSNMP1GgfkfCTOSsAF5tRIZK9ESV2lArSZDVaeWoEQGFqBTUpOeD
         3VseNIsPcowIyQQuca0Hsai4cEqlXvVBRzSLHmX/goSzG231goYQSKuxvYrx5Vpdtaxd
         a3DlWIU8g9CsqyP0TgDcsZ0WFaxJKFapAAwiKBP1ZM/FF4s/4y0GyiEmACFPyBAj8BoX
         kjQxFTEDETTBa3ovtVfPknru8ZET2GvL4JWFjnyWUeGi4cL4U9Vq2n12gDmyjNNW/ueu
         8czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763393075; x=1763997875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zoq4aC9kle0K5A78aH0c2WTFCpMzgvcADSnyRnsuEAc=;
        b=XGCcxfTFCknQkT/pBF+Yaku0GCCGoFh1jmmL5XYqzWFyQ+ZlNPK7+WvfN5R1zUqPVn
         LdAR+zppJCM0MrXGiQXu3gLHaNHksRN2oPg7K0Ae5rqqfwwUPSuU4dUm705wpJ4D6ynM
         1vLuyuAyaC8fG2FHCV1WHuh8CZbKURxNIBK8qeqTjooCKXbhvvZ0n3PvFrF+Mr9x+gRk
         gO/10Lxns1q7i1BtI/q0MeXBF60g4k+vJtRrx5Khlni6Vo4IR9DVHfQJIFmSO5GsL0Xe
         jdDqwh+WlTwJQ0EJEZ0Or+nglgukLzVxamsE+wHHUn3q3b+qS2ewgrdy+JHnD0SyT6j8
         xyOw==
X-Forwarded-Encrypted: i=1; AJvYcCV5sgqOdL0HdYOoTWoysw5cLS9vgsjhuVUT8NUAmduZAGUf6sN74mNHqVZZQ3+ZIxjFtkb0eiwG3k6PEcRhMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhANTLwSqyR4njOixaomOZ1ay8niPhfIQbbgoFqeJJHCVTI8+v
	XuIJUiSBc62HrEbW7n5JXx7eGZy54I9QYXQum8Qy37FjKTvgl4OOFjQSSXD+cQ==
X-Gm-Gg: ASbGncu8k7+ZsgK++DNJt4RJCFFS7o7UDatbE++YGYkxDdAn+0lEdeUjeCsJnpjHu/2
	Efh8d7hZdqN1pfsRqzo4k2KH9//+PxC02QMSE+NYfNF9rBpNB0fC2HgXSl1eJi8Idyme+oiepww
	F82C9JwjgCt0gvq90bVCN5whh6E5rS+BzoWjAzJnPpWzoKhJc4I+3krDoyQTJUCucRRfROyhMph
	mhJzMnBoP5JJu6V2zDAAIHVfvLdbL6E/uw6dlRbx0KAT16Oa6noC3/xQn9Ys6mFLqtjSRq/r3ES
	gCLtraKudp5aim3bk1oP+8EO0eWZx1eKsz3HgeaqpjLTpIv40jl0zJkU3DrJ4jwrkRSJ72kQBwy
	yTAw4wyOZ5HPC1Sc1xC//uCFiQh0hBbXBqwm+S0lCqpToSglQchTT/27YuJCl7b5DUbBQAsAnsA
	Pk8xfCkyl0DF5/sOlMefC8xLRJaoHz2QfpaKFCwUejEnmUBJploV/D0b7nZb1nyITFf8yWIQ==
X-Google-Smtp-Source: AGHT+IEiIT2ZzKafX7P6IDpWWVgda39gy4Bf/RghcaRFGxs+zZinBv+sla+MJC322OIgoH+Kt5iooA==
X-Received: by 2002:a17:902:f78c:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2986a75010cmr131694105ad.47.1763393075217;
        Mon, 17 Nov 2025 07:24:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f61bea9sm12392071a12.14.2025.11.17.07.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 07:24:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e8b8940a-2cfe-4dea-99be-e1902f19b922@roeck-us.net>
Date: Mon, 17 Nov 2025 07:24:33 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
References: <20251117.131124.1452225967649047223.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251117.131124.1452225967649047223.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 04:11, René Rebe wrote:
> Some products, such as the Ugreen DXP4800 Plus NAS, ship with the it87
> wdt enabled by the firmware and a broken BIOS option that does not
> allow to change the time or turn it off. As this makes installing
> Linux rather difficult, change the it87_wdt to report it running to
> the watchdog core.
> 
> Signed-off-by: René Rebe <rene@exactco.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1:
> - just clear hw timer register
> v2:
> - detect running hw timer and report to watchdog core
> v3:
> - multiply TOV1 in _wdt_get_timeout
> - don't wrongly and superfluously set .max_hw_heartbeat_ms
> - don't call set_timeout manually
> v4:
> - simplify to wdt_running
> - move code up to not move superio_exit
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index 3b8488c86a2f..8ba7e03857ca 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -188,6 +188,12 @@ static void _wdt_update_timeout(unsigned int t)
>   		superio_outb(t >> 8, WDTVALMSB);
>   }
>   
> +/* Internal function, should be called after superio_select(GPIO) */
> +static bool _wdt_running(void)
> +{
> +	return superio_inb(WDTVALLSB) || (max_units > 255 && superio_inb(WDTVALMSB));
> +}
> +
>   static int wdt_update_timeout(unsigned int t)
>   {
>   	int ret;
> @@ -374,6 +381,12 @@ static int __init it87_wdt_init(void)
>   		}
>   	}
>   
> +	/* wdt already left running by firmware? */
> +	if (_wdt_running()) {
> +		pr_info("Left running by firmware.\n");
> +		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
> +	}
> +
>   	superio_exit();
>   
>   	if (timeout < 1 || timeout > max_units * 60) {
> 


