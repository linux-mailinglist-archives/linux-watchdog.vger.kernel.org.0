Return-Path: <linux-watchdog+bounces-4590-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375CC5E8AE
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 18:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0D45421CF5
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 17:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9D9324718;
	Fri, 14 Nov 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUhue7t2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3E22A7E6
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763141125; cv=none; b=Oq06eHfl+VEgI0la+gW3e3KdCc2w3u1BPYGUZh4QkCB82kIQRQjg7TmhY401lze43DLCesLjehTnO7IpPvCdw0h6ls93NxgPBdiPbHi/Wqiq2Y2AJQ0OuCYrPg8Ye98Fcv20MUTafns0GdNVcnkr/DoJ1DzZCTdrsa9C0vOVA2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763141125; c=relaxed/simple;
	bh=8k6q5mRk1XTIR7amC946xgIqaM/Ano2L6tYsDBfVW1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ROzu8mtQNxkw1IG2y3TCM1K6PmIQucVgNPUVBdLRuwwgxiSqkr6wfhtCqa4WLb0GlqYpHbuYJNVnkq+rx+zeGkJkp+KpBBslzL0BwGJHSWm23cW0OmKBNfTPQOH6MmLyG4F24A+Gu0fYVvZmrHA2l1EFU2P3oIyQ2oS3NMs0z10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUhue7t2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297d4a56f97so22727375ad.1
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 09:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763141123; x=1763745923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+TJ7qSgbNY7U0KbkvEFBHfUEk24STe2kWuGhcog5xY8=;
        b=NUhue7t2e2ck01ZrkStCMGae5n74+kNakja/4ARdotU2wdQesWPSK8KeL4byuBZGh+
         jMj9lCHqofMMvdCo6gTiDfn6nByo3UgWkH27Xww7oBmVRBh9gFByd8xi9ef8XjxJoe2K
         j1k/TUnyAbv3zjp+iaP4f9qZTAs627p2Q+QR9LFssJ6y2kkb6ND5FyvxTBZEZC2xbxKl
         39Py/tbje01sDRVAFMvBZ/9MKU1AsnmdO/6Q7EDtfa8/MeqPfuf7eVs5lvdp87l8wV40
         7NLA9wHBtZeyKJYlNU1+6hSZ0JE3F6vYDEKLyBot+Gesr+Lgl36QtQDbH7ubQYYk+eC+
         WJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763141123; x=1763745923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+TJ7qSgbNY7U0KbkvEFBHfUEk24STe2kWuGhcog5xY8=;
        b=omiKEE4MVEVz10vte/pwZVRbPlGc3aeRzHKHbuR6wBWxejFbDJ6KbIAOknqeIJl3Ls
         gx1t8jhWXxf4QEnEt27TpuJOhAdQfVqCnGTkGt6Lg6nRotT14hhz8TzSbIijUvIe9YzP
         uRmjGxmJ2x7WKJIOUpSRIbf15GO0yU8WPsid3qehvuvYLt4BDbyhvUAeRnODXiYEOYt/
         TrH6tAhPXDkWD0kPaFAqEfP7pZYEG2yTHRk0t6petdQIzYa0Hsjquguun2jVnq+YS7Eh
         iQsv+EjoUrcghJi7gPV/Pa8Xdz805YEqRmTr4G15S+mvkblwm69jBWgc/hsESN6gNMmt
         FGVw==
X-Forwarded-Encrypted: i=1; AJvYcCURH2jAnDmSwFfj+TFM0qelPOHhINtDpbpURODN6DFK4CoczAOtA8X1gFyFWNf0JRlYl1VRqvtQSIkYESCbVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN1zQxGEunfbWT7OUEdgfMX6dCgKFfz+J2IIwgPj+7Ozr6kCiH
	kS0U9N5nfOD3ioX8muTZSwsqigcryf7K3NYS/7L7sTVt9LMVapTr8JZh
X-Gm-Gg: ASbGncvdB48x441nGnUOZF6f928spXOos1UwQzbImBI91ik0o6sUCId8EJ7+d5nLDgI
	6e+F6xyJLMhhO52ROyoXIlbNmfjw1B1UMf3sNCPL/AXu3I4ofnFE8wfsDKfNcjzsM+bSDkj38zZ
	8qLJBvWYv1dQ2/4wj+8J3/hoO1E9D2GmG3h6cYGMWSq5K3ks8FOnYEJTvUzqc57GdakVl419tXt
	J5bxVc4KGmpc2BYLiHxSl78V+i4nSYulNiODxo9yxHWMHpWraf6VSz/e9a+z6TsYFYdni9kjcTE
	qUjKnMi5PJ/eZQYUW0p4N0/zkcEgGcTY8RbNU6XJoa7oVO0hdsmSNomsVOf4kiaHKUBPz+K1oqv
	PnFBB7oT10do66G+5U3XWdTdytvmp4HnAQsACQyWSmK3dEBvZKJhCi4wlH93qORk/QajO2sm01w
	5j5zpKJulmrbYzMQFPvvFx+T+WEiJAZ800V+NZ/MST1Arfs6MTehNebzfKT0ggmL3oZeK2KQ==
X-Google-Smtp-Source: AGHT+IEPJBvIPapKTQfa4luzDOvm4b8B8kBtN4xawVYFvDA0pSLcRUgvzeCtrZDnTFqbpySB7I/EAQ==
X-Received: by 2002:a17:903:1b2f:b0:295:7423:4be2 with SMTP id d9443c01a7336-2986a6abf30mr43946575ad.3.1763141122652;
        Fri, 14 Nov 2025 09:25:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568ccsm60524375ad.50.2025.11.14.09.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 09:25:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0d406a59-ea24-43a0-bf2d-5f53ef8450a3@roeck-us.net>
Date: Fri, 14 Nov 2025 09:25:20 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] init it87_wdt to prevert early reboot
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20251114.163911.1677511234058361014.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251114.163911.1677511234058361014.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/25 07:39, René Rebe wrote:
> Some products, such as the Ugreen dxp4800 plus NAS, ship with the it87
> wdt enabled by the firmware and a broken BIOS option that does not
> allow to change the defautl time or turn it off. This makes installing
> Linux difficult and annoying instantly rebooting early in an
> installer; unless one loads and starts a watchdogd in the installer
> environment.
> 
> Change it87_wdt to initialize the hw wdt register to 0 to make sure it
> is disabled until it is actually requested to be used.

Wrong solution. The driver should set .max_hw_heartbeat_ms and, if the
watchdog is running, mark it as running by setting WDOG_HW_RUNNING.

Guenter

> 
> Signed-off-by: René Rebe <rene@exactco.de>
> 
> --- a/drivers/watchdog/it87_wdt.c	2025-11-06 16:36:17.474866809 +0100
> +++ b/drivers/watchdog/it87_wdt.c	2025-11-06 16:43:56.756190409 +0100
> @@ -374,6 +374,9 @@
>   		}
>   	}
>   
> +	/* disable, might be left active by the fw, e.g. Ugreen dxp4800+ */
> +	_wdt_update_timeout(0);
> +
>   	superio_exit();
>   
>   	if (timeout < 1 || timeout > max_units * 60) {
> 
>   


