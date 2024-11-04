Return-Path: <linux-watchdog+bounces-2410-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E053C9BB086
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2024 11:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66FC3B24D19
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2024 10:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F8F1AF0B8;
	Mon,  4 Nov 2024 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXdWVQbx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38C18B462
	for <linux-watchdog@vger.kernel.org>; Mon,  4 Nov 2024 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714696; cv=none; b=SlyLI5ORptd3yR7TQgdYQzIJJckHPWR9GdfzYofDC5XQMSSrddCgipixNKvjmwXmGHGUUbivhJVDrmfBvzsONhN3PH7HSFWUxI/85OseHt89dNV1Y9BiEUqlULVtjQfGGDfErsYSxo5AKrvlSm0PmhkDOrbUDavWVu4eB5L1fS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714696; c=relaxed/simple;
	bh=j6FK+QcFXV1PXLH5fQz7HwdZu+CP4alnNimVP6X1tMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a59e34a99p3i5I+0155B/Bz7oIGYUmoWWacouT/hSwgHFOP1rjX+lbFJrLoJlhqMpDnWMivm3WDH0+0oy22FZirNEOdGNTRvYn+Sc8Oe+GIz+lopPatBpSOAaFTJC7VXn/6x8TpyBENlGTk0fnCWgNMzC059hYsE7l9YFWhXaZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXdWVQbx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730714693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr0x/642zGcE80hVGdWJ4xDKS0hjceKOyLETD5XhvJ4=;
	b=JXdWVQbxSaXCbyVj4z4CgyQsOs9dvtZPKrRmdITV8IX1q8maxSGZbWv5NSQ9BT0p5LjL18
	Ekykut5s9Ar1ov3NsaP7GK2ixzrOwen9r9TYUXqXpDA39ljNv0LavAXnIgE3RT4vrPGQhM
	2+vmAreh93ywA58BGmqtKalxvjXuTRo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-F49TwIPFMj6n34QLLjC99Q-1; Mon, 04 Nov 2024 05:04:52 -0500
X-MC-Unique: F49TwIPFMj6n34QLLjC99Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a0710ca24so291300166b.3
        for <linux-watchdog@vger.kernel.org>; Mon, 04 Nov 2024 02:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714691; x=1731319491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rr0x/642zGcE80hVGdWJ4xDKS0hjceKOyLETD5XhvJ4=;
        b=v8tAvyseKgB9RQS0X31Mh2X5TFS5aY2/9wFAZ0LWafy9P9YYKubFB+jsM/s7qezd0a
         x5LmmH/onHx0tLSkcfHhKx9N0GXMcj4Oy5sbPlWA/ShWCPBOkspfCm6WSiP2CoP7iYwy
         oKf3trTV54is2ItgdbT9bp/wkjmq7V/2Yd9WObYleTtVlX1sNkiVE03pLT4js5nlWjFR
         FfK0FA3latlcKXdrqJOKxMNSzrkcRwB8TRc8f6H5d/x6K1etTzDUfx+UVVDq1IBsxY20
         VHKh30ycXT4bjhcQ03YaEN80sUupFRqE/WA2hrux5q4s1hZPw792oCO8izLneXoVod5M
         o5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXNfHp8cp4P+YgnkfzoFpQMSjDUwd9UkvndINqnIJr/HafSh9ZQ3MMwaTYx/h1dCN/hXiW7Ly4qdI6V6EEDIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2fxD1SyABCTvl8lB78xKNYWxfvvfwVc/VP3fcOIxcJBrlfrZ
	oK8Kc5LuG8cjBUUOXGvB+MVrYvZe/voIcl6UISlrymYC9doKOiqMTEsenl9A6qyROjjdfUIJT3A
	QSeBb6lZi4SiYg/rh5aKA5gwGH5yl1H2uyiqMmGwZG7wQoJM2yJYKP++ptEpXn5r6
X-Received: by 2002:a17:907:1c1d:b0:a9a:24a2:180b with SMTP id a640c23a62f3a-a9e3a7f2174mr1755623466b.57.1730714690985;
        Mon, 04 Nov 2024 02:04:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk/6X5iphD0pbEQ2fucbUHyw3wo9CHjAKQ/X/7Vcp/jJ3z+kYYgLixvBF2Ri7qLRxsJUMjTg==
X-Received: by 2002:a17:907:1c1d:b0:a9a:24a2:180b with SMTP id a640c23a62f3a-a9e3a7f2174mr1755621466b.57.1730714690591;
        Mon, 04 Nov 2024 02:04:50 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7700dbsm4086192a12.34.2024.11.04.02.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:04:50 -0800 (PST)
Message-ID: <0f27f32e-bf00-4f9d-a0b6-0625a6dae203@redhat.com>
Date: Mon, 4 Nov 2024 11:04:47 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/1] MAINTAINERS: replace bouncing maintainers
To: Lee Jones <lee@kernel.org>, konstantin@linuxfoundation.org,
 baocheng.su@siemens.com, tobias.schaffner@siemens.com, pavel@ucw.cz,
 ilpo.jarvinen@linux.intel.com, wim@linux-watchdog.org, linux@roeck-us.net,
 Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org,
 felix.moessbauer@siemens.com, christian.storm@siemens.com,
 quirin.gylstorff@siemens.com, chao.zeng@siemens.com
References: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
 <20241028112359.3333152-2-benedikt.niedermayr@siemens.com>
 <173048213838.1966999.11456105703949125929.b4-ty@kernel.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <173048213838.1966999.11456105703949125929.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Lee,

On 1-Nov-24 6:28 PM, Lee Jones wrote:
> On Mon, 28 Oct 2024 12:23:59 +0100, Benedikt Niedermayr wrote:
>> Since complaints about bouncing maintainers raised [1] we have now a
>> replacement for maintainers that stepped away from their duties.
>>
>> [1] https://www.spinics.net/lists/platform-driver-x86/msg47105.html
>>
>>
> 
> Applied, thanks!
> 
> [1/1] MAINTAINERS: replace bouncing maintainers
>       commit: 64dd44a658065ab5595bbfe2cb4d8fd30c9e34a2

I'm not seeing this on either of:

https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/log/?h=for-leds-next
https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next

?

Note I'm fine with you picking this up, I just want to make sure that
it does not fall through the cracks and drop it from my own patch queue
since it also touches pdx86 MAINTAINERS entries.

Regards,

Hans



